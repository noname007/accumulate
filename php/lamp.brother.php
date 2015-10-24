<?php
	// $i = range(1,100);
	for($i = 1;$i < 2; $i ++){
		$url =  "http://www.ydma.cn/course/".$i;
		echo $_r = file_get_contents($url);
		$pattern = '/(?=) <title>.*</title>/';
		preg_match($pattern, $_r,$m);
		print_r($m);
	}