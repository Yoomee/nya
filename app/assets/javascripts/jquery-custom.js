$(document).ready(function() {
  // $('#projects-container').masonry();

  $('#projects-container').imagesLoaded()
    .always( function( instance ) {
      $('#projects-container').masonry();
    })


    $(function() {
      $('.hasdatepicker').datepicker();
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

  // activate select2
  $('.select2tags').select2(
    {tags:[]}
  );

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
