class PostsController < ApplicationController
  before_filter :signed_in_user

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "Micropost created!"
      redirect_to current_user
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end
end
