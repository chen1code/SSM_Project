<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>地图功能</title>

<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<link href="./resources/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="./resources/css/animate.css" rel="stylesheet">
<link href="./resources/css/style.css" rel="stylesheet">
<link href="./resources/css/main.css" rel="stylesheet">
</head>
<style>
	#map{height: 600px}
	.search-line{margin-bottom: 20px}
	.search-line input{float: left; width: 260px;margin-right: 20px}
	#exchange-place{float: left;margin-right: 20px;line-height:34px;cursor: pointer;font-size: 16px}
</style>
	<body class="gray-bg">
	<div class="wrapper wrapper-content animated">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>地图应用</h5>
					</div>
					<div class="ibox-content">
						<div class="search-line">
                            <input type="text" placeholder="输入起点" id="startPlace" class="form-control">
                            <i id="exchange-place" class="fa fa-exchange"></i>
                            <input type="text" placeholder="输入终点" id="endPlace"class="form-control">
                            <button type="button" id="searchRoutLine" class="btn btn-primary btn-outline">搜索搭乘路线</button>
                        </div>
						<div class="col-sm-6">
							<div id="map"></div>
						</div>
						<div class="col-sm-6">
							<div id="r-result"></div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script src="./resources/js/jquery.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=8gAFL4Nkk644N3Pj1925Eu9OPIVVWRRK"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/IndoorMap/1.0/src/indoor.min.js?v=1.0.1 "></script>

<script type="text/javascript">
var map = new BMap.Map("map");
var point = new BMap.Point(112.995655,28.144858);
map.centerAndZoom(point,80);
var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
var top_right_navigation = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL}); //右上角
var geolocation = new BMap.Geolocation();
map.enableScrollWheelZoom();
//添加控件和比例尺
map.addControl(top_left_control);        
map.addControl(top_left_navigation);     
map.addControl(top_right_navigation);    
//标注弹跳
var marker = new BMap.Marker(point);  // 创建标注
map.addOverlay(marker);               // 将标注添加到地图中
marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
//
var transit = new BMap.TransitRoute(map, {
	renderOptions: {map: map, panel: "r-result"}
});
$("#searchRoutLine").click(function(){
	var startP = $("#startPlace").val();
	var endP = $("#endPlace").val();
	transit.search(startP,endP);
})
$("#exchange-place").click(function(){
	var temp = $("#startPlace").val();
	$("#startPlace").val($("#endPlace").val());
	$("#endPlace").val(temp)
})
</script>

</html>