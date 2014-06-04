// supports project create form
$(document).ready(function() {
  $('#project-create').parsley();

  $('#project-create .next-btn').on("click", function(e) {
    e.preventDefault();
    console.log('pressed');
    var current = $(this).data('currentGroup');
    var next = $(this).data('nextGroup');

    // validate going forward through the form
    if (next > current)
      if (false === $('#project-create').parsley().validate('group' + current))
        return;

    // move to next step when valid
    $('.group' + current)
      .removeClass('show')
      .addClass('hidden');

    $('.group' + next)
      .removeClass('hidden')
      .addClass('show');

    // TODO: if last step hide self in favour of create button
    // TODO: do we need a back button
  });
});
