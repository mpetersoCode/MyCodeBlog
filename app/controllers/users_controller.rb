class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    if(params[:user][:email] == "MikeHasAMac@gmail.com")
      if(@user.save)
        redirect_to @user
      end
    else
      redirect_to root_path
    end
  end
    
    
    def show
      if signed_in?
        @user = current_user
        @posts = @user.posts.paginate(page: params[:page])
        @post = @user.posts.build
      else
        @users = User.all
        @user = @users[0]
        @posts = @user.posts.paginate(page: params[:page])
      end
    end
end
