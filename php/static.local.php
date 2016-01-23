<?php

	function a()
	{
		static $b;
		// static 
		if(!isset($b['a'])){
			$b['a'] = 1;
			return $b;
		}
		$b['b'] = 2;
		return $b;
	}

	var_dump(a());
	var_dump(a());