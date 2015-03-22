<?php
include ('../../config/config.php');//基本配置

$error_msg = isset($_GET['error_msg']) ? $_GET['error_msg'] : '';

include(ADMIN_VIEW_PATH . '/index.html');