# -- encoding: utf-8 --
class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by_email(params[:sessions][:email])
    if user && user.authenticate(params[:sessions][:password])
      # Sign the user in and redirect to the user's show page.
      flash[:notice] = "用户#{user.name}成功登录."
      sign_in user
      redirect_to user
    else
      # Create an error message and re-render the signin form.
      flash.now[:error] = "无效的Email地址或口令."
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
