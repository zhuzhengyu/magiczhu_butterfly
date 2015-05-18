<?php
class marketCompanyModel extends model{
	public $table = 'market_company';
	
	/**
	 * @method 根据区号获取区号中的所有公司信息
	 */
	public function get_company_list_by_area_id($id) {
		$sql = 'SELECT * FROM ' . $this->table . ' WHERE is_delete = "0" AND area_id = ' . intval($id);
		$result = $this->con->query($sql);
		while ($row = $result->fetch_assoc()) {
			$data[] = $row;
		}
		return $data;
	}
}