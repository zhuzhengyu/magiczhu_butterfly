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
		$sql = 'INSERT INTO log ';
	}
}