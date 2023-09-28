class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comments = @post.comments
    
    if @user.posts.include?(@post)
      @index = @user.posts.order(:created_at).pluck(:id).index(@post.id) + 1
    else
      @index = nil
    end
  end
end
