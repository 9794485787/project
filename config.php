<?php 
 
// Product Details 
// Minimum amount is $0.50 US 
$itemName = "Demo Product"; 
$itemPrice = 25;  
$currency = "USD";  
 
/* Stripe API configuration 
 * Remember to switch to your live publishable and secret key in production! 
 * See your keys here: https://dashboard.stripe.com/account/apikeys 
 */ 
define('STRIPE_API_KEY', 'sk_test_51OvwOJ04T1oBltFOT3xFMacJZSBLV0iirSqwFC9HxgVzMOYmRCYZE4NeA0QUEGAMOi3RHaZWhWC5ZYMHRzm33s4o00dZQ7QCtW'); 
define('STRIPE_PUBLISHABLE_KEY', 'pk_test_51OvwOJ04T1oBltFO2RsmdwBhu0zO7VDjAeHTJVsbpNUmKWJSkzVUv7dC0fFPmugYIICzDeVTI9C9uQmTjJwsdz4m00PFaLIBmE'); 
  
// Database configuration  
define('DB_HOST', 'localhost');  
define('DB_USERNAME', 'root');  
define('DB_PASSWORD', '');  
define('DB_NAME', 'final_project'); 
 
?>