<?php
	$url = 'http://v.youku.com/player/getPlayList/VideoIDS/XMjU3MzIxOTk2';
echo $get_data = file_get_contents($url);

// echo 
$get_data = json_decode($get_data,1);
print_r($get_data);

echo PHP_EOL,
$_seed = $get_data["data"][0]['seed'];
// $_key;
// $_len
// $fileid
// $format
// echo $_seed = $get_data->data[0]->seed;
// list()
function get_key_len_fileid_format(&$get_data){
	$_segs = $get_data["data"][0]['segs'];
	if(isset($_segs['mp4'])){
		$format = 'mp4';
	}else if(isset($_segs['flv'])){
		$format = 'flv';
	}else{
		return ['ret'=>false,'msg'=>"no flv mp4 file"];
		// ();
	}
	return ['ret'=>true, 'data'=>[ 'key'=>$_segs[$format][0]['k'], 'len'=>count($_segs[$format]),'fileid'=>$get_data['data'][0]['streamfileids'][$format],'format'=>$format]];
};

$res = get_key_len_fileid_format($get_data);

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

function ran ($_seed)
{
	$_seed = ($_seed * 211 + 30031) % 65536;
	return ($_seed / 65536);
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

print_r($res);

echo $real_fileid = getfileid( $res['data']['fileid'],$_seed);
$len = $res['data']['len'];

// $_II = $res['data']['len']<2?
echo PHP_EOL,
$v_list = "http://f.youku.com/player/getFlvPath/sid/00_00/st/".$res['data']['format']."/fileid/".$real_fileid."?K=".$res['data']['key'];