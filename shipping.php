<?php include 'includes/conn2.php'; 
?>
<?php

 


if(isset($_REQUEST['save']))
{
$_name=$_REQUEST['name'];
$_ClinicName=$_REQUEST['ClinicName'];
$_email=$_REQUEST['E-mailAddress'];
$_MobileNumber=$_REQUEST['MobileNumber'];
$_Address=$_REQUEST['Address'];
$_message=$_REQUEST['Message'];


$sql="INSERT INTO contact_us(name,ClinicName,`E-mailAddress`,MobileNumber,Address,Message)VALUES('$_name','$_ClinicName','$_email','$_MobileNumber','$_Address','$_message')";

$p=mysqli_query($conn,$sql);
  
        if($p)
        print "success";
        else
        print mysqli_error($conn);
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shipping Details</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            color: #333;                                                                     
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        img {
            display: block;
            margin: 20px auto;
            max-width: 100%;
            height: auto;
            border: solid black;
        }
        h1 {
            color: #333;
            text-align: center;
            margin-top: 0;
        }
        form {
            display: grid;
            grid-template-columns: 1fr 1fr;
            grid-gap: 20px;
            padding: 20px;
        }
        form label {
            display: block;
            margin-bottom: 5px;
        }
        form input[type="text"],
        form input[type="button"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        form input[type="button"] {
            background-color: #5cb85c;
            color: white;
            font-size: 16px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        form input[type="button"]:hover {
            background-color: #4cae4c;
        }
    </style>
</head>
<body>
<div class="container">
    <img src="images/shippingboy.png" alt="Shipping Boy Image">
    <h1>Shipping Address</h1>
    <form id="ShippingForm" action="" method="POST">
        <div>  
            <label for="Address1">Address1:</label>
            <input type="text" id="Address1" name="Address1">
        </div>
        <div>
            <label for="Address2">Address2:</label>
            <input type="text" id="Address2" name="Address2">
        </div>
        <div>
            <label for="State">State:</label>
            <input type="text" id="State" name="State">
        </div> 
        <div>
            <label for="Pin Code">Pin Code:</label>
            <input type="text" id="Pin Code" name="Pin Code">
        </div>
        <div>
            <label for="Mobile Number"> Mobile Number: </label>
            <input type="text" id="Mobile Number" name="Mobile Number">
        </div><br>
        <div>
            <label for="Message">Message:</label>
            <textarea id="Message" name="Message" rows="4" cols="30"></textarea>
        </div>
        <br>
        <div>
            <input type="submit" name="save" value="Send Message">
        </div>
    </form>
</div>
</body>
</html>
