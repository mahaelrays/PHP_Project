<?php

/**
* 
*/
class Registeration
{
	 private $user_name;
	 private $birthday;
	 private $job;
	 private $email;
	 private $password;
	 private $credit;
	 private $address;
	 private $connect; //database object
	function __construct($data)
	{
		if(is_array($data));
		{
			$this->setDate($data);
		}else{
			throw new Exception("Error Data Must be array", 1);
			
		}
		//connect database
		$this->connectDB();
		//search
		$search = $this->searchEmail();
		if($search)
		{
			//set data
			$this->setDate($data);
			//insert data
			$this->registerUser();
			//close connection
			$this->close();
		}else{
			throw new Exception("Error this email exist", 1);
			
		}
	}
	//search Email
	private function searchEmail()
	{
		$this->email =$data['email'];
		$query = "SELECT * FROM users WHERE email = $this->email";
		$sql = mysql_query($query);
		return $sql;

	}

	//set data
	private function setDate($data){
		$this->user_name = $data['user_name'];
		$this->birthday  = $data['birthday'];
		$this->job       = $data['job'];
		$this->email     = $data['email'];
		$this->password  = $data['password'];
		$this->credit    = $data['credit'];
		$this->address   = $data['address'];
	}
	//connect database
	private function connectDB()
	{
		include 'Database.php';
		$con = '../Control/Connection.php';
		$this->connect = new Database($con);
	}
	//insert database 
	private function registerUser(){
		$query = "INSERT INTO 'users' ( 'user_id','user_name' , 'birthday' , 'job' , 'email' , 'password' , 'credit' , 'address' ) VALUES ( '', '$this->user_name' , '$this->birthday' , '$this->job' , '$this->email' , '$this->password' , '$this->credit' , '$this->address' )";
		$sql = mysql_query($query);
		if(!$sql)
			throw new Exception("Error Not insert in data base", 1);
			
	}

	function close(){
		$this->connect = mysql_close();
	}
}

?>