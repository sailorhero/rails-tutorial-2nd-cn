#-- encoding: utf-8 --
require 'spec_helper'

describe "Authentication" do
  subject{ page }

  describe "signin page" do
    before { visit signin_path}

    it { should have_selector('h1',text:"Sign in")}
    it { find('title').native.text.should have_content(full_title("Sign in"))}

    describe "登录输入不正确" do
      before { click_button "登录"}

      it { should have_selector('h1',text:"Sign in")}
      it { should have_selector('div.alert.alert-error','Invalid')}

      describe "跳转其他页面" do
        before{ click_link 'Home'}
        it {should_not have_selector('div.alert.alert-error')}
      end
    end

    describe "输入有效信息" do
      let(:user){FactoryGirl.create(:user)}

      # before do
      #   fill_in 'Email', with:user.email
      #   fill_in 'Password', with: user.password
      #   click_button "登录"
      # end
      before { valid_signin(user)}

      it {should have_selector('h1',text:user.name)}
      it {should have_link('Profile', href:user_path(user))}
      it {should have_link('Sign out', href:signout_path)}
      it {should_not have_link('Sign in', href:signin_path)}

      describe "退出登录" do
        before { click_link "Sign out"}
        it {should have_link('Sign in')}
      end
    end
  end
end
