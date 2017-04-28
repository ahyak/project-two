class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorize, :correct_user,
                :post_owner

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authorize
    unless logged_in?
    flash[:alert] = "Please log in to continue!"
    redirect_to login_path
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

  def post_owner
    @post = Post.find(params[:id])
    redirect_to(root_url) unless @post.user == current_user
  end

end
