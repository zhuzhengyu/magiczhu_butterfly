<?php
/**
 * @method 检测后台登录状态
 * @param void
 * @return void
 */
function checkAdminLogin() {
	session_start();
	if ($_SESSION['admin_login'] != true) {
		exit(header('Location:' . ADMIN_URL));
	}
}