<?php
//login
if(isset($_POST['submit'])AND $_POST['submit']=="Sign in"){
	$username = $_POST['username'];
	$password = $_POST['password'];

	try{
		include "../Model/LoginClass.php";
		$login = new LoginClass($username,$password);
		if($login == TRUE)
		{
			session_start();
			$_SESSION['username'] = $username;
			header('location:index.php');
		}
	}catch(Exception $e){
		echo $e->getMessage();
	}

}
//register
if (isset($_POST['submit']) AND $_POST['submit'] == 'Register') {
	$data['user_name'] = $_POST['user_name'];
	$data['birthday'] = $_POST['birthday'];
	$data['job'] = $_POST['job'];
	$data['email'] = $_POST['email'];
	$data['password'] = $_POST['password'];
	$data['credit'] = $_POST['credit'];
	$data['address'] = $_POST['address'];
	try{
		include '../Model/Registeration.php';

		$register = new Registeration($data)
	}catch{
		throw new Exception("Error in data ", 1);
		
	}

}
/*else
{
	include '../View/Bootstrap Shop Free Website Template - Free-CSS/bootstrap-shop/index.php';
}*/

?>