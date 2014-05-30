module ProfileHelper
  def link_to_facebook(user)
    link_to('', "https://facebook.com/#{user.facebook}", :class => 'facebook', :icon => 'facebook') if user.facebook?
  end

  def link_to_twitter(user)
    link_to('', "https://twitter.com/#{user.twitter}", :class => 'twitter', :icon => 'twitter') if user.twitter?
  end

  def link_to_website(user)
    link_to('', externalize_url(user.website), :icon => 'globe') if user.website?
  end
end
