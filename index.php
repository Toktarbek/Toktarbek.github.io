<?php 
require_once 'core/init.php';
include 'includes/head.php'; 
include 'includes/navigation.php'; 
include 'includes/headerfull.php'; 
include 'includes/leftbar.php'; 
$sql="SELECT * from products where featured=1";
$featured=$db->Query($sql);
?>

<div class="col-md-8">
	<div class="row">
		<h2 class="text-center">Таңдалған тауарлар</h2>
		<?php while ($product=mysqli_fetch_assoc($featured)) : ?>
		<div class="col-sm-3 text-center">
			<h4><?= $product['title']; ?></h4>
			<?php $photos=explode(',', $product['image']); ?>
			<a href="<?= $photos[0]; ?>" target="_blank">
			<img src="<?= $photos[0]; ?>" alt="<?= $product['title']; ?>" class="img-thumb">
			</a>
			<p class="list-price text-danger">list-price: <s><?= $product['list_price']; ?> тг</s></p>
			<p class="price">Our Price: <?= $product['price']; ?> тг</p>
			<button type="button" class="btn btn-sm btn-success" onclick="detailsmodal(<?= $product['id']; ?>)">Details</button>
		</div>
	<?php endwhile; ?>
	</div>
</div>
<?php  
include 'includes/rightbar.php';
include 'includes/footer.php';
?>

