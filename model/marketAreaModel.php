<?php
class marketAreaModel extends model{
	public $table = 'market_area';
	
	/**
	 * @method 获取ID和名字对应的数据
	 */
	public function get_area_sort() {
		$sql = 'SELECT * FROM ' . $this->table . '';
		$result = $this->con->query($sql);
		while ($row = $result->fetch_assoc()) {
			$data[$row['id']] = $row['area_name'];
		}
		return $data;
	}
}