①加载信息文件，将内容转换为字符串。加载需要时间，此事很容易上当。如果加载未完成，很容易造成后面读不到数据，报错。
stop();
mysongs.load ("http://v.youku.com/player/getPlayList/VideoIDS/" + page[p]);
mysongs.onLoad = function (success)
{
　　if (success) {
　　　　jsonstring = mysongs.toString ();
　　}
　　play ();
};

②更换非正常字符码，利用json类文件，将字符串处理为哈希表格式，以便使用。
jsonstring = jsonstring.split ("&quot;").join ('"');
var json:JSON = new JSON ();
var jsonobj:Object = json.parse (jsonstring);　　　　//字符串转哈希表；
var _seed = jsonobj.data[0].seed;　　　　　　　　//此值将参与解密计算；　
var _key;　　　　　　　　　　　　　　　　　　　//省去此值计算，直接读取；　
var len;　　　　　　　　　　　　　　　　　　　　//片段数；
var fileid;　　　　　　　　　　　　　　　　　　　//此值将参与解密计算；　
var format;　　　　　　　　　　　　　　　　　　//视频格式字符；
if (jsonobj.data[0].segs.mp4) {
　　_key = jsonobj.data[0].segs.mp4[i].k;
　　len = jsonobj.data[0].segs.mp4.length;
　　fileid = jsonobj.data[0].streamfileids.mp4;
　　format = "mp4";
}
else {
　　_key = jsonobj.data[0].segs.flv[i].k;
　　len = jsonobj.data[0].segs.flv.length;
　　fileid = jsonobj.data[0].streamfileids.flv;
　　format = "flv";
}

③解密过程
var mixed:String;
var realId:String;
function getFileID (fileid)
{
　　getFileIDMixString ();
　　var ids = fileid.split ("*");
　　realId = "";
　　for (var j = 0; j < ids.length - 1; ++j) {
　　　　realId = realId + mixed.charAt (parseInt (ids[j]));
　　}
　　//return realId.toString ();
}
getFileID (fileid);
//+++++++++++++++++++++++++++++++
function ran ()
{
　　_seed = (_seed * 211 + 30031) % 65536;
　　return (_seed / 65536);
}
//+++++++++++++++++++++++++++++++
function getFileIDMixString ()
{
　　mixed = "";
　　var _source = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ/\\:._-1234567890";
　　var len = _source.length;
　　for (var i = 0; i < len; ++i) {
　　　　var index = int (this.ran () * _source.length);
　　　　mixed = mixed + _source.charAt (index);
　　　　_source = _source.split (_source.charAt (index)).join ("");
　　}
}
//+++++++++++++++++++++++++++++++++++以下拼接出完整地址++++++++++
var II = String (i).length < 2 ? "0" + i : i;
var temp1 = realId.slice (0, 8);
var temp2 = realId.slice (10);
var temp0 = temp1 + II + temp2;
var vlist = [];
vlist[0] = "http://f.youku.com/player/getFlvPath/sid/00_00/st/" + format + "/fileid/" + temp0 + "?K=" + _key;
trace (vlist[0]);　　　//完整地址。注意时效。
