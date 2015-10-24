<?php
// http://www.tudou.com/albumplay/O8GDpd7v8RA/BpOFzyALam4.html
	$itemCode = 'kbPzDzCIeBE';
	$itemCode = 'BpOFzyALam4';
	$key = 'd07a99702d923952';
	$api = 'http://api.tudou.com/v6/video/info';

	$_r = "http://api.tudou.com/v6/video/info?app_key={$key}&format=json&itemCodes={$itemCode}";

	$_res = file_get_contents($_r);

	print_r(json_decode($_res,1));


	echo "http://v.youku.com/player/getPlayList/VideoIDS/"."XMzM5NjE2NzY4"."/timezone/+08/version/5/source/out/Sc/2?n=3&"."ran=9109"."&password=";
	// http://v.youku.com/player/getPlayList/VideoIDS/XMzM5NjE2NzY4/timezone/+08/version/5/source/out/Sc/2?n=3&ran=9109&password=