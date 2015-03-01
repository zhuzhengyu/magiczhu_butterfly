<?php
class model{
	public $con;
	public $table;
	public function __construct() {
	    $this->con = mysqli_connect(MYSQL_SERVER, MYSQL_USER, MYSQL_PASS, MYSQL_DATABASE);
		$this->con->set_charset("utf8");
	
	    if (mysqli_connect_error()) {
	        die('Connect Error (' . mysqli_connect_errno() . ') ' . mysqli_connect_error());
	    }
	}

    public function __destruct() {
		
    }
   
    /**
     * 
     */
    public function getRow($condition) {
		foreach ($condition as $k => $v) {
			$where[] .= $k . '=' . $v;
		}
    }
}