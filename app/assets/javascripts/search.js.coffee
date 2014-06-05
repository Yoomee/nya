window.Search =
  init: () ->
    if(window.location.hash.length)
      Search.initFromUrl()

    $('.js-projects-all').click (e) ->
      e.preventDefault()
      Search.showAll()

    $('.js-project-filter').click (e) ->
      e.preventDefault()
      $('.js-projects-all').removeClass('label-primary')
      Search.toggleTag($(this))
      Search.filterProjects()

  initFromUrl: () ->
    $('.js-projects-all').removeClass('label-primary')
    hash = window.location.hash.split(',')
    hash[0] = hash[0].substring(1);
    $.each hash, () ->
      tag = $(".js-project-filter[data-tag='#{this}']")
      Search.toggleTag(tag)
    Search.filterProjects()

  filterProjects: ->
    tags = $('.js-project-filter')
    selectedTags = []
    selectedTags.push $(tag).data('tag') for tag in tags when $(tag).data('selected')
    window.location.replace("##{selectedTags.join(',')}")
    if selectedTags.length == 0
      Search.showAll()
    else
      window.location.replace("##{selectedTags.join(',')}")
      $('#projects-container').isotope(filter: ".#{selectedTags.join('.')}" )

  showAll: ->
    $('.js-projects-all').addClass('label-primary')
    $('.js-project-filter').removeClass('label-primary')
    window.location.replace('#')
    $('#projects-container').isotope(filter: '*' )

  toggleTag: (tag) ->
    tag.toggleClass('label-primary')
    tag.data('selected', !tag.data('selected'))
