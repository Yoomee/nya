// application specific javascript
$(document).ready(function() {

  $('#projects-container').imagesLoaded()
    .always( function( instance ) {
      $('#projects-container').masonry();
  });

  // adjust like count on like/dislike for link and button
  $('a.like-link').live('ajax:success', function(event, xhr, status) {
    new_count = 0
    if (xhr.removed_at) {
      new_count = parseInt(this.text) - 1
    } else {
      new_count = parseInt(this.text) + 1
    }
    if ($(this).hasClass('like-link-button')) {
      $(this).children('span').html(new_count + " like us");
    } else {
      // it is the standard link
      var icon = "<i class=\"fa fa-heart\"></i> ";
      $(this).html(icon + new_count);
    }
  });

  // activate datepickers
  $('.hasdatepicker').datepicker(
    { dateFormat: "dd-mm-yy" }
  );

  /* Update masonry on change tab  */
  var masonryUpdate = function() {
     setTimeout(function() {
         $('.row.js-masonry').masonry();
     }, 0);
  }

  $('a[data-toggle=tab]').on('shown.bs.tab', masonryUpdate);

  // handle project help form
  $('#project-help').on('ajax:success', function(event, xhr, status) {
    $('#help-modal .form-actions').hide();
    $('#help-modal .alert-danger').hide();
    $('#help-modal .alert-success').show();
  });

  $('#project-help').on('ajax:error', function(event, xhr, status) {
    $('#help-modal .alert-danger').show();
    $('#help-modal .form-actions input').removeClass('disabled').val('Send');
  });

  // activate any tooltips
  $('.help-tooltip').tooltip()

//
//   /* Update masonry on change tab  */
//
//   var masonryUpdate = function() {
//      setTimeout(function() {
//          $('.row.js-masonry').masonry();
//      }, 0);
//   }
//   $('a[data-toggle=tab]').on('shown.bs.tab', masonryUpdate);
//
//
//   // Toggle comments
//
//   $('a.comments').click(function(e){
//      e.preventDefault();
//     $(this).parents('.card-comments').next().next('.comment-input').toggleClass('expand');
//   });
//
//
//   // Tell masonry to upade on click events
//
//   $(document).on('click', masonryUpdate);
//   $(document).ajaxComplete(masonryUpdate);
//   $(window).load(masonryUpdate);
//
//   // Reply dropdown on project comments
//
//   $('a.likes').click(function(e){
//     e.preventDefault();
//     $(this).toggleClass('liked');
//   });
//   $('.pin-it').click(function(e){
//     e.preventDefault();
//     $(this).find('i').toggleClass('active');
//   });
//   $('a.like-us').click(function(e){
//     e.preventDefault();
//     $(this).toggleClass('liked').html('37 + You like us');
//   });
//
//
// // Follow button on forums
//
//   $('.btn-follow').click(function(e){
//     e.preventDefault();
//     if ($(this).hasClass('following')){
//       $(this).html("Follow").removeClass('following');
//     }
//     else{
//       $(this).html("<i class='fa fa-check'></i> Following").addClass('following');
//     }
//   });
//   $('.btn-follow')
//     .mouseover(function(e){
//     e.preventDefault();
//     if ($(this).hasClass('following')){
//       $(this).html("<i class='fa fa-times'></i> Unfollow");
//     }
//   })
//   .mouseleave(function(e){
//     e.preventDefault();
//     if ($(this).hasClass('following')){
//       $(this).html("<i class='fa fa-check'></i> Following");
//     }
//   });
//
//   $('.card').hover(function(){
//     $(this).find('.usr-link').fadeToggle();
//   });
//
//
// // Reply dropdown on project comments
//
//   var formTxt = $('<input type="text" placeholder="Add a comment" class="form-text col-md-12 mt-1">')
//
//   $('.reply').click(function(e){
//     e.stopPropagation();
//     $(this).parent('div').append(formTxt);
//     return false;
//   });
//
// // Date picker
//
  // $(function() {
  //   $('#datepicker').datepicker();
  // });
//
}); // Document ready
