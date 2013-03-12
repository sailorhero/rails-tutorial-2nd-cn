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
      sign_in @user
      flash[:success] = "欢迎登录Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "用户属性刷新成功."
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
end
