class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.posts_by(current_user).page(params[:page]).per(10)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to @post, notice: 'Successful post'
    else
      render :new
    end
  end

  def edit
    authorize @post
  end

  def update
    authorize @post
    if @post.update(post_params)
      redirect_to @post, notice: 'Successful post edition'
    else
      render edit
    end
  end

  def show
  end

  def destroy
    @post.delete
    redirect_to posts_path, notice: 'Successful deletion'
  end

  private

  def post_params
    #require brings in the model of post
    #permit whielists date rationale, status making them the only availible params (security reasons)
    params.require(:post).permit(:date, :rationale, :status, :overtime_request)
  end

  def set_post
    @post = Post.find(params[:id])

  end
end
