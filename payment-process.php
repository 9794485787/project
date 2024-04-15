<?php
ini_set("display_errors",1);
include 'config.php'; 
?>
<script src="https://js.stripe.com/v3/"></script>

<script src="js/checkout.js" STRIPE_PUBLISHABLE_KEY="<?php echo STRIPE_PUBLISHABLE_KEY; ?>" defer></script>
<?php include 'includes/session.php'; ?>
<?php include 'includes/header.php';
    if(isset($_SESSION['user'])){
		$conn = $pdo->open();

		$stmt = $conn->prepare("SELECT * FROM cart LEFT JOIN products on products.id=cart.product_id WHERE user_id=:user_id");
		$stmt->execute(['user_id'=>$user['id']]);

		$total = 0;
        $dataArray = array();
		foreach($stmt as $row){
            $smallArray =[
                'product_id'=> $row['product_id'],
                'quantity' => $row['quantity'],
            ];
            array_push($dataArray, $smallArray);
			$subtotal = $row['price'] * $row['quantity'];
			$total += $subtotal;
		}
		$_SESSION['total_cart']= $total;
        $_SESSION['cardData']= $dataArray;
       // print_r($_SESSION['cardData']);
		$pdo->close();
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
	        		<h1 class="page-header">Payment</h1>
	        		<div class="box box-solid">
	        			<div class="box-body">
                        <div class="panel-body">
        <!-- Display status message -->
        <div id="paymentResponse" class="hidden"></div>
        
        <!-- Display a payment form -->
        <form id="paymentFrm" class="hidden">
            <div class="form-group">
                <label>NAME</label>
                <input type="text" id="name" class="form-control field" placeholder="Enter name" readonly name="name" value="<?php echo $name; ?>">
            </div>
            <div class="form-group">
                <label>EMAIL</label>
                <input type="email" id="email" class="form-control field" placeholder="Enter email" name="email" readonly value="<?php echo $email; ?>">
            </div>
            <div class="form-group">
                <label>Shipping Address</label>
                <textarea name="address" rows="5" cols="5" id="address" class="form-control field" readonly style="resize:none;"><?php echo $address; ?></textarea>
            </div>
            <div class="form-group">
                <label>Mobile</label>
                <input type="text" id="mobile" name="mobile" class="form-control field" placeholder="Enter mobile" value="<?php echo $mobile; ?>" readonly>
            </div>
            <div class="form-group">
                <label>Amount</label>
                <input type="text" name="amount" id="amount" class="form-control field" placeholder="Enter amount" value="<?php echo $total; ?>" readonly>
            </div>
            <div id="paymentElement">
                <!--Stripe.js injects the Payment Element-->
            </div>
            <br>
            <br>
            <!-- Form submit button -->
            <button id="submitBtn" class="btn btn-success">
                <div class="spinner hidden" id="spinner"></div>
                <span id="buttonText">Pay Now</span>
            </button>
        </form>
        
        <!-- Display processing notification -->
        <div id="frmProcess" class="hidden">
            <span class="ring"></span> Processing...
        </div>
        
        <!-- Display re-initiate button -->
        <div id="payReinit" class="hidden">
            <br>
            <br>
            <button class="btn btn-primary" onClick="window.location.href=window.location.href.split('?')[0]"><i class="rload"></i>Re-initiate Payment</button>
        </div>
    </div>
                        </div>
                    </div>
                </div></div>
          </section>
        
