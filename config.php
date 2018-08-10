<?php
define('BASEURL', $_SERVER['DOCUMENT_ROOT'].'/dostar/');
define('CART_COOKIE', 'SBwi72UCklwiqzz2');
define('CART_COOKIE_EXPIRE', time()+(86400 *30));
define('TAXRATE',0.087);

define('CURRENCY', 'usd');
define('CHECKOUTMODE', 'TEST');

if (CHECKOUTMODE=='TEST') {
	define('STRIPE_PRIVATE', 'sk_test_cve6uv1HbqX5cRgxtZyb9sCF');
	define('STRIPE_PUBLIC', 'pk_test_Ti5yaOwSEKmQq9hm1qyX7W9T');
}

if (CHECKOUTMODE=='LIVE') {
	define('STRIPE_PRIVATE', 'sk_test_cve6uv1HbqX5cRgxtZyb9sCF');
	define('STRIPE_PUBLIC', 'pk_test_Ti5yaOwSEKmQq9hm1qyX7W9T');
}


if (function_exists('date_default_timezone_set'))
date_default_timezone_set('Asia/Almaty');