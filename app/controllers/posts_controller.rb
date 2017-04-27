class PostsController < ApplicationController
  before_action :authorize, only: [:edit, :update, :new, :create]
  before_action :correct_user, only: [:edit, :update, :new, :create]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Your post was successfully created!"
      redirect_to root_path
    else
      redirect_to new_post
    end
  end

  def destroy
    @post = post.find params[:id]
    @post.destroy
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Your Post has been successfully updated!"
      redirect_to post_path
    else
      render 'edit'
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :image, :user_id)
  end
end
