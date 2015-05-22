<?php
class playerModel extends model{
	public $table = 'player';

	/**
	 * @method 获取球员列表
	 */
	public function get_player_list($param = array()) {
		$sql = 'SELECT * FROM ' . $this->table . ' WHERE is_delete = "0" ORDER BY id DESC';
		$result = $this->con->query($sql);
		while ($row = $result->fetch_assoc()) {
			$data[] = $row;
		}
		return $data;
	}
	
	/**
	 * @method 根据大洲获取球员列表
	 */
	public function get_player_list_by_continent($continent) {
		$sql = 'SELECT * FROM ' . $this->table . ' WHERE is_delete = "0" AND `continent` = "' . $continent . '" ORDER BY id DESC';
		$result = $this->con->query($sql);
		while ($row = $result->fetch_assoc()) {
			$data[] = $row;
		}
		return $data;
	}

	/**
	 * @method 新增球员
	 * @param array $param
	 * @return bool
	 */
	public function add_player($param) {
		$name				= $param['name'];
		$nationality	= $param['nationality'];
		$birth				= $param['birth'];
		$zhan_xing		= $param['zhan_xing'];
		$img				= $param['img'];
		$achievement	= $param['achievement'];
		$taojiao			= $param['taojiao'];
		$diban				= $param['diban'];
		$sql = 'INSERT INTO ' . $this->table . ' (`name`, `nationality`, `birth`, `zhan_xing`, `achievement`, `img`,`diban`, `taojiao`, `create_date`) VALUES
				("' . $name . '", "' . $nationality . '", "' . $birth . '", "' . $zhan_xing . '", "' . $achievement . '", "' . $img . '", "' . $diban . '", "' . $taojiao . '" NOW())';
		$this->con->query($sql);
		return $this->con->affected_rows;
	}

	/**
	 * @method 更新球员
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
		$img				= $param['img'];
		$taojiao			= $param['taojiao'];
		$diban				= $param['diban'];
		$sql = 'UPDATE ' . $this->table . ' SET `name` = "' . $name . '", `nationality` = "' . $nationality . '", `birth` = "' . $birth . '", `zhan_xing` = "' . $zhan_xing . '", `achievement` = "' . $achievement . '", `img` = "' . $img . '", `diban` = "' . $diban . '", `taojiao` = "' . $taojiao . '" WHERE id = ' . intval($id);
		$this->con->query($sql);
		return $this->con->affected_rows;
	}

	/**
	 * @method 根据球员ID号获取球员详情
	 * @param int $id
	 * @return array
	 */
	public function get_player_detail_by_id($id) {
		$sql = 'SELECT * FROM ' . $this->table . ' WHERE is_delete = "0" AND id = "' . intval($id) . '"';
		$result = $this->con->query($sql);
		$row = $result->fetch_assoc();
		return $row;
	}
	
	/**
	 * @method 获取国籍列表
	 */
	public function get_continent_list() {
		$sql = 'SELECT DISTINCT(continent) FROM ' . $this->table . ' WHERE is_delete = "0"';
		$result = $this->con->query($sql);
		while ($row = $result->fetch_assoc()) {
			$data[] = $row;
		}
		return $data;
	}
}