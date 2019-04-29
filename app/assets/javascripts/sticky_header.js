// スクロールした際に以下を変化させる
// * ヘッダーに白い背景をスライドインさせる
// * ヘッダーの縦サイズを縮めてヘッダー文字やロゴの位置を少し上に移動させる
// * ロゴの位置を少し左へ移動させる


// HTMLの読み込みが終わった処理を始める
// jQuery(JavaScript)はHTMLが完全に読み込まれないまま
// 何か処理を実行すると大抵正しく動作しません。
// $(function(){ も $(document).ready(function(){ も同じ意味
$(function() {

  // スクロールイベント発生
  $(window).on('scroll', function() {

    // 下方向へ100スクロールしたら
    if($(window).scrollTop() > 100) {
      $('.nav-bg').removeClass('bg-hidden');
      $('.nav-bg').addClass('bg-visible');
      $('header').addClass('header-animation');
      $('.logo').addClass('logo-animation');
      //ドロップダウンのサブメニューの背景
      $('ul.sub').addClass("sub-bgVisible");
      $('ul.sub').removeClass("sub-bgHidden");
      
    } else {
      $('.nav-bg').removeClass('bg-visible');
      $('.nav-bg').addClass('bg-hidden');
      $('header').removeClass('header-animation');
      $('.logo').removeClass('logo-animation');
      //ドロップダウンのサブメニューの背景
      $('ul.sub').addClass("sub-bgHidden");
      $('ul.sub').removeClass("sub-bgVisible");
    }

  });
});