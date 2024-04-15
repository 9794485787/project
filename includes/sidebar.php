<div class="row">
    <div class="box box-solid glossy-box">
        <div class="box-header with-border">
            <h3 class="box-title"><b>Most Viewed Today</b></h3>
        </div>
        <div class="box-body">
            <ul class="trending-list">
                <?php
                $now = date('Y-m-d');
                $conn = $pdo->open();

                $stmt = $conn->prepare("SELECT * FROM products WHERE date_view=:now ORDER BY counter DESC LIMIT 10");
                $stmt->execute(['now'=>$now]);
                foreach($stmt as $row){
                    echo "<li><a href='product.php?product=".$row['slug']."'>".$row['name']."</a></li>";
                }

                $pdo->close();
                ?>
            </ul>
        </div>
    </div>
</div>

<div class="row">
    <div class="box box-solid glossy-box">
        <div class="box-header with-border">
            <h3 class="box-title"><b>Become a Subscriber</b></h3>
        </div>
        <div class="box-body">
            <p>Get free updates on the latest products and discounts, straight to your inbox.</p>
            <form method="POST" action="" class="subscribe-form">
                <div class="input-group">
                    <input type="email" class="form-control" placeholder="Enter your email">
                    <span class="input-group-btn">
                        <button type="submit" class="btn btn-info btn-flat"><i class="fa fa-envelope"></i> Subscribe</button>
                    </span>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="row">
    <div class="box box-solid glossy-box">
        <div class="box-header with-border">
            <h3 class="box-title"><b>Follow us on Social Media</b></h3>
        </div>
        <div class="box-body">
            <div class="social-icons">
                <a href="https://www.facebook.com/" class="btn btn-social-icon btn-facebook"><i class="fa fa-facebook"></i></a>
                <a href="https://twitter.com/?lang=en" class="btn btn-social-icon btn-twitter"><i class="fa fa-twitter"></i></a>
                <a href="https://www.instagram.com/" class="btn btn-social-icon btn-instagram"><i class="fa fa-instagram"></i></a>
                <a href="https://www.google.com/webhp?hl=en&sa=X&ved=0ahUKEwibq9i12_CEAxXRh68BHUeIBWsQPAgJ" class="btn btn-social-icon btn-google"><i class="fa fa-google-plus"></i></a>
                <a href="https://www.linkedin.com/feed/" class="btn btn-social-icon btn-linkedin"><i class="fa fa-linkedin"></i></a>
            </div>
        </div>
    </div>
</div>
