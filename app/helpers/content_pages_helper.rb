module ContentPagesHelper

  def link_to_slug(*args)
    options = args.extract_options!
    slug = args[0].to_s
    return '' unless page = ContentPage.find_by_slug(slug)
    link_to(page.link_text, "/#{page.slug}", options)
  end

end
