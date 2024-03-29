window.addEventListener('DOMContentLoaded', function(){
  $('.toggle dt').on('click', function() {
    $(this).next('dd').slideToggle();
    $('dd').not($(this).next('dd')).slideUp();
  });
});


window.addEventListener('DOMContentLoaded', function(){
  // タブをクリックした時の処理
  $('.tab').click(function(){
    // 現在アクティブなタブを切り替え
    $('.tab-active').removeClass('tab-active');
    // タブをアクティブにする
    $(this).addClass('tab-active');
    // 現在アクティブなタブの中身を非表示
    $('.box-show').removeClass('box-show');
    // クリックしたタブから順番を取得
    const index = $(this).index();
    // クリックしたタブと同じ順番のコンテンツを表示
    $('.tabbox').eq(index).addClass('box-show');
  });
});

window.addEventListener('DOMContentLoaded', function() {
  function toggleChangeBtn() {
    var slideIndex = $('.slide').index($('.active'));
    $('.change-btn').show();
    if (slideIndex == 0) {
      $('.prev-btn').hide();
    } else if (slideIndex == $('.slide').length - 1) {
      $('.next-btn').hide();
    }
  }
  
  $('.index-btn').click(function() {
    $('.active').removeClass('active');
    var clickedIndex = $('.index-btn').index($(this));
    $('.slide').eq(clickedIndex).addClass('active');
    toggleChangeBtn();
    
  });
  
  $('.change-btn').click(function() {
    var $displaySlide = $('.active');
    $displaySlide.removeClass('active');
    if ($(this).hasClass('next-btn')) {
      $displaySlide.next().addClass('active');
    } else {
      $displaySlide.prev().addClass('active');
    }
    toggleChangeBtn();
    
  });
});

window.addEventListener('DOMContentLoaded', function(){
  $("#blockBtn").click(function() {
    $("#wordBox1").css("display", "block");
  });
  $("#nonBtn").click(function() {
    $("#wordBox1").css("display", "none");
  });
  $("#blockBtn2").click(function() {
    $("#wordBox2").css("display", "block");
  });
  $("#nonBtn2").click(function() {
    $("#wordBox2").css("display", "none");
  });
  $("#blockBtn3").click(function() {
    $("#wordBox3").css("display", "block");
  });
  $("#nonBtn3").click(function() {
    $("#wordBox3").css("display", "none");
  });
});

window.addEventListener('DOMContentLoaded', function(){
  $('.slide-top').slick({
    accessibility: true,
    autoplay: true,
    autoplaySpeed: 1000,
    dots: true,
    fade: true,
  });
});

window.addEventListener('DOMContentLoaded', function(){
  $("#keyword").on("input", searchEvent);
  function searchEvent() {
    const results = [];
    const inputText = $(this).val();
    if (inputText) {
      $("#wordBox1 p").each((index, name) => {
        if (name.textContent.indexOf(inputText) !== -1) {
          results.push(name.textContent);
        }
      });
      $("#result").empty();
      $.each(results, (index, name) => {
        $("#result").append("<li>" + name + "</li>");
      });
    }
  }
});