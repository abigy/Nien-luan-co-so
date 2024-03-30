<?php 
ob_start();
require('top.php');

if(isset($_GET['id'])){
	$product_id=mysqli_real_escape_string($con,$_GET['id']);
	if($product_id>0){
		$get_product=get_product($con,'','',$product_id);
	}else{
		?>
		<script>
		    window.location.href='index.php';
		</script>
		<?php
	}
	
	$resMultipleImages=mysqli_query($con,"select product_images from product_images where product_id='$product_id'");
	$multipleImages=[];
	if(mysqli_num_rows($resMultipleImages)>0){
		while($rowMultipleImages=mysqli_fetch_assoc($resMultipleImages)){
			$multipleImages[]=$rowMultipleImages['product_images'];
		}
	}
	
	$resAttr=mysqli_query($con,"select product_attributes.*,color_master.color,size_master.size from product_attributes 
	left join color_master on product_attributes.color_id=color_master.id and color_master.status=1 
	left join size_master on product_attributes.size_id=size_master.id and size_master.status=1
	where product_attributes.product_id='$product_id'");
	$productAttr=[];
	$colorArr=[];
	$sizeArr=[];
	if(mysqli_num_rows($resAttr)>0){
		while($rowAttr=mysqli_fetch_assoc($resAttr)){
			$productAttr[]=$rowAttr;
			$colorArr[$rowAttr['color_id']][]=$rowAttr['color'];
			$sizeArr[$rowAttr['size_id']][]=$rowAttr['size'];
			
			$colorArr1[]=$rowAttr['color'];
			$sizeArr1[]=$rowAttr['size'];
		}
	}
	$is_size=count(array_filter($sizeArr1));
	$is_color=count(array_filter($colorArr1));
	//$colorArr=array_unique($colorArr);
	//$sizeArr=array_unique($sizeArr1);
} else {
	?>
	<script>
	    window.location.href='index.php';
	</script>
	<?php
}

if(isset($_POST['review_submit'])){
	$rating=get_safe_value($con,$_POST['rating']);
	$review=get_safe_value($con,$_POST['review']);
	
	$added_on=date('Y-m-d h:i:s');
	mysqli_query($con,"insert into product_review(product_id,user_id,rating,review,status,added_on) values('$product_id','".$_SESSION['USER_ID']."','$rating','$review','1','$added_on')");
	header('location:product.php?id='.$product_id);
	die();
}

$product_review_res=mysqli_query($con,"select users.name,product_review.id,product_review.rating,product_review.review,product_review.added_on from users,product_review where product_review.status=1 and product_review.user_id=users.id and product_review.product_id='$product_id' order by product_review.added_on desc");
?>

<div id="container">
    <?php if(isset($multipleImages[0])){?>
    <div id="multipleimages">
        <?php
        $i=0;
        foreach($multipleImages as $list) {
            ?>
            <span style="--i:<?php echo $i ?>;"></span>
            <?php
            echo "<img src='./media/product_images/$list' onclick=showMultipleImage('".PRODUCT_MULTIPLE_IMAGE_SITE_PATH.$list."')>";
            $i++;
        }
        ?>
    </div>
    <?php } ?>
</div>

<style>
    /* *{
        padding: 0;
        margin: 0;
        box-sizing: border-box;
    }

    body {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        background-color: black;
    } */

    #container {
        position: fixed;
        width: 100%;
        height: 100%;
        flex-direction: column;
        display: flex;
        justify-content: center;
        align-items: center;        
    }

    #container span{
        position: absolute;
        top: 0;
        left: calc(100% / <?php echo $i ?> * var(--i));
        width: calc(100% / <?php echo $i ?>);
        height: 100%;
        
    }

    #container img {
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        /* width: 100%;
        height: 100%;
        object-fit: cover; */
        opacity: 0;
        pointer-events: none;
    }

    #container img:nth-child(2),
    #container span:hover + img {
        opacity: 1;
    }
</style>