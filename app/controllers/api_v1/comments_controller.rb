class ApiV1::CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @post = Post.find(params[:id])
    @comments = @post.comments
    render json: @comments
  end

  def create
    @post = current_user.posts.find(params[:id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      render json: @comment, status: :created
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
