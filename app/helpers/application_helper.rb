module ApplicationHelper

  def short_date(dt)
    dt.strftime('%Y-%m-%d')
  end

  def long_date(dt)
    dt.strftime("#{dt.day.ordinalize} %B %Y")
  end

  def get_project_category_path(project_category)
    "#{project_categories_path}/#{project_category.slug.downcase}"
  end
end
