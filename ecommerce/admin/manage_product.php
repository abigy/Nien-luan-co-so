<?php
require('top.inc.php');

$condition='';
$condition1='';
if($_SESSION['ADMIN_ROLE']==1) {
	$condition=" and product.added_by='".$_SESSION['ADMIN_ID']."'";
	$condition1=" and added_by='".$_SESSION['ADMIN_ID']."'";
}

$categories_id='';
$name='';
// $mrp='';
// $price='';
// $qty='';
$image='';
$image3d='';
$image3d_usdz='';
$short_desc	='';
$description ='';
$des_screen ='';
$des_cpu ='';
$des_ram ='';
$des_memory ='';
$des_graphics ='';
$des_weight ='';
$meta_title	='';
$meta_desc	='';
$meta_keyword='';
$best_seller='';
$sub_categories_id='';
$multipleImageArr=[];
$msg='';
$image_required='required';

$attrProduct[0]['product_id']='';
$attrProduct[0]['size_id']='';
$attrProduct[0]['color_id']='';
$attrProduct[0]['mrp']='';
$attrProduct[0]['price']='';
$attrProduct[0]['qty']='';
$attrProduct[0]['id']='';


if(isset($_GET['pi']) && $_GET['pi']>0){
	$pi=get_safe_value($con,$_GET['pi']);
	$delete_sql="delete from product_images where id='$pi'";
	mysqli_query($con,$delete_sql);
}

if(isset($_GET['id']) && $_GET['id']!='') {
	$image_required='';
	$id=get_safe_value($con,$_GET['id']);
	$res=mysqli_query($con,"select * from product where id='$id'");
	$check=mysqli_num_rows($res);
	if($check>0) {
		$row=mysqli_fetch_assoc($res);
		$categories_id=$row['categories_id'];
		$sub_categories_id=$row['sub_categories_id'];
		$name=$row['name'];
		/*$mrp=$row['mrp'];
		$price=$row['price'];
		$qty=$row['qty'];*/
		$short_desc=$row['short_desc'];
		$description=$row['description'];

		$des_screen=$row['des_screen'];
		$des_cpu=$row['des_cpu'];
		$des_ram=$row['des_ram'];
		$des_memory=$row['des_memory'];
		$des_graphics=$row['des_graphics'];
		$des_weight=$row['des_weight'];

		$meta_title=$row['meta_title'];
		$meta_desc=$row['meta_desc'];
		$meta_keyword=$row['meta_keyword'];
		$best_seller=$row['best_seller'];
		$image=$row['image'];
		$image3d=$row['image3d'];
		$image3d_usdz=$row['image3d_usdz'];
		
		$resMultipleImage=mysqli_query($con,"select id,product_images from product_images where product_id='$id'");
		if(mysqli_num_rows($resMultipleImage)>0) {
			$jj=0;
			while($rowMultipleImage=mysqli_fetch_assoc($resMultipleImage)) {
				$multipleImageArr[$jj]['product_images']=$rowMultipleImage['product_images'];
				$multipleImageArr[$jj]['id']=$rowMultipleImage['id'];
				$jj++;
			}
		}
		
		$resProductAttr=mysqli_query($con,"select * from product_attributes where product_id='$id'");
		$jj=0;
		while($rowProductAttr=mysqli_fetch_assoc($resProductAttr)) {
			$attrProduct[$jj]['product_id']=$rowProductAttr['product_id'];
			$attrProduct[$jj]['size_id']=$rowProductAttr['size_id'];
			$attrProduct[$jj]['color_id']=$rowProductAttr['color_id'];
			$attrProduct[$jj]['mrp']=$rowProductAttr['mrp'];
			$attrProduct[$jj]['price']=$rowProductAttr['price'];
			$attrProduct[$jj]['qty']=$rowProductAttr['qty'];
			$attrProduct[$jj]['id']=$rowProductAttr['id'];
			$jj++;
		}		
	}else {
		header('location:product.php');
		die();
	}
}

if(isset($_POST['submit'])) {
	//prx($_POST);
	$categories_id=get_safe_value($con,$_POST['categories_id']);
	$sub_categories_id=get_safe_value($con,$_POST['sub_categories_id']);
	$name=get_safe_value($con,$_POST['name']);
	/*$mrp=get_safe_value($con,$_POST['mrp']);
	$price=get_safe_value($con,$_POST['price']);
	$qty=get_safe_value($con,$_POST['qty']);*/
	$short_desc=get_safe_value($con,$_POST['short_desc']);
	$description=get_safe_value($con,$_POST['description']);
	
	$des_screen=get_safe_value($con,$_POST['des_screen']);
	$des_cpu=get_safe_value($con,$_POST['des_cpu']);
	$des_ram=get_safe_value($con,$_POST['des_ram']);
	$des_memory=get_safe_value($con,$_POST['des_memory']);
	$des_graphics=get_safe_value($con,$_POST['des_graphics']);
	$des_weight=get_safe_value($con,$_POST['des_weight']);
	
	$meta_title=get_safe_value($con,$_POST['meta_title']);
	$meta_desc=get_safe_value($con,$_POST['meta_desc']);
	$meta_keyword=get_safe_value($con,$_POST['meta_keyword']);
	$best_seller=get_safe_value($con,$_POST['best_seller']);
	
	$res=mysqli_query($con,"select product.* from product where product.name='$name'");
	$check=mysqli_num_rows($res);
	if($check>0){
		if(isset($_GET['id']) && $_GET['id']!=''){
			$getData=mysqli_fetch_assoc($res);
			if($id==$getData['id']){
			
			}else{
				$msg="Product already exist";
			}
		}else{
			$msg="Product already exist";
		}
	}
	
	if(isset($_GET['id']) && $_GET['id']==0){
		if($_FILES['image']['type']!='image/png' && $_FILES['image']['type']!='image/jpg' && $_FILES['image']['type']!='image/jpeg'){
			$msg="Please select only png,jpg and jpeg image formate";
		}
	}else{
		if($_FILES['image']['type']!=''){
				if($_FILES['image']['type']!='image/png' && $_FILES['image']['type']!='image/jpg' && $_FILES['image']['type']!='image/jpeg'){
				$msg="Please select only png,jpg and jpeg image formate";
			}
		}
	}
	
	if(isset($_FILES['product_images'])){
		foreach($_FILES['product_images']['type'] as $key=>$val){
			if($_FILES['product_images']['type'][$key]!=''){
				if($_FILES['product_images']['type'][$key]!='image/png' && $_FILES['product_images']['type'][$key]!='image/jpg' && $_FILES['product_images']['type'][$key]!='image/jpeg'){
					$msg="Please select only png,jpg and jpeg image formate in multipel product images";
				}
			}
		}
	}
	
	if($msg==''){
		if(isset($_GET['id']) && $_GET['id']!=''){
			if($_FILES['image']['name']!=''){
				$image=$_FILES['image']['name'];
				$image3d=$_FILES['image3d']['name'];
				$image3d_usdz=$_FILES['image3d_usdz']['name'];
				move_uploaded_file($_FILES['image']['tmp_name'],PRODUCT_IMAGE_SERVER_PATH.$image);
				move_uploaded_file($_FILES['image3d']['tmp_name'],PRODUCT_IMAGE_SERVER_PATH.$image3d);
				move_uploaded_file($_FILES['image3d_usdz']['tmp_name'],PRODUCT_IMAGE_SERVER_PATH.$image3d_usdz);
				$update_sql="update product set categories_id='$categories_id',name='$name',short_desc='$short_desc',description='$description',des_screen='$des_screen',des_cpu='$des_cpu',des_ram='$des_ram',des_memory='$des_memory',des_graphics='$des_graphics',des_weight='$des_weight',meta_title='$meta_title',meta_desc='$meta_desc',meta_keyword='$meta_keyword',image='$image',image3d='$image3d',image3d_usdz='$image3d_usdz',best_seller='$best_seller',sub_categories_id='$sub_categories_id' where id='$id'";
			}else{
				$update_sql="update product set categories_id='$categories_id',name='$name',short_desc='$short_desc',description='$description',des_screen='$des_screen',des_cpu='$des_cpu',des_ram='$des_ram',des_memory='$des_memory',des_graphics='$des_graphics',des_weight='$des_weight',meta_title='$meta_title',meta_desc='$meta_desc',meta_keyword='$meta_keyword',best_seller='$best_seller',sub_categories_id='$sub_categories_id' where id='$id'";
			}
			mysqli_query($con,$update_sql);
		} else {
			$image=$_FILES['image']['name'];
			$image3d=$_FILES['image3d']['name'];
			$image3d_usdz=$_FILES['image3d_usdz']['name'];
			move_uploaded_file($_FILES['image']['tmp_name'],PRODUCT_IMAGE_SERVER_PATH.$image);
			move_uploaded_file($_FILES['image3d']['tmp_name'],PRODUCT_IMAGE_SERVER_PATH.$image3d);
			move_uploaded_file($_FILES['image3d_usdz']['tmp_name'],PRODUCT_IMAGE_SERVER_PATH.$image3d_usdz);
			mysqli_query($con,"insert into product(categories_id,name,short_desc,description,des_screen,des_cpu,des_ram,des_memory,des_graphics,des_weight,meta_title,meta_desc,meta_keyword,status,image,image3d,image3d_usdz,best_seller,sub_categories_id,added_by) values('$categories_id','$name','$short_desc','$description','$des_screen','$des_cpu','$des_ram','$des_memory','$des_graphicss','$des_weight','$meta_title','$meta_desc','$meta_keyword',1,'$image','$image3d','$image3d_usdz','$best_seller','$sub_categories_id','".$_SESSION['ADMIN_ID']."')");
			$id=mysqli_insert_id($con);
		}
		
		/*Product Multiple Images*/
		if(isset($_GET['id']) && $_GET['id']!='') {
			if(isset($_FILES['product_images']['name'])){
				foreach($_FILES['product_images']['name'] as $key=>$val){
				if($_FILES['product_images']['name'][$key]!=''){
					if(isset($_POST['product_images_id'][$key])){
						$image=$_FILES['product_images']['name'][$key];
						move_uploaded_file($_FILES['product_images']['tmp_name'][$key],PRODUCT_MULTIPLE_IMAGE_SERVER_PATH.$image);
						mysqli_query($con,"update product_images set product_images='$image' where id='".$_POST['product_images_id'][$key]."'");
					}else{
						$image=$_FILES['product_images']['name'][$key];
						move_uploaded_file($_FILES['product_images']['tmp_name'][$key],PRODUCT_MULTIPLE_IMAGE_SERVER_PATH.$image);
						mysqli_query($con,"insert into product_images(product_id,product_images) values('$id','$image')");
					}
				} }
			}
		} else {
			if(isset($_FILES['product_images']['name'])){
				foreach($_FILES['product_images']['name'] as $key=>$val){
					if($_FILES['product_images']['name'][$key]!=''){
						$image=$_FILES['product_images']['name'][$key];
						move_uploaded_file($_FILES['product_images']['tmp_name'][$key],PRODUCT_MULTIPLE_IMAGE_SERVER_PATH.$image);
						mysqli_query($con,"insert into product_images(product_id,product_images) values('$id','$image')");
					}
				}
			}
		}
		
		/*Product Attributes*/
		
		if(isset($_POST['mrp'])){
			foreach($_POST['mrp'] as $key=>$val){
				$mrp=get_safe_value($con,$_POST['mrp'][$key]);
				$price=get_safe_value($con,$_POST['price'][$key]);
				$qty=get_safe_value($con,$_POST['qty'][$key]);
				$size_id=get_safe_value($con,$_POST['size_id'][$key]);
				$color_id=get_safe_value($con,$_POST['color_id'][$key]);
				$attr_id=get_safe_value($con,$_POST['attr_id'][$key]);
				
				if($attr_id>0){
					mysqli_query($con,"update product_attributes set size_id='$size_id',color_id='$color_id',mrp='$mrp',price='$price',qty='$qty' where id='$attr_id'");
				}else{
					mysqli_query($con,"insert into product_attributes(product_id,size_id,color_id,mrp,price,qty) values('$id','$size_id','$color_id','$mrp','$price','$qty')");
				}
			}
		}
	
		redirect('product.php');
	}
}
?>

<div class="content pb-0">
	<div class="animated fadeIn">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header"><strong>Product</strong><small> Form</small></div>
					<form method="post" enctype="multipart/form-data">
						<div class="card-body card-block">
							<div class="form-group">
								<div class="row">
									<div class="col-lg-6">
										<label for="categories" class=" form-control-label">Categories</label>
										<select class="form-control" name="categories_id" id="categories_id" onchange="get_sub_cat('')" required>
											<option>Select Category</option>
											<?php
												$res=mysqli_query($con,"select id,categories from categories order by categories asc");
												while($row=mysqli_fetch_assoc($res)){
													if($row['id']==$categories_id){
														echo "<option selected value=".$row['id'].">".$row['categories']."</option>";
													}else{
														echo "<option value=".$row['id'].">".$row['categories']."</option>";
													}
													
												}
											?>
										</select>
									</div>
									<div class="col-lg-6">
										<label for="categories" class=" form-control-label">Sub Categories</label>
										<select class="form-control" name="sub_categories_id" id="sub_categories_id">
											<option>Select Sub Category</option>
										</select>
									</div>
								</div>
							</div>	

							<div class="form-group">
								<div class='row'>
									<div class="col-lg-9">
										<label for="categories" class=" form-control-label">Product Name</label>
										<input type="text" name="name" placeholder="Enter product name" class="form-control" required value="<?php echo $name?>">
									</div>
									<div class="col-lg-3">
										<label for="categories" class=" form-control-label">Best Seller</label>
										<select class="form-control" name="best_seller" required>
											<option value=''>Select</option>
												<?php
												if($best_seller==1){
													echo '<option value="1" selected>Yes</option>
														<option value="0">No</option>';
												}elseif($best_seller==0){
													echo '<option value="1">Yes</option>
														<option value="0" selected>No</option>';
												}else{
													echo '<option value="1">Yes</option>
														<option value="0">No</option>';
												}
											?>
										</select>
									</div>
								</div>
							</div>

							<div class="form-group"  id="product_attr_box">
								<?php 
								$attrProductLoop=1;
								foreach($attrProduct as $list){?>
								<div class="row" id="attr_<?php echo $attrProductLoop?>">
									<div class="col-lg-2">
										<label for="categories" class=" form-control-label">Price</label>
										<input type="text" name="mrp[]" placeholder="MRP" class="form-control" required value="<?php echo $list['mrp']?>">
									</div>
									<div class="col-lg-2">
										<label for="categories" class=" form-control-label">Price sale</label>
										<input type="text" name="price[]" placeholder="Price" class="form-control" required value="<?php echo $list['price']?>">
									</div>
									<div class="col-lg-2">
										<label for="categories" class=" form-control-label">Quality</label>
										<input type="text" name="qty[]" placeholder="Qty" class="form-control" required value="<?php echo $list['qty']?>">
									</div>
									<div class="col-lg-2">
										<label for="categories" class=" form-control-label">Size</label>
										<select class="form-control" name="size_id[]" id="size_id">
											<option>Size</option>
											<?php
												$res=mysqli_query($con,"select id,size from size_master order by order_by asc");
												while($row=mysqli_fetch_assoc($res)){
													if($list['size_id']==$row['id']){
														echo "<option value=".$row['id']." selected>".$row['size']."</option>";
													}else{
														echo "<option value=".$row['id']." >".$row['size']."</option>";	
													}
												}
											?>
										</select>
									</div>
									<div class="col-lg-2">
										<label for="categories" class=" form-control-label">Color</label>
										<select class="form-control" name="color_id[]" id="color_id">
											<option>Color</option>
											<?php
												$res=mysqli_query($con,"select id,color from color_master order by color asc");
												while($row=mysqli_fetch_assoc($res)){
													if($list['color_id']==$row['id']){
														echo "<option value=".$row['id']." selected>".$row['color']."</option>";
													}else{
														echo "<option value=".$row['id']." >".$row['color']."</option>";	
													}
												}
											?>
										</select>
									</div>
									<div class="col-lg-2">
										<label for="categories" class="form-control-label"></label>
										<?php
											if($attrProductLoop==1){
												?>
												<button id="" type="button" class="btn btn-lg btn-info btn-block" onclick="add_more_attr()">
													<span id="payment-button-amount">Add More</span>
												</button>
												<?php
											}else{
												?>
												<button id="" type="button" class="btn btn-lg btn-danger btn-block" onclick="remove_attr('<?php echo $attrProductLoop?>','<?php echo $list['id']?>')">
													<span id="payment-button-amount">Remove</span>
												</button>
												<?php
											}
										?>
										<input type="hidden" name="attr_id[]" value='<?php echo $list['id']?>'/>
									</div>
								</div>
								<?php 
									$attrProductLoop++;
								} ?>
							</div>
							
							<div class="form-group">
								<div class="row"  id="image_box">
									<div class="col-lg-10">
										<label for="categories" class="form-control-label">Image</label>
										<input type="file" name="image" class="form-control" <?php echo $image_required?>>
										<?php
											if($image!=''){
											echo "<a target='_blank' href='".PRODUCT_IMAGE_SITE_PATH.$image."'>
											<img width='150px' src='".PRODUCT_IMAGE_SITE_PATH.$image."'/></a>";
											}
										?>
									</div>
									<div class="col-lg-2">
										<label for="categories" class=" form-control-label"></label>
										<button id="" type="button" class="btn btn-lg btn-info btn-block" onclick="add_more_images()">
											<span id="payment-button-amount">Add Image</span>
										</button>
									</div>
									<?php
										if(isset($multipleImageArr[0])){
											foreach($multipleImageArr as $list){
												echo '<div class="col-lg-6" style="margin-top:20px;" id="add_image_box_'.$list['id'].'">
													<label for="categories" class=" form-control-label">Image</label>
													<input type="file" name="product_images[]" class="form-control" >
													<a href="manage_product.php?id='.$id.'&pi='.$list['id'].'" style="color:white;">
														<button type="button" class="btn btn-lg btn-danger btn-block">
															<span id="payment-button-amount">
															<a href="manage_product.php?id='.$id.'&pi='.$list['id'].'" style="color:white;">Remove</span>
														</button>
													</a>';
													echo "<a target='_blank' href='".PRODUCT_MULTIPLE_IMAGE_SITE_PATH.$list['product_images']."'>
														<img width='150px' src='".PRODUCT_MULTIPLE_IMAGE_SITE_PATH.$list['product_images']."'/></a>";
													echo '<input type="hidden" name="product_images_id[]" value="'.$list['id'].'"/>
												</div>';
											}										 
										}
									?>
								</div>
							</div>

							<div class="form-group">
								<label for="categories" class="form-control-label">Image3d</label>
								<input type="file" name="image3d" class="form-control" <?php echo $image_required?>>
								<?php
									if($image3d!=''){
										echo "<a target='_blank' href='".PRODUCT_IMAGE_SITE_PATH.$image3d."'>
										<img width='150px' src='".PRODUCT_IMAGE_SITE_PATH.$image3d."'/></a>";
									}
								?>
							</div>
							
							<div class="form-group">
								<label for="categories" class="form-control-label">Image3d(usdz)</label>
								<input type="file" name="image3d_usdz" class="form-control" <?php echo $image_required?>>
								<?php
									if($image3d_usdz!=''){
									echo "<a target='_blank' href='".PRODUCT_IMAGE_SITE_PATH.$image3d_usdz."'>
									<img width='150px' src='".PRODUCT_IMAGE_SITE_PATH.$image3d_usdz."'/></a>";
									}
								?>
							</div>

							<div class="form-group">
								<label for="categories" class=" form-control-label">Short Description</label>
								<textarea name="short_desc" placeholder="Enter product short description" class="form-control" required><?php echo $short_desc?></textarea>
							</div>
							
							<div class="form-group">
								<label for="categories" class=" form-control-label">Description</label>
								<textarea name="description" placeholder="Enter product description" class="form-control" required><?php echo $description?></textarea>
							</div>

							<div class="form-group">
								<label for="categories" class=" form-control-label">Description screen</label>
								<textarea name="des_screen" placeholder="Enter product description screen" class="form-control" required><?php echo $des_screen?></textarea>
							</div>

							<div class="form-group">
								<label for="categories" class=" form-control-label">Description cpu</label>
								<textarea name="des_cpu" placeholder="Enter product description cpu" class="form-control" required><?php echo $des_cpu?></textarea>
							</div>

							<div class="form-group">
								<label for="categories" class=" form-control-label">Description ram</label>
								<textarea name="des_ram" placeholder="Enter product description ram" class="form-control" required><?php echo $des_ram?></textarea>
							</div>

							<div class="form-group">
								<label for="categories" class=" form-control-label">Description memory</label>
								<textarea name="des_memory" placeholder="Enter product description memory" class="form-control" required><?php echo $des_memory?></textarea>
							</div>

							<div class="form-group">
								<label for="categories" class=" form-control-label">Description graphics</label>
								<textarea name="des_graphics" placeholder="Enter product description graphics" class="form-control" required><?php echo $des_graphics?></textarea>
							</div>

							<div class="form-group">
								<label for="categories" class=" form-control-label">Description weight </label>
								<textarea name="des_weight" placeholder="Enter product description weight" class="form-control" required><?php echo $des_weight?></textarea>
							</div>
							
							<div class="form-group">
								<label for="categories" class=" form-control-label">Meta Title</label>
								<textarea name="meta_title" placeholder="Enter product meta title" class="form-control"><?php echo $meta_title?></textarea>
							</div>
							
							<div class="form-group">
								<label for="categories" class=" form-control-label">Meta Description</label>
								<textarea name="meta_desc" placeholder="Enter product meta description" class="form-control"><?php echo $meta_desc?></textarea>
							</div>
							
							<div class="form-group">
								<label for="categories" class=" form-control-label">Meta Keyword</label>
								<textarea name="meta_keyword" placeholder="Enter product meta keyword" class="form-control"><?php echo $meta_keyword?></textarea>
							</div>
							
							<button id="payment-button" name="submit" type="submit" class="btn btn-lg btn-info btn-block">
								<span id="payment-button-amount">Submit</span>
							</button>
							<div class="field_error"><?php echo $msg?></div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
		 

<script>
	function get_sub_cat(sub_cat_id){
		var categories_id=jQuery('#categories_id').val();
		jQuery.ajax({
			url:'get_sub_cat.php',
			type:'post',
			data:'categories_id='+categories_id+'&sub_cat_id='+sub_cat_id,
			success:function(result){
				jQuery('#sub_categories_id').html(result);
			}
		});
	}
	
	var total_image=1;
	function add_more_images(){
		total_image++;
		var html='<div class="col-lg-6" style="margin-top:20px;" id="add_image_box_'+total_image+'"><label for="categories" class=" form-control-label">Image</label><input type="file" name="product_images[]" class="form-control" required><button type="button" class="btn btn-lg btn-danger btn-block" onclick=remove_image("'+total_image+'")><span id="payment-button-amount">Remove</span></button></div>';
		jQuery('#image_box').append(html);
	}
	
	function remove_image(id){
		jQuery('#add_image_box_'+id).remove();
	}
	
	var attr_count=1;
	function add_more_attr(){
		attr_count++;
		
		var size_html=jQuery('#attr_1 #size_id').html();
		size_html=size_html.replace('selected','');
		
		var color_html=jQuery('#attr_1 #color_id').html();
		color_html=color_html.replace('selected','');
		
		var html='<div class="row mt20" id="attr_'+attr_count+'"> <div class="col-lg-2"><label for="categories" class=" form-control-label">MRP</label><input type="text" name="mrp[]" placeholder="MRP" class="form-control" required="" value=""> </div> <div class="col-lg-2"><label for="categories" class=" form-control-label">Price</label><input type="text" name="price[]" placeholder="Price" class="form-control" required="" value=""> </div> <div class="col-lg-2"><label for="categories" class=" form-control-label">Qty</label><input type="text" name="qty[]" placeholder="Qty" class="form-control" required="" value=""> </div> <div class="col-lg-2"><label for="categories" class=" form-control-label">Size</label><select class="form-control" id="size_id" name="size_id[]">'+size_html+'</select> </div> <div class="col-lg-2"><label for="categories" class=" form-control-label">Color</label><select class="form-control" id="color_id" name="color_id[]">'+color_html+'</select> </div> <div class="col-lg-2"><label for="categories" class=" form-control-label">&nbsp;</label><button id="" type="button" class="btn btn-lg btn-danger btn-block" onclick=remove_attr("'+attr_count+'")><span id="payment-button-amount">Remove</span></button> </div><input type="hidden" name="attr_id[]" value=""/></div>';
		jQuery('#product_attr_box').append(html);
	}
	
	function remove_attr(attr_count,id){
		jQuery.ajax({
			url:'remove_product_attr.php',
			data:'id='+id,
			type:'post',
			success:function(result){
				jQuery('#attr_'+attr_count).remove();
			}
		});
	}
</script>     

<?php
require('footer.inc.php');
?>

<script>
	<?php
		if(isset($_GET['id'])){
		?>
		get_sub_cat('<?php echo $sub_categories_id?>');
	<?php } ?>
</script>