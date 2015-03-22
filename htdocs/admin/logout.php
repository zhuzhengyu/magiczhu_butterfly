<?php
include ('../../config/config.php');//基本配置
include (BASE_PATH . '/common/admin/common.php');//后台常用方法
session_start();
unset($_SESSION['admin_login']);
unset($_SESSION['username']);

exit(header('Location:' . ADMIN_URL));