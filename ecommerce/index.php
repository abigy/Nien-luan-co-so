<?php 
require('top.php');
$resBanner=mysqli_query($con,"select * from banner where status='1' order by order_no asc");
?>

<div class="body__overlay"></div>

<?php if(mysqli_num_rows($resBanner)>0) { ?>
    <!-- Slider Area -->
    <div class="slider__container slider--one">
        <div class="slide__container slider__activation__wrap owl-carousel">
            <?php while($rowBanner=mysqli_fetch_assoc($resBanner)) { ?>
            <div class="single__slide animation__style01 slider__fixed--height">
                <div class="container container-slider">
                    <div class="row align-items__center">
                        <div class="col-md-7 col-sm-7 col-xs-12 col-lg-6">
                            <div class="slide">
                                <div class="slider__inner">
                                    <h2><?php echo $rowBanner['heading1']?></h2>
                                    <h1><?php echo $rowBanner['heading2']?></h1>
                                    <?php if($rowBanner['btn_txt'] !='' && $rowBanner['btn_link']!='') { ?>
                                        <div class="cr__btn">
                                            <a href="<?php echo $rowBanner['btn_link']?>"><?php echo $rowBanner['btn_txt']?></a>
                                        </div>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-sm-5 col-xs-12 col-md-5 slider-img-fix">
                            <div class="slide__thumb">
                                <img src="./media/banner/<?php echo $rowBanner['image']?>" >
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <?php } ?>
        </div>
    </div>
<?php } ?>
    
<!-- Category Area -->
<section class="htc__category__area ptb--100">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="section__title--2 text-center">
                    <h2 class="title__line">New Arrivals</h2>
                </div>
            </div>
        </div>
        <div class="htc__product__container">
            <div class="row">
                <div class="product__list clearfix mt--30">
                    <?php
                    $get_product=get_product($con,8);
                    foreach($get_product as $list){
                    ?>
                    <!-- Single Category -->
                    <div class="col-md-4 col-lg-3 col-sm-4 col-xs-12">
                        <div class="category">
                            <div class="ht__cat__thumb">
                                <a href="product.php?id=<?php echo $list['id']?>">
                                    <img src="./media/product/<?php echo $list['image']?>" alt="product images" style="height: 173px; width: auto;">
                                </a>
                            </div>
                            <div class="fr__hover__info">
                                <ul class="product__action">
                                    <li><a href="javascript:void(0)" onclick="wishlist_manage('<?php echo $list['id']?>','add')"><i class="icon-heart icons"></i></a></li>
                                    <li>
                                        <a href="product.php?id=<?php echo $list['id']?>" >
                                            <i class="icon-handbag icons"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="fr__product__inner">
                                <h4><a href="product.php?id=<?php echo $list['id']?>"><?php echo $list['name']?></a></h4>
                                <ul class="fr__pro__prize">
                                    <strike><li class="old__prize" style="font-size: 13px;"><?php echo formatMoney($list['mrp'])?></li></strike>
                                    <li><?php echo formatMoney($list['price'])?> đ</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
</section>


<input type="hidden" id="qty" value="1"/>

<?php require('footer.php')?>        