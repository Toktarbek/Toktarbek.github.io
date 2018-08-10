<?php 
require_once $_SERVER['DOCUMENT_ROOT'].'/dostar/core/init.php';
include 'includes/head.php';
$email=((isset($_POST['email']))?sanitize($_POST['email']):'');
$email=trim($email);
$password=((isset($_POST['password']))?sanitize($_POST['password']):'');
$password=trim($password);
$errors=array();

?>
<style>
	body{
		background-image: url("/dostar/images/fon-login.jpg");
		background-size: 100% auto;
		background-attachment: fixed;
	}
</style>
<div id="login-form">
<?php 
if ($_POST) {
	//form validation tekseru
	if (empty($_POST['email']) || empty($_POST['password'])) {
		$errors[]='You mast provide email and passord.';
	}
	//validate email
	if (!filter_var($email,FILTER_VALIDATE_EMAIL)) {
		$errors[]='You mast enter a vaild email.';
	}

	//password is more than 6 characters
	if (strlen($password)<6) {
		$errors[]='Password must be least 6 characters.';
	}

	//check if email exists in the database
	$query=$db->query("SELECT * FROM users WHERE email='$email'");
	$user=mysqli_fetch_assoc($query);
	$userCount=mysqli_num_rows($query);
	if ($userCount<1) {
		$errors[]='That email doesn\'t exist in our database.'; 
	}

	if (!password_verify($password, $user['password'])) {
		$errors[]='The password does not match our records. Please try again.';
	}

	//check for errors
	if (!empty($errors)) {
		echo display_errors($errors);
	}else{
		//log user in
		$user_id=$user['id'];
		login($user_id);

	}
}

?>
	<div></div>
	<h2 class="text-center">Login</h2><hr>
	<form action="login.php" method="post">
		<div class="form-group">
			<label for="email">Email:</label>
			<input type="text" name="email" id="email" class="form-control" value="<?=$email; ?>">
		</div>
		<div class="form-group">
			<label for="password">Password:</label>
			<input type="password" name="password" id="password" class="form-control" value="<?=$password; ?>">
		</div>
		<div class="form-group">
			<input type="submit" value="Login" class="btn btn-primary">
		</div>
	</form>
	<p class="text-right"><a href="/dostar/index.php" alt="home">Visit Site</a></p>
</div>

<?php include 'includes/footer.php'; ?> 