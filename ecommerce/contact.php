<?php 
require('top.php');					
?>
<div class="ht__bradcaump__area bg__white">
    <div class="ht__bradcaump__wrap">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="bradcaump__inner">
                        <nav class="bradcaump-inner">
                            <a class="breadcrumb-item" href="index.php">Home</a>
                            <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                            <span class="breadcrumb-item active">Contact Us</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Start Contact Area -->
<section class="htc__contact__area ptb--40 bg__white">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 col-md-6 col-sm-12 col-xs-12">
                <div class="map-contacts--2">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4284.431428446375!2d105.7696949777546!3d10.029987852918598!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a0895a51d60719%3A0x9d76b0035f6d53d0!2zxJDhuqFpIGjhu41jIEPhuqduIFRoxqE!5e0!3m2!1svi!2s!4v1681636477165!5m2!1svi!2s" width="660" height="500" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
            </div>
            <div class="col-lg-5 col-md-6 col-sm-12 col-xs-12">
                <h2 class="title__line--6">CONTACT US</h2>
                <div class="address">
                    <div class="address__icon">
                        <i class="icon-location-pin icons"></i>
                    </div>
                    <div class="address__details">
                        <h2 class="ct__title">our address</h2>
                        <p>Xuân Khánh, Ninh Kiều, Tp. Cần Thơ</p>
                    </div>
                </div>
                <div class="address">
                    <div class="address__icon">
                        <i class="icon-envelope icons"></i>
                    </div>
                    <div class="address__details">
                        <h2 class="ct__title">email address</h2>
                        <p>daib2016954@student.ctu.edu.vn</p>
                    </div>
                </div>
                <div class="address">
                    <div class="address__icon">
                        <i class="icon-phone icons"></i>
                    </div>
                    <div class="address__details">
                        <h2 class="ct__title">Phone Number</h2>
                        <p>037.300.1425</p>
                    </div>
                </div>
            </div>      
        </div>
        <div class="row">
            <div class="contact-form-wrap mt--60">
                <div class="col-xs-12">
                    <div class="contact-title">
                        <h2 class="title__line--6">SEND A MAIL</h2>
                    </div>
                </div>
                <div class="col-xs-12">
                    <form id="contact-form" action="#" method="post">
                        <div class="single-contact-form">
                            <div class="contact-box name">
                                <input type="text" id="name" name="name" placeholder="Your Name*">
                                <input type="email" id="email" name="email" placeholder="Email*">
                                <input type="email" id="mobile" name="mobile" placeholder="Mobile*">
                            </div>
                        </div>
                        <div class="single-contact-form">
                            <div class="contact-box message">
                                <textarea name="message" id="message" placeholder="Your Message"></textarea>
                            </div>
                        </div>
                        <div class="contact-btn">
                            <button type="button" onclick="send_message()" class="fv-btn">Send MESSAGE</button>
                        </div>
                    </form>
                    <div class="form-output">
                        <p class="form-messege"></p>
                    </div>
                </div>
            </div> 
        </div>
    </div>
</section>

<?php require('footer.php')?>        