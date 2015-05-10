<?php
class gameModel extends model{
	public $table = 'game';

	/**
	 * 获取资讯列表
	 */
	public function get_game_list() {
		$sql = 'SELECT * FROM ' . $this->table . '';
		$result = $this->con->query($sql);
		while ($row = $result->fetch_assoc()) {
			$data[] = $row;
		}
		return $data;
	}

	/**
	 * @method 新增赛事
	 * @param array $param
	 * @return bool
	 */
	public function add_game($param) {
		$title				= $param['title'];
		$video_url		= $param['video_url'];
		$content			= $param['content'];
		$sql = 'INSERT INTO ' . $this->table . ' (`title`, `video_url`, `content`, `create_date`) VALUES
				("' . $title . '", "' . $video_url . '", "' . $content . '", NOW())';
		$this->con->query($sql);
		return $this->con->affected_rows;
	}

	/**
	 * @method 更新赛事
	 * @param array $param
	 * @return bool
	 */
	public function update_game($param) {
		$id				= $param['id'];
		$title			= $param['title'];
		$video_url	= $param['video_url'];
		$content		= $param['content'];
		$sql = 'UPDATE ' . $this->table . ' SET `title` = "' . $title . '", `video_url` = "' . $video_url . '", `content` = "' . $content . '" WHERE id = ' . intval($id);
		$this->con->query($sql);
		return $this->con->affected_rows;
	}

	/**
	 * @method 资讯ID号获取资讯详情
	 * @param int $id
	 * @return array
	 */
	public function get_game_detail_by_id($id) {
		$sql = 'SELECT * FROM ' . $this->table . ' WHERE is_delete = "0" AND id = "' . intval($id) . '"';
		$result = $this->con->query($sql);
		$row = $result->fetch_assoc();
		return $row;
	}
}