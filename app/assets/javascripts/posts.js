$(function(){
  $('#power').bind('keyup change', function(){
    var content = $("#power").val();
    $('#preview').html(content);
  });
});

$(function(){
  $('input[name="post[kind]"]:radio').change( function(){
    var dataUrl = "/assets/" + this.value;
    var white_word = ["fire", "cat", "lion", "love", "people", "thunder", "star", "sunset", "joy3", "wow", "cow", "think", "black", "brown", "darkblue", "purple", "red", "kokuban", "donguri", "cat-bikkuri", "owata"]
    if (white_word.includes(this.value)){
      $('#preview').css('color', 'white');
    } else {
      $('#preview').css('color', 'black');
    }
    $("#main-image").attr('src',dataUrl);
  });
});

$(function(){
  $("#save-button").on("click", function () {
    // 生成する文字列の長さ
    var l = 8;
    // 生成する文字列に含める文字セット
    var c = "abcdefghijklmnopqrstuvwxyz0123456789";
    var cl = c.length;
    var r = "";
    for(var i=0; i<l; i++){
      r += c[Math.floor(Math.random()*cl)];
    }
    window.open(`https://twitter.com/share?url=https://bigtweet.herokuapp.com/posts/${r}&hashtags=BigTweet`, '_blank');
      html2canvas($('#target').get(0)).then( function (canvas) {
        var imgData = canvas.toDataURL();
        $("#post_picture").val('');
        $("#post_picture").val(imgData);
        $("#post_random").val('');
        $("#post_random").val(r);
        $('#aaa').submit();
      });
  });
});

  $(function(){
    $("#word-bigger").on("click", function () {
      $('#preview').css('font-size', '+=10');
    });
    $("#word-smaller").on("click", function () {
      $('#preview').css('font-size', '-=10');
    });
    $("#up").on("click", function () {
      $('#preview').css('top', '-=10');
    });
    $("#down").on("click", function () {
      $('#preview').css('top', '+=10');
    });
    $("#left").on("click", function () {
      $('#preview').css('left', '-=10');
    });
    $("#right").on("click", function () {
      $('#preview').css('left', '+=10');
    });
    $("#vertical").on("click", function () {
      if($('#preview').css('writing-mode') === 'horizontal-tb'){
        $('#preview').css({
          '-webkit-writing-mode': 'vertical-rl',
          '-ms-writing-mode': 'tb-rl',
          'writing-mode': 'vertical-rl',
          'text-orientation': 'upright'
        });
      } else {
        $('#preview').css({
          '-webkit-writing-mode': '',
          '-ms-writing-mode': '',
          'writing-mode': '',
          'text-orientation': ''
        });
      }
    });
    $("#font-color").on("click", function () {
      if($('#preview').css('color') === 'rgb(0, 0, 0)'){
        $('#preview').css('color', 'white');
      } else {
        $('#preview').css('color', 'black');
      }
    });
  });

  $(function(){
    $('#myfile').change(function(e){
      //ファイルオブジェクトを取得する
      var file = e.target.files[0];
      var reader = new FileReader();
      //画像でない場合は処理終了
      if(file.type.indexOf("image") < 0){
        alert("画像ファイルを指定してください。");
        return false;
      }
      //アップロードした画像を設定する
      reader.onload = (function(file){
        return function(e){
          $("#main-image").attr("src", e.target.result);
          $("#main-image").attr("title", file.name);
        };
      })(file);
      reader.readAsDataURL(file);
    });
  });
