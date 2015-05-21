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
     * @method 获取列表
     * @return unknown
     */
	public function get_list() {
		$sql = 'SELECT * FROM ' . $this->table . '';
		$result = $this->con->query($sql);
		while ($row = $result->fetch_assoc()) {
			$data[] = $row;
		}
		return $data;
	}
	
	/**
	 * @method 根据ID获取详情
	 * @param int $id
	 * @return array
	 */
	public function get_detail_by_id($id) {
		$sql = 'SELECT * FROM ' . $this->table . ' WHERE is_delete = "0" AND id = "' . intval($id) . '"';
		$result = $this->con->query($sql);
		$row = $result->fetch_assoc();
		return $row;
	}
	
	/**
	 * @method 插入数据
	 * @param array $param
	 */
	public function add($param) {
		$sql = 'INSERT INTO ' . $this->table . ' ';
		foreach ($param as $k => $v) {
			if ($v == '') continue;
			$real_param[$k] = '"' . $v . '"';
		}
		$sql .= '(' . implode(',', array_keys($real_param)) . ')';
		$sql .= ' VALUES ';
		$sql .= '(' . implode(',', $real_param) . ')';
		$this->con->query($sql);
		return $this->con->affected_rows;
	}
	
	/**
	 * @method 更新数据
	 * @param array $param
	 */
	public function update($param) {
		$sql = 'UPDATE ' . $this->table . ' SET ';
		$id = intval($param['id']);
		foreach ($param as $k => $v) {
			if ($v == '') continue;
			$sql .= $k . '="' . $v . '",';
		}
		$sql = substr($sql, 0, -1);
		$sql .= ' WHERE id = ' . $id;
		$this->con->query($sql);
		return $this->con->affected_rows;
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