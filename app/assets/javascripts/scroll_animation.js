// ---------------------------------------------------- //
// Scroll MagicとTweenMaxを組み合わせたスクロールアニメーション
// ---------------------------------------------------- //
$(function() {

  console.log("scrollMagic起動！！！")

  // 全体を制御するコントローラ
  var controller = new ScrollMagic.Controller();

  // 上昇しながら出現 
  if($(".up-appear-trigger").length){
    var upAppearTween = TweenMax.fromTo(".up-appear", 2, { y:100, opacity:0 }, { delay:0.5, ease:Power4.easeOut, y:0, opacity:1 });
    var upAppearScene = new ScrollMagic.Scene({
          triggerElement: ".up-appear-trigger", 
          triggerHook: "onEnter",
          offset : 100,
          reverse: true
      })
      .setTween(upAppearTween)
      .addTo(controller);
  }

  // 下降しながら出現 
  if($(".down-appear-trigger").length){
    var downAppearTween = TweenMax.fromTo(".down-appear", 2, { y:-100, opacity:0 }, { delay:0.5, ease:Power4.easeOut, y:0, opacity:1 });
    var downAppearScene = new ScrollMagic.Scene({
          triggerElement: ".down-appear-trigger", 
          triggerHook: "onEnter",
          offset : 100,
          reverse: true
      })
      .setTween(downAppearTween)
      .addTo(controller);
  }

  // 右側よりスライドしながら出現
  if($(".right-slide-trigger").length){
    var rightSlideTween = TweenMax.fromTo(".right-slide", 2, {x:100, opacity:0 }, { delay:0.5, ease:Power4.easeOut, x:0, opacity:1 });
    var rightSlideScene = new ScrollMagic.Scene({
          triggerElement: ".right-slide-trigger", 
          triggerHook: 'onEnter',
          offset : 100,
          reverse: true,
      })
      .setTween(rightSlideTween)
      .addTo(controller);
  }

  // 左側よりスライドしながら出現
  if($(".left-slide-trigger").length){
    var leftSlideTween = TweenMax.fromTo(".left-slide", 2, {x:-100, opacity:0 }, { delay:0.5, ease:Power4.easeOut, x:0, opacity:1 });
    var leftSlideScene = new ScrollMagic.Scene({
          triggerElement: ".left-slide-trigger", 
          triggerHook: 'onEnter',
          offset : 100,
          reverse: true,
      })
      .setTween(leftSlideTween)
      .addTo(controller);
  }


    
  // グリッドコンテンツを順番に出現
  // タイムライン fromTo(要素指定、時間、初期値、変化後、前倒し時間)
  var tl = new TimelineMax();
  tl.add( TweenLite.fromTo(".grid-block-1", 1, {y:30,opacity:0 }, {ease: Power4.easeOut,y:0,opacity:1 }) );
  tl.add( TweenLite.fromTo(".grid-block-2", 1, {y:30,opacity:0 }, {ease: Power4.easeOut,y:0,opacity:1 }), "-=0.5");
  tl.add( TweenLite.fromTo(".grid-block-3", 1, {y:30,opacity:0 }, {ease: Power4.easeOut,y:0,opacity:1 }), "-=0.5");
  tl.add( TweenLite.fromTo(".grid-block-4", 1, {y:30,opacity:0 }, {ease: Power4.easeOut,y:0,opacity:1 }), "-=0.5");
  tl.add( TweenLite.fromTo(".grid-block-5", 1, {y:30,opacity:0 }, {ease: Power4.easeOut,y:0,opacity:1 }), "-=0.5");
  tl.add( TweenLite.fromTo(".grid-block-6", 1, {y:30,opacity:0 }, {ease: Power4.easeOut,y:0,opacity:1 }), "-=0.5");

  var gridContainer = new ScrollMagic.Scene({
        triggerElement: ".grid-block", 
        triggerHook: 'onEnter',
        offset : 0,
        reverse: false,
    })
    .setTween(tl)
    .addTo(controller);
    
});