class PostsController < ApplicationController
  before_action :authorize, only: [:edit, :update, :new, :create]
  before_action :post_owner, only: [:edit, :update, :destroy]

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
      redirect_to current_user
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to current_user
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Your Post has been successfully updated!"
      redirect_to current_user
    else
      render 'edit'
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :image, :user_id)
  end
end
