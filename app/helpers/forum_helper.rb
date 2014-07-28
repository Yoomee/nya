module ForumHelper

  def follow_link
    if current_user
      text, url, method = current_user.followed_forums.include?(@forum) ? ['Unfollow', unfollow_forum_path, :delete] : ['Follow', follow_forum_path, :post]
      remote = true
    else
      text, url, method, remote = ['Follow', sign_up_path(return_to: forum_path(@forum)), :get, false]
    end
    link_to(text, url, method: method, remote: remote, class: 'btn btn-lg btn-primary btn-follow', id: 'follow-link')
  end

end
