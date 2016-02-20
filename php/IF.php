<?php

function _IF($cond,$if_body,$else_body){
	
		goto else_body;
	else_body:
		return $else_body;
}


var_dump(_IF(1,2,3));


function _FOR(callable $init,$cond,$body)
{
	$init();
	
}