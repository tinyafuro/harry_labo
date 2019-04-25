// ---------------------------- //
// ハンバーガーメニューの切り替え機能 
// ---------------------------- //

$(function() {

  //メニューアイコンをクリック
  $(document).on('click','#nav-toggle', function() {
    //bodyタグへopenクラスを付ける（外す）
    $('body').toggleClass('open');
   });

});
