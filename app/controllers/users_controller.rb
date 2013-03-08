# --encoding: utf-8 --
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      #成功保存后的处理
      flash[:success] = "欢迎登录Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
end
