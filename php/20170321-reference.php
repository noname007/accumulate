<?php 

error_reporting(E_ERROR);

function &foo()
{
	static $var = 1;
	echo __FUNCTION__,__LINE__,":",$var,PHP_EOL;
	return ++$var;
}


function &bar()
{
	static $var = 1;
	++$var;
	echo __FUNCTION__,__LINE__,":",$var,PHP_EOL;
	return $var;
}

$var2 = &foo();
$var3 = &bar();

++$var2;
++$var3;

echo foo();
bar();
echo $var2,PHP_EOL,$var3;


