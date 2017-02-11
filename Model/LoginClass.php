<?php
/**
* login
*/
class LoginClass 
{
	private $username;
	private $password;
	private $connect;

	function __construct($username,$password)
	{
		//set data
		$this->setDate($username,$password);
		//connect servre and database
		$this->connectDB();
		//get data
		$this->getData();
	}

	private function setData(){
		$this->username = username;
		$this->password = password;
	}

	private function connectDB(){
		include '../../Model/Database.php';
		$con = "../../Control/Connection.php";
		$this->connect = new Database($con);
	}

	function getData(){
		$query = "SELECT * FROM users WHERE 'user_name' = '$this->username' AND 'password' = '$this->password' ";
		$sql = mysql_query($query);
		if(mysql_num_rows($sql)>0)
		{
			return true;
		}
		else{
			throw new Exception("Error No User ", 1);
			
		}

	}
	function close(){
		$this->connect = mysql_close();
	}
}

?>