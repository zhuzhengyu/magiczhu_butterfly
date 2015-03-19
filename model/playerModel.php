<?php
class playerModel extends model{
	public $table = 'player';

	/**
	 * @method 获取球员列表
	 */
	public function get_player_list($param) {
		$sql = 'SELECT * FROM ' . $this->table . ' WHERE is_delete = "0" ORDER BY id DESC';
		$result = $this->con->query($sql);
		while ($row = $result->fetch_assoc()) {
			$data[] = $row;
		}
		return $data;
	}

	/**
	 * @method 新增管理员
	 * @param array $param
	 * @return bool
	 */
	public function add_player($param) {
		$name				= $param['name'];
		$nationality	= $param['nationality'];
		$birth				= $param['birth'];
		$zhan_xing		= $param['zhan_xing'];
		$achievement	= $param['achievement'];
		$sql = 'INSERT INTO ' . $this->table . ' (`name`, `nationality`, `birth`, `zhan_xing`, `achievement`, `create_date`) VALUES
				("' . $name . '", "' . $nationality . '", "' . $birth . '", "' . $zhan_xing . '", "' . $achievement . '", NOW())';
		$this->con->query($sql);
		return $this->con->affected_rows;
	}

	/**
	 * @method 更新管理员
	 * @param array $param
	 * @return bool
	 */
	public function update_player($param) {
		$id					= $param['player_id'];
		$name				= $param['name'];
		$nationality	= $param['nationality'];
		$birth				= $param['birth'];
		$zhan_xing		= $param['zhan_xing'];
		$achievement	= $param['achievement'];
		$sql = 'UPDATE ' . $this->table . ' SET `name` = "' . $name . '", `nationality` = "' . $nationality . '", `birth` = "' . $birth . '", `zhan_xing` = "' . $zhan_xing . '", `achievement` = "' . $achievement . '" WHERE id = ' . intval($id);
		$this->con->query($sql);
		return $this->con->affected_rows;
	}

	/**
	 * @method 根据球员ID号获取管理员详情
	 * @param int $id
	 * @return array
	 */
	public function get_player_detail_by_id($id) {
		$sql = 'SELECT * FROM ' . $this->table . ' WHERE is_delete = "0" AND id = "' . intval($id) . '"';
		$result = $this->con->query($sql);
		$row = $result->fetch_assoc();
		return $row;
	}
}