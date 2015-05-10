<?php
class indexPageModel extends model{
	public $table = 'index_page';

	public function get_index() {
		$sql = 'SELECT * FROM ' . $this->table . ' LIMIT 1';
		$result = $this->con->query($sql);
		$row = $result->fetch_assoc();
		return $row;
	}

	//保存首页
	public function save_index() {
		$sql = 'INSERT INTO ' . $this->table . ' LIMIT 1';
	}
}