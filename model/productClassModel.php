<?php
class productClassModel extends model{
	public $table = 'product_class';

	/**
	 * @method 根据类名获取ID号
	 */
	public function get_id_by_class_name($class_name) {
		$sql = 'SELECT id FROM ' . $this->table . ' WHERE class_name="' . $class_name . '"';
		$result = $this->con->query($sql);
		$row = $result->fetch_assoc();
		$data = $row['id'];
		return $data;
	}
}