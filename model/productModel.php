<?php
class productModel extends model{
	public $table = 'product';

	/**
	 * @method 获取产品列表
	 * @param array $param
	 * @return array
	 */
	public function get_product_list($param) {
		$sql = 'SELECT * FROM ' . $this->table . ' WHERE is_delete = "0" ORDER BY id DESC';
		$result = $this->con->query($sql);
		while ($row = $result->fetch_assoc()) {
			$data[] = $row;
		}
		return $data;
	}

	/**
	 * @method 根据产品ID获取ID详情
	 */
	public function get_product_detail_by_id($product_id) {
		$sql = 'SELECT * FROM ' . $this->table . ' WHERE is_delete = "0" AND id = "' . intval($product_id) . '"';
		$result = $this->con->query($sql);
		$row = $result->fetch_assoc();
		return $row;
	}

	/**
	 * @method 批量插入数据库
	 */
	public function batch_insert_db($param) {
// 		$sql = '';
		foreach ($param as $k => $v) {
// 			$sql_str = implode(',', $v);
			$sql = 'INSERT INTO ' . $this->table . ' (`name`, `price`, `category_name`) VALUES ("' . $v['name'] . '", "' . $v['price'] . '", "' . $v['category'] . '");';
			$this->con->query($sql);
		}
	}

	/**
	 * @method 新增管理员
	 * @param array $param
	 * @return bool
	 */
	public function add_product($param) {
		$no			= $param['no'];
		$name		= $param['name'];
		$price		= $param['price'];
		$category	= $param['category'];

		$sql = 'INSERT INTO ' . $this->table . ' (`no`, `name`, `price`, `category_name`, `create_date`) VALUES
				("' . $no . '", "' . $name . '", "' . $price . '", "' . $category . '", NOW())';
		$this->con->query($sql);
		return $this->con->affected_rows;
	}

	/**
	 * @method 更新管理员
	 * @param array $param
	 * @return bool
	 */
	public function update_product($param) {
		$id			= $param['id'];
		$no			= $param['no'];
		$name		= $param['name'];
		$price		= $param['price'];
		$category	= $param['category'];

		$sql = 'UPDATE ' . $this->table . ' SET `no` = "' . $no . '", `name` = "' . $name . '", `price` = "' . $price . '", `category_name` = "' . $category . '" WHERE id = ' . intval($id);
		$this->con->query($sql);
		return $this->con->affected_rows;
	}
}