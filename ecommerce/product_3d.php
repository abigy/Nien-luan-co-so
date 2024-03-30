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
    
    <div id="model3D">
        <model-viewer id="move" auto-rotate camera-controls ar xr-environment 
        loading="eager" poster="./media/product/loading-logo.gif"            
        src="./media/product/<?php echo $get_product['0']['image3d']?>"
        ios-src="./media/product/<?php echo $get_product['0']['image3d_usdz']?>"
        skybox-image="./media/product/enviroment_lightroom_14b.hdr">
            <div class="controls <?php if ($get_product['0']['categories_id']==1) {echo "off";} ?>">
                <button id="open" class="open-close off">Close</button>                    
                <button id="close" class="open-close">Open</button>                    
            </div>
            <button class="ar-button" slot="ar-button">
                <img src="./media/product/ar.png" alt="icon-ar">
                Activate AR
            </button>
            <div class="infor-3d">
                <img src="./media/product/infor_3d.png" alt="infor 3d">
            </div>
        </model-viewer>
    </div>
    
    <style>
        .off {
            display: none !important;
        }
    
        /* CSS 3D Model ------------------ */
        #model3D {
            position: fixed;
            background-color: black;
            height: 100%;
            width: 100%;
            top: 0;
            bottom: 0;
            right: 0;
            left: 0;
        }
    
        #model3D model-viewer {
            position: absolute;
            height: 100%;
            width: 100%;
            top: 0;
            bottom: 0;
            right: 0;
            left: 0;
            border: none;
        }
    
        #model3D .rotate {
            position: fixed; 
            bottom: 102px; 
            left: 32px;
        }
    
        #model3D .rt-onoff {
            width: 112px;
            border: none;
            border-radius: 20px; 
            background-color: rgba(255, 255, 255, .8);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            color: black;
            padding: 12px;
            font-size: 16px;
            line-height: 20px;
            font-weight: 600;
            cursor: pointer;
        }
    
        #model3D .controls {
            position: fixed; 
            bottom: 32px; 
            left: 32px;
        }
    
        #model3D .open-close {
            width: 74px;
            border: none;
            border-radius: 20px; 
            background-color: rgba(255, 255, 255, .8);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            color: black;
            padding: 12px;
            font-size: 16px;
            line-height: 20px;
            font-weight: 600;
            cursor: pointer;
        }
    
        #model3D .ar-button{
            position: absolute; 
            border: none; 
            border-radius: 20px; 
            background-color: rgba(255, 255, 255, .8);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            bottom: 32px; 
            right: 32px;
            color: black;
            font-size: 14px;
            line-height: 20px;
            padding: 12px 12px 12px 52px;
        }
    
        #model3D .ar-button img {
            position: absolute;
            top: 2px;
            left: 8px;
            height: 40px;
        }

        #model3D .infor-3d {
            position: fixed;
            right: -23%;
            top: 30%;
            width: 25%;
        }

        #model3D .infor-3d:hover {
            animation: show ease 1s;
            right: 0%;
        }

        @keyframes show {
            from{
                right: -23%;
            } to {
                right: 0%;
            }
        }
    </style>
    
    <script>
        const modelViewerMove = document.querySelector("model-viewer#move");
        const Open = document.querySelector('#open');
        const Close = document.querySelector('#close');
    
        Open.addEventListener('click', () => {
            modelViewerMove.timeScale = -1;
            modelViewerMove.play({repetitions: 1});
    
            Close.classList.remove("off");
            Open.classList.add("off");
        });
    
        Close.addEventListener('click', () => {
            modelViewerMove.timeScale = 1;
            modelViewerMove.play({repetitions: 1});
    
            Open.classList.remove("off");
            Close.classList.add("off");
        });
    </script>