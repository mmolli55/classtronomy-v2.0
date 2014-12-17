// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function ready() {

  // Quiz Responses
  $('.quiz_guess').click(function() {
    if($(this).text() == $(this).siblings('p').text()) {
      $(this).parents(':nth(1)').removeClass('incorrect_highlighting');
      $(this).parents(':nth(1)').addClass('correct_highlighting');
      $(this).parents(':nth(1)').children('.incorrect_declaration').hide();
      $(this).parents(':nth(1)').children('.correct_declaration').show();
    }else {
      $(this).parents(':nth(1)').removeClass('correct_highlighting');
      $(this).parents(':nth(1)').addClass('incorrect_highlighting');
      $(this).parents(':nth(1)').children('.correct_declaration').hide();
      $(this).parents(':nth(1)').children('.incorrect_declaration').show();
    }
  });


  var correctAnswerCount = 0;

  $('.quiz_guess').one('click', function() {

    // PATCH scores/:id?score=correctAnswerCount

    if($(this).text() == $(this).siblings('p').text()) {
      correctAnswerCount += 1;
      if(correctAnswerCount === 5){
        alert("Congratulations, you unlocked the course badge! Visit your profile page to see all the badges you have collected.");
        // ajax patch, to update user's score for this course
        score_patch_url = '/scores/' + gon.course_score_id + "?score=" + correctAnswerCount;
        $.ajax({
          url: score_patch_url,
          type: 'PATCH',
          // success: function(){
          //   $('.users_badges').appendTo???
          // }
        });

      }
    }
  });

}

$(document).ready(ready);
$(document).on('page:load', ready);
