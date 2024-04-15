<?php include 'includes/session.php'; ?>
<?php
  if(isset($_SESSION['user'])){
    header('location: cart_view.php');
  }
?>
<?php include 'includes/header.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color:skyblue ;
            background-image:  url("images/Neutral Elegant Minimalist Interior Zoom Virtual Background.png");
            background-position: center;
            backface-visibility:  visible;
            background-attachment: fixed;
            margin: 0;
            padding: 0;
        }
        .login-box {
            margin: 5% auto;
            max-width: 400px;
            background: #fff;
            background-color: rgba(255, 255, 255, 0.8); /* Adding opacity to the background */
            border-radius: 5px;
            border: black;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .login-box-body {
            padding: 20px;
        }
        .login-box-msg {
            text-align: center;
            margin-bottom: 20px;
            font-size: 18px;
        }
        .form-control {
            border-radius: 0;
        }
        .form-group.has-feedback {
            position: relative;
        }
        .form-control-feedback {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            right: 10px;
            color: #ccc;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .btn-flat {
            border-radius: 0;
        }
        .callout {
            margin-top: 20px;
            border-radius: 5px;
            padding: 15px;
        }
        .callout-danger {
            background-color: #f2dede;
            color: #a94442;
            border-color: #ebccd1;
        }
        .callout-success {
            background-color: #dff0d8;
            color: #3c763d;
            border-color: #d6e9c6;
        }
        a {
            color: #007bff;
        }
        a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
<div class="login-box">
    <?php
      if(isset($_SESSION['error'])){
        echo "
          <div class='callout callout-danger text-center'>
            <p>".$_SESSION['error']."</p> 
          </div>
        ";
        unset($_SESSION['error']);
      }
      if(isset($_SESSION['success'])){
        echo "
          <div class='callout callout-success text-center'>
            <p>".$_SESSION['success']."</p> 
          </div>
        ";
        unset($_SESSION['success']);
      }
    ?>
    <div class="login-box-body">
        <p class="login-box-msg">Sign in to start your session</p>

        <form action="verify.php" method="POST">
            <div class="form-group has-feedback">
                <input type="email" class="form-control" name="email" placeholder="Email" required>
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" name="password" placeholder="Password" required>
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <button type="submit" class="btn btn-primary btn-block btn-flat" name="login"><i class="fa fa-sign-in"></i> Sign In</button>
                </div>
            </div>
        </form>
        <br>
        <a href="password_forgot.php">I forgot my password</a><br>
        <a href="signup.php" class="text-center">Register a new membership</a><br>
        <a href="index.php"><i class="fa fa-home"></i> Home</a>
    </div>
</div>
<?php include 'includes/scripts.php' ?>
</body>
</html>
