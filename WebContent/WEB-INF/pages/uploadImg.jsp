<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="upload.action" method="post" enctype="multipart/form-data">  
 <label>用户名：</label><input type="text" name="name"><br>  
 <label>密码：</label><input type="password" name="pwd"><br>  
 <label>上传头像：</label><input type="file" name="file"><br>  
 <input type="submit">  
 </form>
 <h3>显示图片</h3>  
  <img src="${basePath}${user.imgPath}">用户名：${user.userName}  
  <hr>  

</body>
<script src="./resources/js/jquery.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>

<script>




</script>
</html>