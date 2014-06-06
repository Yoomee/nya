class PostsController < ApplicationController
  include YmPosts::PostsController

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      @new_post = Post.new(target: @post.target, user: @post.user, context: @post.context)
    end
  end

  private
  def permitted_post_parameters
    %w(context file image retained_file retained_image tag_list target_id target_type text video_url)
  end

end
