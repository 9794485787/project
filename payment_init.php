<?php 
 
// Include the configuration file 
require_once 'config.php'; 
 
// Include the database connection file 
include_once 'dbConnect.php'; 
 
// Include the Stripe PHP library 
require_once 'stripe-php/init.php'; 
 
// Set API key 
\Stripe\Stripe::setApiKey(STRIPE_API_KEY); 
 
// Retrieve JSON from POST body 
$jsonStr = file_get_contents('php://input'); 
$jsonObj = json_decode($jsonStr); 
include 'includes/session.php';

if($jsonObj->request_type == 'create_payment_intent'){ 
     
    // Define item price and convert to cents 
    if($_SESSION['total_cart'])
     {
        $itemPriceCents = round($_SESSION['total_cart']*100);
     }else{
        $itemPriceCents = round($itemPrice*100);
     }
     
    // Set content type to JSON 
    header('Content-Type: application/json'); 
     
    try { 
        // Create PaymentIntent with amount and currency 
        $paymentIntent = \Stripe\PaymentIntent::create([ 
            'amount' => $itemPriceCents, 
            'currency' => $currency, 
            'description' => $itemName, 
            'payment_method_types' => [ 
                'card' 
            ] 
        ]); 
     
        $output = [ 
            'id' => $paymentIntent->id, 
            'clientSecret' => $paymentIntent->client_secret 
        ]; 
     
        echo json_encode($output); 
    } catch (Error $e) { 
        http_response_code(500); 
        echo json_encode(['error' => $e->getMessage()]); 
    } 
}elseif($jsonObj->request_type == 'create_customer'){ 
    $payment_intent_id = !empty($jsonObj->payment_intent_id)?$jsonObj->payment_intent_id:''; 
    $name = !empty($jsonObj->name)?$jsonObj->name:''; 
    $email = !empty($jsonObj->email)?$jsonObj->email:''; 
     
    // Add customer to stripe 
    try {   
        $customer = \Stripe\Customer::create(array(  
            'name' => $name,  
            'email' => $email 
        ));  
    }catch(Exception $e) {   
        $api_error = $e->getMessage();   
    } 
     
    if(empty($api_error) && $customer){ 
        try { 
            // Update PaymentIntent with the customer ID 
            $paymentIntent = \Stripe\PaymentIntent::update($payment_intent_id, [ 
                'customer' => $customer->id 
            ]); 
        } catch (Exception $e) {  
            // log or do what you want 
        } 
         
        $output = [ 
            'id' => $payment_intent_id, 
            'customer_id' => $customer->id 
        ]; 
        echo json_encode($output); 
    }else{ 
        http_response_code(500); 
        echo json_encode(['error' => $api_error]); 
    } 
}elseif($jsonObj->request_type == 'payment_insert'){ 
    $payment_intent = !empty($jsonObj->payment_intent)?$jsonObj->payment_intent:''; 
    $customer_id = !empty($jsonObj->customer_id)?$jsonObj->customer_id:''; 
     
    // Retrieve customer info 
    try {   
        $customer = \Stripe\Customer::retrieve($customer_id);  
    }catch(Exception $e) {   
        $api_error = $e->getMessage();   
    } 
     
    // Check whether the charge was successful 
    if(!empty($payment_intent) && $payment_intent->status == 'succeeded'){ 
        // Transaction details  
        $transaction_id = $payment_intent->id; 
        $paid_amount = $payment_intent->amount; 
        $paid_amount = ($paid_amount/100); 
        $paid_currency = $payment_intent->currency; 
        $payment_status = $payment_intent->status; 
         
        $customer_name = $customer_email = ''; 
        if(!empty($customer)){ 
            $customer_name = !empty($customer->name)?$customer->name:''; 
            $customer_email = !empty($customer->email)?$customer->email:''; 
        } 
         
        // Check if any transaction data is exists already with the same TXN ID 
        $sqlQ = "SELECT id FROM transactions WHERE txn_id = ?"; 
        $stmt = $db->prepare($sqlQ);  
        $stmt->bind_param("s", $transaction_id); 
        $stmt->execute(); 
        $stmt->bind_result($row_id); 
        $stmt->fetch(); 
         
        $payment_id = 0; 
        if(!empty($row_id)){ 
            $payment_id = $row_id; 
        }else{ 
            // Insert transaction data into the database 
            $sqlQ = "INSERT INTO transactions (customer_name,customer_email,item_name,item_price,item_price_currency,paid_amount,paid_amount_currency,txn_id,payment_status,created,modified,user_id) VALUES (?,?,?,?,?,?,?,?,?,NOW(),NOW(),?)"; 
            $stmt = $db->prepare($sqlQ); 
            $stmt->bind_param("sssdsdssss", $customer_name, $customer_email, $itemName, $paid_amount, $currency, $paid_amount, $paid_currency, $transaction_id, $payment_status,$user['id']); 
            $insert = $stmt->execute(); 
             
            if($insert){ 
                $payment_id = $stmt->insert_id; 
                $pay_id = $transaction_id;
                $sale_date = date('Y-m-d'); 
                // $sqlQ1 = "Update cart SET status='0' WHERE user_id=?"; 
                // $stmt1 = $db->prepare($sqlQ1); 
                // $stmt1->bind_param("s",$user['id']); 
                // $stmt1->execute();
                $sqlQ11 = "INSERT INTO `sales`(`user_id`, `pay_id`, `sales_date`) VALUES (?,?,?)"; 
                $stmt11 = $db->prepare($sqlQ11); 
                $stmt11->bind_param("sss",$user['id'],$pay_id,$sale_date); 
                $stmt11->execute();
                $last_inc_id = $stmt11->insert_id;
                if($_SESSION['cardData'])
                {
                    foreach($_SESSION['cardData'] as $d)
                    {
                        $sqlQ2= "INSERT INTO `details`(`sales_id`, `product_id`, `quantity`) VALUES (?,?,?)"; 
                        $stmt2 = $db->prepare($sqlQ2); 
                        $stmt2->bind_param("sss",$last_inc_id,$d['product_id'],$d['quantity']); 
                        $stmt2->execute();
                    }
                }
                $sqlQ1 = "Delete from cart  WHERE user_id=?"; 
                $stmt1 = $db->prepare($sqlQ1); 
                $stmt1->bind_param("s",$user['id']); 
                $stmt1->execute();
                
                unset($_SESSION['cardData']);
                unset($_SESSION['total_cart']);
            } 
        } 
         
        $output = [ 
            'payment_txn_id' => base64_encode($transaction_id) 
        ]; 
        echo json_encode($output); 
    }else{ 
        http_response_code(500); 
        echo json_encode(['error' => 'Transaction has been failed!']); 
    } 
} 
 