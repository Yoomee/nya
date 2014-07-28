module SearchHelper

  def link_to_all_tag
    link_to('all', '#', class: 'js-projects-all tags mb-1')
  end

  def link_to_search_tag(tag)
    link_to(tag.name, '#', class: 'js-project-filter tags mb-1', data: { tag: tag.name, selected: false })
  end

end
