// application specific javascript
$(document).ready(function() {


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

  // only run isotope on projects when images are loaded
  $('#projects-container').imagesLoaded()
    .always( function( instance ) {
      $('#projects-container').isotope();
  });



  // Update isotope on change tab  */
  var isotopeUpdate = function() {
     setTimeout(function() {
         $('.row.js-isotope').isotope();
     }, 0);
  };

  // update isotope on tab switch
  $('a[data-toggle=tab]').on('shown.bs.tab', isotopeUpdate);

  // handle project help form
  $('#project-help').on('ajax:success', function(event, xhr, status) {
    $('#help-modal .form-actions').hide();
    $('#help-modal .alert-danger').hide();
    $('#help-modal .alert-success').show();
  });

  // handle errors on project help modal
  $('#project-help').on('ajax:error', function(event, xhr, status) {
    $('#help-modal .alert-danger').show();
    $('#help-modal .form-actions input').removeClass('disabled').val('Send');
  });

  // activate any tooltips
  $('.help-tooltip').tooltip();

});
