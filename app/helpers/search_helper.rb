module SearchHelper

  def link_to_all_tag
    link_to('all', '#', class: 'js-projects-all pull-left mr-1 mb-1 label label-default label-primary')
  end

  def link_to_search_tag(tag)
    link_to(tag.name, '#', class: 'js-project-filter pull-left mr-1 mb-1 label label-default', data: { tag: tag.name, selected: false })
  end

end
