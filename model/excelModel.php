<?php
class excelModel extends model{
	public $table = 'excel';

	/**
	 * @method 插入产品EXCEL文件名
	 */
	public function insert_excel($file) {
		$sql = 'INSERT INTO ' . $this->table . ' (`file`, `create_date`) VALUES ("' . $file . '", NOW());';
		$this->con->query($sql);
		return $this->con->affected_rows;
	}

	/**
	 * @method 获取产品EXCEL文件列表
	 */
	public function get_excel_list() {
		$sql = 'SELECT * FROM ' . $this->table . ' ORDER BY id DESC';
		$result = $this->con->query($sql);
		while ($row = $result->fetch_assoc()) {
			$data[] = $row;
		}
		return $data;
	}
}