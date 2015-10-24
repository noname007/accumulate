<?php
// http://pl.youku.com/playlist/m3u8?ctype=12&ep={0}&ev=1&keyframe=1&oip={1}&sid={2}&token={3}&type={4}&vid={5}
// 
// 
defined("DEBUG") or define("DEBUG", true);
// var_dump(DEBUG);
// 
// 
function print_ascii($str){
	$len = strlen($str);
	if(DEBUG){
		// var_dump($len);
	}
	for($i = 0;$i < $len; ++$i){
		echo ord($str[$i]),' ';
	}
}
function myEncoder($a, $c, $isToBase64)
{
	$result = "";
	//             List<byte> bytesR = new List<byte>();
	$f = 0;
	$h = 0;
	$q = 0;
	// int[] b = new int[256];
	for ($i = 0; $i < 256; $i++)
		$b[$i] = $i;
	while ($h < 256)
	{
		$f = ($f + $b[$h] + $a[$h % strlen($a)]) % 256;
		$temp = $b[$h];
		$b[$h] = $b[$f];
		$b[$f] = $temp;
		$h++;
	}
	$f = 0; $h = 0; $q = 0;
	while ($q < strlen($c))
	{
		$h = ($h + 1) % 256;
		$f = ($f + $b[$h]) % 256;
		$temp = $b[$h];
		$b[$h] = $b[$f];
		$b[$f] = $temp;
		$result .= chr($c[$q] ^ $b[($b[$h] + $b[$f]) % 256]);
		// $byte[] bytes = new byte[] { (byte)(c[q] ^ b[(b[$h] + b[$f]) % 256]) };
		// $bytesR.Add(bytes[0]);
		// $result += System.Text.ASCIIEncoding.ASCII.GetString(bytes);
		$q++;
	}
	if ($isToBase64)
	{
		return base64_encode($result);
		// 		$Byte[] byteR = bytesR.ToArray();
		//         $result = Convert.ToBase64String(byteR);
	}
	return $result;
}
	function getEp($vid, $ep)
	{
		$template1 = "becaf9be";
		$template2 = "bf7e5f01";

		
		// byte[] bytes = Convert.FromBase64String(ep);
		// $ep = ystem.Text.ASCIIEncoding.ASCII.GetString(bytes);
		// if(DEBUG)
		// {
		// 	echo $vid,PHP_EOL;
		// 	echo $ep,PHP_EOL;
		// 	echo "=========================================";
		// }
		$bytes = base64_decode($ep);
		// $bytes = base64_decode('MwXRTAsbJLnb0PbJ8uJxAdSivUU11wnKXxc=');
		// var_dump($bytes);
		// print_ascii($bytes);
		// echo $bytes;
		// exit();
		// echo 
		$temp = myEncoder($template1, $bytes, false);
		print_ascii($temp);
		// $part = temp.Split('_');
		// var_dump($temp);
		exit();
		$part = explode("_", $temp);
		// echo 
			$sid = $part[0];
		// echo 
			$token = $part[1];
		// sprintf("")   MwXRTAsbJLnb0PbJ8uJxAdSivUU11wnKXxc=
		$whole = sprintf("{%s}_{%s}_{%s}", $sid, $vid, $token);
		// byte[] newbytes = System.Text.ASCIIEncoding.ASCII.GetBytes(whole);
		echo 
			$new_ep = myEncoder($template2, base64_decode($whole), true);

		return [$new_ep,$sid,$token];
	}

function getVid( $url)
{
	// $strRegex = '/(?<=id_)(\w+)/';
	$strRegex = '/(?<=id_)\w+/';
 	preg_match($strRegex, $url, $matcher);
 	// print_r($matcher);
 	return $matcher[0];
}

$vid = getVid("http://v.youku.com/v_show/id_XNzk2NTI0MzMy.html");

// echo 

	if(DEBUG && is_file("av.info.txt")){
		echo 'read file',PHP_EOL;
		$get_data_1 = file_get_contents("av.info.txt");
		$get_data = json_decode($get_data_1,1);
		// print_r($get_data );
		// echo $get_data_1;
		$get_data_1 = '';
	}else{
		echo 'http request';
		$get_data_1 = file_get_contents("http://v.youku.com/player/getPlayList/VideoIDS/{$vid}/Pf/4/ctype/12/ev/1");
		file_put_contents("av.info.txt", $get_data_1);
	}

// echo 
	$ep = $get_data['data'][0]['ep'];

getEp($vid,$ep);
// http://pl.youku.com/playlist/m3u8?ctype=12&ep={0}&ev=1&keyframe=1&oip={1}&sid={2}&token={3}&type={4}&vid={5}
// hd2
// 
// 
// 
// 
// print("-------------------");
// $a = array_reduce(range(0,256),
// 	function($result,$item){
// 		echo $item,' ',chr($item),"   ";
// 		$result[$item]= chr($item);
// 		return $result;
// 	},'\x0');

// var_dump($a);
// $a = 0;
// 
// 
// ArrayFix()
// echo $a."\x0";
// 
// var_dump($a);
// 
// 
// $str = "\x0\x1";
// var_dump($str);
// 
// echo "111111111111111111111";
// print_ascii("hello world	");
// echo chr("100");