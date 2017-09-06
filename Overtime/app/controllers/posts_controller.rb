class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Successful post'
    else
      render :new
    end
  end

  def show
  end

  private

  def post_params
    #require brings in the model of post
    #permit whielists date and rationale, making them the only availible params (security reasons)
    params.require(:post).permit(:date, :rationale)
  end

  def set_post
    @post = Post.find(params[:id])
    
  end
end
