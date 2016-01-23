<?php
// $private_key = 'MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCtzQiRlb2He37fTwOmedaK7F/eiDK3CiBGEao4ci1g8vT3CPImtCN8d9U+wpXKO/tXXo01ZOarXT3goplWZ/dnN5kRxM/uUJQO4ttFaAv+Z1CpT5tBtjU78AhDyL1m7yirPY8zh74JRugcBxkj544vUgLub9cAnBJqQMEqa8tYFmGi51zXCn16hUdpp0TN4Lkm9Y7S9d0Ch2+9Xn/Xd1Zis2Bn/rQA4mNrStwn8Sq3XWWRUAUGSAXVi53lwfjY/zS1SLj4QF0PruMuvFukAIasxpjw7O/j30P6DMT3V4o7oiDHVGjADttqFtnoU00lZR+RAh1kvprnBY0yMYtpLXvhAgMBAAECggEBAJKc9M6DR/fjaNqOOCEWhLJ6xkDeGhIom6MgQb0OLFOtgJJoXIXjzk+wcxZXZa7NPLCuVWamcKQ8qvc1ky6904mh8CF6KoH6PXv1SU3agMuicfvx6KHdSDkAuqgbzhLoSyFxc7zflKMUyrbiEgYkzuACSfDELdYY0rwJVion9sid5lI5FYxmGtZTilqWwpYNnREqyboGhB4m9IPHwA3BZkaIn+55ulYFPSFk74xnCf6ADvfJDhEFqJp+usZEl2bZqvnGsBAkm/kEWYEPcUdva5OECKXFhhSj/TbEwSqzSh00h4iFjDara0jMYSo+sDXZBH/YNw5GXxK5/EGiDiPltCUCgYEA/6lhHga7LJsEw+oL8xrJumPUnFu5+rniKCwyN2VouAhm+mqPLcLgVcUO7ZA+4R6G2/XsxUZdXwj7PdtN8u4VSYOQbsmtn+BZhTNyuSekq8hIgT277dukjaQ4rF72i1fFzc9HxmhMuw35fgl6shqtLk8fG43F8GsNjOZp4cgUkBMCgYEArgfrPR3fh1hIllzbyOxYfTbdiAwcERYWxEKA2fxs1OREIqW9PWLkb4SKuvg44JLZuc6euEmE8qfy20FS1AaqEHHnzymxsZZMAaDD5x//zeUXeWQ/v2cDAxQZFRLrb6RGi6a6LK3z/QcYPgYRS5yOgbLjLKINKx2ppc68Lz1KirsCgYEAnjrFeaDu3TeAJoTHKomsymgY4UDABRZgiz53QePIgQXqPhgPT2IqF8tjZtJ8qDWNf7tf8+SNy1CytmDxiGWj1SDRFlBJ3gYrQY5K9Z88gnjtrtd3ZUooOOWnkb8gVbNYH/2mzXwl6StH+6KARpTOFDgx54rCM/79nvPIGk4Ls/MCgYBiFFZwSFC8z3WBQG4hi4nHb89kKCb9PiywiSZjNA8F4GvB9xRy7zP84X7qJpCviDOqsxbil5SUyTBmfyc2FVdtEzTonP/nLORDGp6tuGwLVuxm3qfKsDyTVJVaOiJz9epINDvCiHr0hDYWZocCzQXHdNDxS5cOUJZWuu911B4ZlwKBgQDJAiqdPrNLh9q4RemZjr0P0ylxLjgUTsJVNIZ79FIlUR7AE3y1sMEB4LzTGzyM/ErWXOPyuDrTFaY4unXh05Pg2WquuiaV1AURaZOSrR942duDNWxxBZiJmwMJQlEyyHtqLgguJ7ElI8hYFxoA/AzwQcE5UYacumq6onwXwu1i8w==CPID:890086000001003460';
// openssl_get_privatekey() ;
// echo md5('b7e9818530928d33a0e28c2a0a63597e');
// 734718776c3ac81294201e9003897846
// 734718776c3ac81294201e9003897846
// 

$test = function ()
{
	$rout =  '/cdn/api';

	$eles = explode('/', '/'.trim($rout,'/ '));

	$count = count($eles); 
	$count -= 1;
	// var_dump($eles);
	do {
		$rout_temp = implode('/',array_slice($eles, 0, $count)). '/*';
		// echo $rout_temp ,$count,PHP_EOL;
		yield $rout_temp;
		$count -= 1;
	}while($count > 0);
};

foreach ($test() as $value) {
	echo $value,PHP_EOL;
}

$sql = 
<<<SQL
INSERT INTO `auth_item` VALUES ('/*',2,NULL,NULL,NULL,1450593961,1450593961),('/site/*',2,NULL,NULL,NULL,1452062024,1452062024),('/site/captcha',2,NULL,NULL,NULL,1452062049,1452062049),('/site/error',2,NULL,NULL,NULL,1452062024,1452062024),('/site/index',2,NULL,NULL,NULL,1452062024,1452062024),('/site/login',2,NULL,NULL,NULL,1452062024,1452062024),('/site/logout',2,NULL,NULL,NULL,1452062024,1452062024),('/site/maintaince',2,NULL,NULL,NULL,1452062024,1452062024),('/site/sign-up',2,NULL,NULL,NULL,1452062024,1452062024),('guest',1,'游客',NULL,NULL,1450183184,1450183184),('管理员',1,NULL,NULL,NULL,1450182330,1450594440);
INSERT INTO `vr_user` VALUES (2,'admin','fladjklsjdfowieknavadsfjoiwe','','96e79218965eb72c92a549dd5a330112','','displayName','','2016-01-05 06:57:18');
SQL;
	echo 	$sql;