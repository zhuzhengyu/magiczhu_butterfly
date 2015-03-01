<?php
include ('D:\work\git\magiczhu_butterfly\config\config.php');

$error_msg = isset($_GET['error_msg']) ? $_GET['error_msg'] : '';

include(ADMIN_VIEW_PATH . '/index.html');