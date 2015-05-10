<?php
class newsModel extends model{
	public $table = 'news';

	/**
	 * 获取资讯列表
	 */
	public function get_news_list() {
		$sql = 'SELECT * FROM ' . $this->table . '';
		$result = $this->con->query($sql);
		while ($row = $result->fetch_assoc()) {
			$data[] = $row;
		}
		return $data;
	}

	/**
	 * @method 新增资讯
	 * @param array $param
	 * @return bool
	 */
	public function add_news($param) {
		$title				= $param['title'];
		$video_url		= $param['video_url'];
		$content			= $param['content'];
		$img				= $param['img'];
		$sql = 'INSERT INTO ' . $this->table . ' (`title`, `video_url`, `content`, `img`, `create_date`) VALUES
				("' . $title . '", "' . $video_url . '", "' . $content . '","' . $img . '", NOW())';
		$this->con->query($sql);
		return $this->con->affected_rows;
	}

	/**
	 * @method 更新资讯
	 * @param array $param
	 * @return bool
	 */
	public function update_news($param) {
		$id				= $param['id'];
		$title			= $param['title'];
// 		$video_url	= $param['video_url'];
		$content		= $param['content'];
		$img			= $param['img'];
		$sql = 'UPDATE ' . $this->table . ' SET `title` = "' . $title . '", `img` = "' . $img . '", `content` = "' . $content . '" WHERE id = ' . intval($id);
		$this->con->query($sql);
		return $this->con->affected_rows;
	}

	/**
	 * @method 资讯ID号获取资讯详情
	 * @param int $id
	 * @return array
	 */
	public function get_news_detail_by_id($id) {
		$sql = 'SELECT * FROM ' . $this->table . ' WHERE is_delete = "0" AND id = "' . intval($id) . '"';
		$result = $this->con->query($sql);
		$row = $result->fetch_assoc();
		return $row;
	}
}