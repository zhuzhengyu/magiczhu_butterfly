<?php
class logModel extends model{
	public $table = 'log';

	/**
	 * @method 记录日志
	 * @param array $param
	 * @return void
	 */
	public function log($param) {
		$tag = $param['tag'];
		$log_content = $param['content'];
		$log_level = $param['level'];
		$sql = 'INSERT INTO log (`tag`, `content`, `level`, `create_date`) VALUES ("' . $tag . '", \'' . $log_content . '\', "' . $log_level . '", NOW())';
		$this->con->query($sql);
		$affected_rows = $this->con->affected_rows;
		return $affected_rows > 0 ? true : false;
	}

	/**
	 * @method 通过标签获取指定日志
	 */
	public function get_log_by_tag($tag) {
		$sql = 'SELECT * FROM `log` WHERE tag = "' . $tag . '" ORDER BY id DESC LIMIT 100';
		$result = $this->con->query($sql);
		while ($row = $result->fetch_assoc()) {
			$data[] = $row;
		}
		return $data;
	}

}