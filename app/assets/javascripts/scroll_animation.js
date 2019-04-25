// ---------------------------------------------------- //
// Scroll MagicとTweenMaxを組み合わせたスクロールアニメーション
// ---------------------------------------------------- //
$(function() {

  // 全体を制御するコントローラ
  var controller = new ScrollMagic.Controller();

  // 上昇しながら出現 
  var upAppearTween = TweenMax.fromTo(".up-appear", 2, { y:100, opacity:0 }, { delay:0.5, ease:Power4.easeOut, y:0, opacity:1 });
  var upAppearScene = new ScrollMagic.Scene({
        triggerElement: ".up-appear-trigger", 
        triggerHook: "onEnter",
        offset : 100,
        reverse: true
    })
    .setTween(upAppearTween)
    .addTo(controller);

  // 下降しながら出現 
  var downAppearTween = TweenMax.fromTo(".down-appear", 2, { y:-100, opacity:0 }, { delay:0.5, ease:Power4.easeOut, y:0, opacity:1 });
  var downAppearScene = new ScrollMagic.Scene({
        triggerElement: ".down-appear-trigger", 
        triggerHook: "onEnter",
        offset : 100,
        reverse: true
    })
    .setTween(downAppearTween)
    .addTo(controller);

  // 右側よりスライドしながら出現
  var rightSlideTween = TweenMax.fromTo(".right-slide", 2, {x:100, opacity:0 }, { delay:0.5, ease:Power4.easeOut, x:0, opacity:1 });
  var rightSlideScene = new ScrollMagic.Scene({
        triggerElement: ".right-slide-trigger", 
        triggerHook: 'onEnter',
        offset : 100,
        reverse: true,
    })
    .setTween(rightSlideTween)
    .addTo(controller);

  // 左側よりスライドしながら出現
  var leftSlideTween = TweenMax.fromTo(".left-slide", 2, {x:-100, opacity:0 }, { delay:0.5, ease:Power4.easeOut, x:0, opacity:1 });
  var leftSlideScene = new ScrollMagic.Scene({
        triggerElement: ".left-slide-trigger", 
        triggerHook: 'onEnter',
        offset : 100,
        reverse: true,
    })
    .setTween(leftSlideTween)
    .addTo(controller);
    
});