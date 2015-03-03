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
}