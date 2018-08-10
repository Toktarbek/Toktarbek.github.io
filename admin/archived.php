<?php 
require_once $_SERVER['DOCUMENT_ROOT'].'/dostar/core/init.php';
if (!is_logged_in()) {
	login_error_redirect();
}
include 'includes/head.php';
include 'includes/navigation.php';
$sql="SELECT * FROM products WHERE deleted=1";
$result=$db->query($sql);
if (isset($_GET['refresh'])) {
	$prID=(int)($_GET['refresh']);
	$prID=sanitize($prID);
	$deSql="UPDATE products SET deleted=0 WHERE id='$prID'";
	$db->query($deSql);
	header('Location: archived.php');
}
?>
<h2 class="text-center">Archived Products</h2> <br>
<table class="table table-bordered table-condensed table-striped">
	<thead><th></th><th>Product</th><th>Price</th><th>Category</th><th>Sold</th></thead>
	<tbody>
	<?php while($product=mysqli_fetch_assoc($result)): 
	$chID=(int)$product['categories'];
	$chSql="SELECT * FROM categories WHERE id='$chID'";
	$child=mysqli_fetch_assoc($db->query($chSql));
	$pID=$child['parent'];
	$pSql="SELECT * FROM categories WHERE id='$pID'";
	$parent=mysqli_fetch_assoc($db->query($pSql));
	$category=$parent['category'].'-'.$child['category'];
	?>
		<tr>
			<td><a href="archived.php?refresh=<?=$product['id']; ?>"class="btn btn-xs btn-default"><span class="glyphicon glyphicon-refresh"></span></a></td>
			<td><?=$product['title']; ?></td>
			<td><?=$product['price']; ?></td>
			<td><?=$category; ?></td>
			<td>0</td>
		</tr>
	<?php endwhile; ?>
	</tbody>
</table>
<?php include 'includes/footer.php'; ?> 