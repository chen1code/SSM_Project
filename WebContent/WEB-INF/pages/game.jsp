<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>月饼游戏 1.0</title>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1, initial-scale=1, user-scalable=no">
    <style>
           /* body{
                background: url(./resources/assets/bg/sky.jpg) repeat;
            } */
           .container{
                margin: auto;
           }
           .game{
                width: 600px;
                height: 600px;
                margin: auto;
           }
    </style>
</head>

<body>
    <div class="container">
        <div class="game" id="game"></div>
    </div>
</body>
<script src="./resources/js/game/phaser.min.js"></script>
<script src="./resources/js/game/game.js"></script>
</html>
