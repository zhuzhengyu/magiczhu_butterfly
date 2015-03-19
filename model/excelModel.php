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
	public function get_excel_list($param, &$returnParam) {
		$offset = ($param['page_no'] - 1) * $param['per_page'];
		$rows = intval($param['per_page']);
		$sql = 'SELECT * FROM ' . $this->table . ' ORDER BY id DESC LIMIT ' . $offset . ',' . $rows;
		$result = $this->con->query($sql);
		while ($row = $result->fetch_assoc()) {
			$data[] = $row;
		}
		$count_sql = 'SELECT COUNT(*) AS ct FROM ' . $this->table;
		$count_result = $this->con->query($count_sql);
		$count_row = $count_result->fetch_assoc();
		$returnParam['total_rows'] = $count_row['ct'];
		return $data;
	}

	/**
	 * @method 通过指定ID获取excel
	 */
	public function get_file_by_id($excel_id) {
		$sql = 'SELECT * FROM ' . $this->table . ' WHERE id="' . intval($excel_id) . '" AND state="1"';
		$result = $this->con->query($sql);
		$row = $result->fetch_assoc();
		return $row['file'];
	}

	/**
	 * @method 改变状态
	 */
	public function chage_state($excel_id) {
		$sql = 'UPDATE ' . $this->table . ' SET `state` = "2" WHERE id = "' . intval($excel_id) . '"';
		$this->con->query($sql);
		return $this->con->affected_rows;
	}
}