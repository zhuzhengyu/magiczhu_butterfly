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


	/**
	 * 获取多条记录
	 * @param array 条件
	 * @param array 获取字段
	 * @return array 二维数组
	 */
	function findAll($condition=null,$limit=null,$offset=null,$get=null,$order_by="id desc"){
		$sql="select ";
		if(!empty($get)){
			foreach($get as $v){
				$sql.=mysql_real_escape_string($v).",";
			}
			$sql=substr($sql,0,-1);
		}else{
			$sql.="*";
		}
		$sql.=" from ".$this->table;

		if(!empty($condition)){
			$sql.=" where 1=1";
			foreach($condition as $k=>$v){
				if(is_numeric($k)){
					$sql.=" and ".$v;
				}else{
					$sql.=" and ".$k."='".mysql_real_escape_string($v)."'";
				}
			}
		}

		$sql.=" order by ".mysql_real_escape_string($order_by);
		if($limit!=null){
			$sql.=" limit ".mysql_real_escape_string($limit);
		}

		if($offset!=null){
			$sql.=" offset ".mysql_real_escape_string($offset);
		}

		pr($sql);exit;

//		echo $sql;
		return $this->getAll($sql);
	}
}