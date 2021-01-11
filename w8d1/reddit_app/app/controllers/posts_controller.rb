class PostsController < ApplicationController
  before_action :require_is_author, only: [:update, :destroy]
  before_action :require_logged_in, only: [:create, :update]

  def new
    @post = Post.new
    @subs = Sub.all
    render :new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_post_url
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
    render :show
  end

  def edit
    @post = Post.find_by_id(params[:id])
    render :edit
  end

  def update
    @post = Post.find_by_id(params[:id])

    if @post
      if @post.update(post_params)
        redirect_to post_url(@post)
      else
        flash.now[:errors] = @post.errors.full_messages
        render :edit
      end
    else
      flash[:errors] = ["Post can't be found"]
      redirect_to subs_url
    end
  end

  def destroy
    post = Post.find_by_id(params[:id])

    post.delete if post
      
      
    # else
    # end
    redirect_to subs_url
  end

  def require_is_author
    unless current_user.id == Post.find_by_id(params[:id]).user_id
      flash[:errors] = ["Post can only be edited by the author"]
      redirect_to post_url(params[:id])
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, :user_id, :sub_ids => [])
  end
end
