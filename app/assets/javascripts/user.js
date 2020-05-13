// 画像プレビュー
$(function(){
    function readURL(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
          $('#item_image').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
      }
    }
    $("#post_img").change(function(){
      readURL(this);
    });
})

//■page topボタン
$(function(){
var topBtn=$('#pageTop');
topBtn.hide();


//◇ボタンの表示設定
$(window).scroll(function(){
  if($(this).scrollTop()>80){
    //---- 画面を80pxスクロールしたら、ボタンを表示する
    topBtn.fadeIn();
  }else{
    //---- 画面が80pxより上なら、ボタンを表示しない
    topBtn.fadeOut();
  }
});


// ◇ボタンをクリックしたら、スクロールして上に戻る
topBtn.click(function(){
  $('body,html').animate({
  scrollTop: 0},500);
  return false;
});
});
