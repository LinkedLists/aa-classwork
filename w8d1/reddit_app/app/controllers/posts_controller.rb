class PostsController < ApplicationController
  before_action :require_is_author, only: [:update]
  before_action :require_logged_in, only: [:create, :update]

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
    render :show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def require_is_author
    unless current_user.id == Post.find_by_id(params[:id]).user_id
      flash[:errors] = ["Post can only be edited by the author"]
      redirect_to post_url(params[:id])
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id, :user_id)
  end
end
