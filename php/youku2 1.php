<?php

function getSid() {
	$sid = time().(rand(0,9000)+10000);
	return $sid;
}

function getkey($key1,$key2){
	$a = hexdec($key1);
	$b = $a ^ 0xA55AA5A5;
	$b = dechex($b);
	return $key2.$b;
}

function getfileid($fileId,$seed) {
	$mixed = getMixString($seed);
	$ids = explode("*",$fileId);
	unset($ids[count($ids)-1]);
	$realId = "";
	for ($i=0;$i < count($ids);++$i) { 
		$idx = $ids[$i]; 
		$realId .= substr($mixed,$idx,1); 

	} 
	return $realId; 
} 

function getMixString($seed) {
	$mixed = ""; 
	$source = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ/\:._-1234567890"; 
	$len = strlen($source); 
	for($i=0;$i< $len;++$i){
		$seed = ($seed * 211 + 30031) % 65536; 
		$index = ($seed / 65536 * strlen($source)); 
		$c = substr($source,$index,1); 
		$mixed .= $c; 
		$source = str_replace($c, "",$source); 
	} 
	return $mixed; 
}

// echo 
$get_data = file_get_contents("http://v.youku.com/player/getPlayList/VideoIDS/XMjU3MzIxOTk2");
$get_data_1 = file_get_contents("http://v.youku.com/player/getPlayList/VideoIDS/XMjU3MzIxOTk2/Pf/4/ctype/12/ev/1");

// $get_data = '{"data":[{"ct":"c","cs":"2050","logo":"http:\/\/g1.ykimg.com\/","seed":8395,"tags":["\u6cf0\u56fd"],"categories":"96","videoid":"64330499","vidEncoded":"XMjU3MzIxOTk2","username":"chengansong","userid":"2871118","title":"\u62f3\u97381\u4e4b\u76d7\u4f5b\u7ebfCD3","up":0,"down":0,"ts":"YMkryzErbFZvVR8B*Bj9Vg","tsup":"YMkv7zIrbFZvVR8C3Bz9Vg","key1":"b148facb","key2":"bfd4235c4c9b2b93","tt":"0","videoSource":"1","seconds":"897.27","streamfileids":{"flv":"6*43*6*6*6*37*6*43*6*6*23*30*14*59*43*42*43*14*53*6*59*43*6*6*37*31*53*59*23*51*53*53*50*30*44*51*51*22*65*44*42*6*53*65*31*50*59*56*65*23*37*50*37*65*37*30*50*56*31*59*10*31*23*42*22*14*","mp4":"6*43*6*6*6*50*6*43*6*6*23*30*14*59*23*44*10*22*53*6*59*43*6*6*37*31*53*59*23*51*53*53*50*30*44*51*51*22*65*44*42*6*53*65*31*50*59*56*65*23*37*50*37*65*37*30*50*56*31*59*10*31*23*42*22*14*"},"segs":{"flv":[{"no":"0","size":"12936112","seconds":391,"k":"ca1fe0eba99f7429282adeac","k2":"1445df485f3ef867d"},{"no":"1","size":"11707423","seconds":393,"k":"c0290080ec12eb6624125f6e","k2":"1485442df33f8eacb"},{"no":"2","size":"3590770","seconds":112,"k":"6393b0d1bc4ce8f724125f6e","k2":"1710e97422bcc1289"}],"mp4":[{"no":"0","size":"25016518","seconds":391,"k":"42b93cc3cc3a4409282adeac","k2":"180bd156d83db08ff"},{"no":"1","size":"25887969","seconds":393,"k":"8baef59e1075faae24125f6e","k2":"1179dade2b458a0df"},{"no":"2","size":"5435715","seconds":111,"k":"48975615b359c1af261e9f0d","k2":"157aaf89cbecb16a3"}]},"streamsizes":{"flv":"28234305","mp4":"56340202"},"stream_ids":{"flv":"75489279","mp4":"75489212"},"streamlogos":{"flv":1,"mp4":1},"streamtypes":["flv","mp4"],"streamtypes_o":["flvhd","mp4"]}],"user":{"id":"79875178"},"controller":{"search_count":true,"mp4_restrict":1,"stream_mode":1,"video_capture":true,"hd3_enabled":false,"area_code":110000,"dma_code":64495,"continuous":1,"playmode":"normal","circle":false,"tsflag":true,"other_disable":false,"xplayer_disable":false,"app_disable":false,"share_disabled":false,"download_disabled":false,"pc_disabled":false,"pad_disabled":false,"mobile_disabled":false,"tv_disabled":false,"comment_disabled":false}}';
$get_data = json_decode($get_data,1);
print_r($get_data );

$v_format = "flv";
echo 
	$fileid = $get_data["data"][0]["streamfileids"][$v_format];
echo 
	$seed = $get_data['data'][0]['seed'];
echo 
	$key1 = $get_data['data'][0]['key1'];
echo 
	$key2 = $get_data["data"][0]["segs"][$v_format][0]['k'];



echo 
	$sid = getSid();
echo 
	$p_fileid = getfileid($fileid,$seed);
// echo json_encode([1,"2222"=>111,"1111111111"])	;
// 
// 
echo 
	$key = getkey($key1,$key2);
echo PHP_EOL,

	// $play_url = "http://f.youku.com/player/getFlvPath/sid/{$sid}_00/st/{$v_format}/fileid/{$p_fileid}?K={$key}";
	$play_url = "http://f.youku.com/player/getFlvPath/sid/00_00/st/{$v_format}/fileid/{$p_fileid}?K={$key}";
// http://k.youku.com/player/getFlvPath/sid/6444898585859100c3a03_00/st/flv/fileid/03000203004D9F3A39C0F3002BCF4ECC8D6EE1-6A0C-B8F7-4282-2D87BF5B4A19?K=7eecabb1cc2a085a24125f72&ctype=10&ev=1&oip=2043096855&token=4120&ep=YoqzgWJZPIRlkPxw9CiZ%2FHcAL%2Bu%2F14dq7ST7Cc5hDP71%2B7V204E%2B%2BMXvDHYv359ZiIuboIF1fm%2FbHujrvKCzz1rONfQmrVEMrMFUZD3nWbW%2F9dXqRvY9D3cMkDdvUT064qI2FGo2gQY%3D&ymovie=1
// http://f.youku.com/player/getFlvPath/sid/144489843614366      _00      /st/flv/fileid/03000203004D9F3A39C0F3002BCF4ECC8D6EE1-6A0C-B8F7-4282-2D87BF5B4A19?K=e23d2f9c2ec57705161e9f13
// http://k.youku.com/player/getFlvPath/sid/6444898585859100c3a03_01/st/flv/fileid/03000203014D9F3A39C0F3002BCF4ECC8D6EE1-6A0C-B8F7-4282-2D87BF5B4A19?K=b8f348b42b2d222c261e9f13&ctype=10&ev=1&oip=2043096855&token=4120&ep=YoqzgWJZPIRlkPxw9CiZ%2FHcAL%2Bu%2F14dqNK9GQoD3cmH1%2B7V204E%2B%2BMXvDHYv359ZiIuboIF1fm%2FbHujrvKCzz1rONfQmrVEMrMFUZD3nWbW%2F9dXqRvY9D3cMkDdvUT06zZ1LDg5py78%3D&ymovie=1






