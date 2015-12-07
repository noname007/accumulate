<?php
	class A{

	}
	error_reporting(E_ALL|E_STRICT);
	function eh(){
		var_dump(func_get_args());
	}
	set_error_handler('eh',E_ALL|E_STRICT);
	$b = 'A';
	try{
		$a = new $b;
	}catch(Exception $e){

	}
	var_dump($a);

