module ApplicationHelper

  def short_date(dt)
    dt.strftime('%Y-%m-%d')
  end

  def long_date(dt)
    dt.strftime("#{dt.day.ordinalize} %B %Y")
  end
end
