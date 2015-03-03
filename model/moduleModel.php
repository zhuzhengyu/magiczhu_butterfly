<?php
class moduleModel extends model{
	public $table = 'module';

	public function get_all_module() {
		$sql = 'SELECT id, module_name FROM ' . $this->table . ' WHERE is_delete = "0"';
		$result = $this->con->query($sql);
		while ($row = $result->fetch_assoc()) {
			$data[] = $row;
		}
		return $data;
	}
	
	/**
	 * @method 获取父类模块列表
	 * @param void
	 * @return array
	 */
	public function get_parent_module_list() {
		$sql = 'SELECT * FROM ' . $this->table . ' WHERE is_delete = "0" AND parent_module_id = "0"';
		$result = $this->con->query($sql);
		while ($row = $result->fetch_assoc()) {
			$data[$row['id']] = $row;
		}
		return $data;
	}
	
	/**
	 * @method 获取指定模块信息
	 */
	public function get_module_list_detail($module_arr) {
		$module_id_str = implode(',', $module_arr);
		$sql = 'SELECT id, module_name, url FROM ' . $this->table . ' WHERE id IN (' . $module_id_str . ') AND parent_module_id = "0" ORDER BY id ASC;';
		$result = $this->con->query($sql);
		while ($row = $result->fetch_assoc()) {
			$data[] = $row;
		}
		return $data;
	}
	
	/**
	 * @method 获取子模块列表
	 * @param int $module_id
	 * @return array
	 */
	public function get_sub_module($module_id) {
		$sql = 'SELECT id, module_name, url FROM ' . $this->table . ' WHERE parent_module_id = "' . $module_id . '" AND is_delete = "0"';
		$result = $this->con->query($sql);
		while ($row = $result->fetch_assoc()) {
			$data[] = $row;
		}
		return $data;
	}
}