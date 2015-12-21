<?php

	$a = 1;
	$l = function () use(&$a){
		echo PHP_EOL,$a,PHP_EOL;
		return $a-1;
	};

	echo $l();
	$a += 10000;
	$a = 'hell';
	echo $l();