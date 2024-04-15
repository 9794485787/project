<?php 
// Include the configuration file  
require_once 'config.php'; 
 
// Include the database connection file  
require_once 'dbConnect.php'; 
 
$payment_ref_id = $statusMsg = ''; 
$status = 'error'; 
 
// Check whether the payment ID is not empty 
if(!empty($_GET['pid'])){ 
    $payment_txn_id  = base64_decode($_GET['pid']); 
     
    // Fetch transaction data from the database 
    $sqlQ = "SELECT id,txn_id,paid_amount,paid_amount_currency,payment_status,customer_name,customer_email FROM transactions WHERE txn_id = ?"; 
    $stmt = $db->prepare($sqlQ);  
    $stmt->bind_param("s", $payment_txn_id); 
    $stmt->execute(); 
    $stmt->store_result(); 
 
    if($stmt->num_rows > 0){ 
        // Get transaction details 
        $stmt->bind_result($payment_ref_id, $txn_id, $paid_amount, $paid_amount_currency, $payment_status, $customer_name, $customer_email); 
        $stmt->fetch(); 
         
        $status = 'success'; 
        $statusMsg = 'Your Payment has been Successful!'; 
    }else{ 
        $statusMsg = "Transaction has been failed!"; 
    } 
}else{ 
    header("Location: index.php"); 
    exit; 
} 
?>
<?php include 'includes/session.php'; ?>
<?php include 'includes/header.php';
    if(isset($_SESSION['user'])){
		
        $name = $user['firstname'].' '.$user['lastname'];
        $email = $user['email'];
        $address = $user['address'];
        $mobile = $user['contact_info'];
	}


?>
<body class="hold-transition skin-blue layout-top-nav">
<div class="wrapper">

	<?php include 'includes/navbar.php'; ?>
	 
	  <div class="content-wrapper">
	    <div class="container">

	      <!-- Main content -->
	      <section class="content">
	        <div class="row">
	        	<div class="col-sm-9">
	        		<h1 class="page-header">Payment Confirmation Receipt</h1>
	        		<div class="box box-solid">
	        			<div class="box-body">
                            
                            <?php if(!empty($payment_ref_id)){ ?>
                                <h1 class="alert alert-<?php echo $status; ?>"><i class="fa fa-info"></i>&nbsp;<?php echo $statusMsg; ?></h1>
                               
                                <h4>Payment Information</h4>
                                <p><b>Reference Number:</b> <?php echo $payment_ref_id; ?></p>
                                <p><b>Transaction ID:</b> <?php echo $txn_id; ?></p>
                                <p><b>Paid Amount:</b> <i class="fa fa-rupee"></i>&nbsp;<?php echo number_format($paid_amount,2); ?></p>
                                <p><b>Payment Status:</b> <?php echo $payment_status; ?></p>
                                
                                <h4>Customer Information</h4>
                                <p><b>Name:</b> <?php echo $customer_name; ?></p>
                                <p><b>Email:</b> <?php echo $customer_email; ?></p>
                                
                                
                            <?php }else{ ?>
                                <h1 class="error">Your Payment been failed!</h1>
                                <p class="error"><?php echo $statusMsg; ?></p>
                            <?php } ?>
                            <a onclick="window.print()" class="btn btn-success" ><i class="fa fa-print"></i>&nbsp;Print</a>
                            <a href="index.php" class="btn btn-danger" ><i class="fa fa-home"></i>&nbsp;Home</a>
                           
                        </div>
                    </div></div>
                    
            </div></section>
