class PostsController < ApplicationController
  load_and_authorize_resource

  skip_before_action :verify_authenticity_token
  def index
    @user = User.includes(:posts).find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(:comments, :likes).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:id])
    @post.title = params[:title]
    @post.text = params[:text]
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = 'Post successfully added!'
      redirect_to user_posts_path
    else
      render 'new'
    end
  end

  private

  def post_params
    params.permit(:text, :title)
  end
end
