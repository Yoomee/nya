class BlogPostsController < ApplicationController
  load_and_authorize_resource

  def create
    if @blog_post.save
      redirect_to @blog_post
    else
      render :new
    end
  end

  def destroy
    @blog_post.destroy
    redirect_to blog_posts_path
  end

  def edit
  end

  def index
    @blog_posts = @blog_posts.order(created_at: :desc).paginate(page: params[:page])
  end

  def new
  end

  def show
  end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post
    else
      render :edit
    end
  end

  private
  def blog_post_params
    params.require(:blog_post).permit(:title, :subtitle, :text, :image, :retained_image, :remove_image)
  end
end
