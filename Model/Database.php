<?php
class Database
{
	private $host;
	private $user;
	private $password;
	private $database;
	function __construct($filename){
		if(is_file($filename))
			include $filename;
		else throw new Exception("Error Processing Request", 1);
		$this->host = $host;
		$this->user = $password;
		$this->password = $password;
		$this->database = $database;
		$this->connect();
		
	}
	private function connect(){
		//connect to the server
		if(!mysql_connect($this->host,$this->user,$this->password))
			throw new Exception("Error Not connection with server", 1);
		//connect to database
		if(!mysql_select_db($this->database))
			throw new Exception("Error No Database selected", 1);
			
			
	}
	//close connection
	function close(){
		mysql_close();
	}
}

?>