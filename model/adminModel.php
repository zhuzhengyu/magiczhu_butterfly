<?php
class adminModel extends model{
	public $table = 'admin';

	/**
	 * @method 校验管理员
	 * @param array $param
	 * @return boolean
	 */
	public function validate_admin($param) {
		$username = $param['username'];
		$password = $param['password'];
		$sql = 'SELECT count(*) AS ct FROM ' . $this->table . ' WHERE username="' . $username . '" AND password="' . $password . '"';
		$result = $this->con->query($sql);

		$row = $result->fetch_assoc();
		if ($row['ct'] > 0) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * @method 获取账户指定的权限
	 * @param string $username
	 * @return array
	 */
	public function get_power($username) {
		$sql = 'SELECT power FROM ' . $this->table . ' WHERE username="' . $username . '"';
		$result = $this->con->query($sql);
		$row = $result->fetch_assoc();
		$result = explode(',', $row['power']);
		return $result;
	}

	/**
	 * @method 获取所有的管理员详细信息
	 */
	public function get_all_admin() {
		$sql = 'SELECT * FROM ' . $this->table . ' WHERE is_delete = "0"';
		$result = $this->con->query($sql);
		while ($row = $result->fetch_assoc()) {
			$data[] = $row;
		}
		return $data;
	}

	/**
	 * @method 根据管理员ID号获取管理员详情
	 * @param int $id
	 * @return array
	 */
	public function get_admin_detail_by_id($id) {
		$sql = 'SELECT * FROM ' . $this->table . ' WHERE is_delete = "0" AND id = "' . intval($id) . '"';
		$result = $this->con->query($sql);
		$row = $result->fetch_assoc();
		return $row;
	}

	/**
	 * @method 新增管理员
	 * @param array $param
	 * @return bool
	 */
	public function add_admin($param) {
		$username = $param['username'];
		$name = $param['name'];
		$password = $param['password'];
		$power = $param['power'];
		$sql = 'INSERT INTO ' . $this->table . ' (`username`, `name`, `password`, `power`) VALUES ("' . $username . '", "' . $name . '", "' . $password . '", "' . $power . '")';
		$this->con->query($sql);
		return $this->con->affected_rows;
	}

	/**
	 * @method 更新管理员
	 * @param array $param
	 * @return bool
	 */
	public function update_admin($param) {
		$id = $param['id'];
		$username = $param['username'];
		$name = $param['name'];
		$password = $param['password'];
		$power = $param['power'];
		$sql = 'UPDATE ' . $this->table . ' SET `username` = "' . $username . '", `name` = "' . $name . '", `password` = "' . $password . '", `power` = "' . $power . '" WHERE id = ' . intval($id);
		$this->con->query($sql);
		return $this->con->affected_rows;
	}

	/**
	 * @method 根据管理员账号获取管理员详情
	 * @param string $username
	 * @return array
	 */
	public function get_admin_detail_by_username($username) {
		$sql = 'SELECT * FROM ' . $this->table . ' WHERE is_delete = "0" AND username = "' . $username . '"';
		$result = $this->con->query($sql);
		$row = $result->fetch_assoc();
		return $row;
	}

	/**
	 * @method 修改账号密码
	 */
	public function modify_password($param) {
		$old_password = $param['old_password'];
		$new_password = $param['new_password'];
		$username = $param['username'];
		$sql = 'UPDATE ' . $this->table . ' SET `password` = "' . $new_password . '" WHERE `username` = "' . $username . '" AND `password` = "' . $old_password . '"';
		$result = $this->con->query($sql);
		return $this->con->affected_rows;
	}
}