<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
ini_set("display_errors", 0);
require 'vendor/autoload.php';
$message="<h1>This is test mail</h1>";
$mail = new PHPMailer(true); 
$mail->isSMTP();                                     
    $mail->Host = 'smtp.gmail.com';                      
    $mail->SMTPAuth = true; 
    $mail->debug = 1;                                 
    $mail->Username = 'premghodake08@gmail.com';     
    $mail->Password = 'asll zypr wuzy hngk';                    
    $mail->SMTPOptions = array(
        'ssl' => array(
        'verify_peer' => false,
        'verify_peer_name' => false,
        'allow_self_signed' => true
        )
    );                         
    $mail->SMTPSecure = 'ssl';                           
    $mail->Port = 465;                                   

    $mail->setFrom('premghodake08@gmail.com');
    
    //Recipients
    $mail->addAddress('premghodake08@gmail.com');              
    $mail->addReplyTo('premghodake08@gmail.com');
    
    //Content
    $mail->isHTML(true);                                  
    $mail->Subject = 'ECommerce Site Sign Up';
    $mail->Body    = $message;

    if($mail->send())
    {
        echo  "Email sent.";

    }else{
        echo "not sent";
        exit;
    }
    ?>
