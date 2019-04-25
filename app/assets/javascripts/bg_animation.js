// 背景イメージのポジションを常に変化させる
$(function() {

  var bg_x = 0;
  var bg_y = 0;

  //一定時間ごとに繰り返し処理を行う
  setInterval(function(){
    bg_x += -.2;  //左方向（X軸）へ0.2移動
    bg_y += -.2;  //上方向（Y軸）へ0.2移動
    $("body").css("background-position", bg_x + "px " + bg_y + "px");
  });

});