<?php
class validateCodeModel extends model{
	public $table = 'validate_code';
	
	/**
	 * @method 查询校验码
	 */
	public function query_validate_code($code) {
		$sql = 'SELECT * FROM ' . $this->table . ' WHERE is_delete = "0" AND code = "' . $code . '"';
		$result = $this->con->query($sql);
		$data = $result->fetch_assoc();
		return $data;
	}
}