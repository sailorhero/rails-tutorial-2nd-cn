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
      it {should have_link('Users', href:users_path)}
      it {should have_link('Profile', href:user_path(user))}
      it {should have_link('Settings',href:edit_user_path(user))}
      it {should have_link('Sign out', href:signout_path)}

      it {should_not have_link('Sign in', href:signin_path)}

      describe "退出登录" do
        before { click_link "Sign out"}
        it {should have_link('Sign in')}
      end
    end
  end

  describe "认证" do
    describe "用户未登录" do
      let(:user){FactoryGirl.create(:user)}

      describe "在User控制器中" do
        describe "访问编辑Profile页面" do
          before{ visit edit_user_path(user)}

          it { current_path.should == signin_path}
        end

        describe "访问用户列表页面" do
          before {visit users_path}
          it { current_path.should == signin_path}
        end
        #使用capybara 2.0,不能使用rspec-rails的put方法，无法直接访问Update。 
        #describe "提交Update操作" do    
        #   before do 
        #     visit edit_user_path(user)
        #     click_button "保存"
        #   end         
        #   it { should have_selector('h1',"Sign in")}
        # end

        describe "when attempting to visit a protected page" do
          before do
            visit edit_user_path(user)
            fill_in "Email", with: user.email
            fill_in "Password", with: user.password
            click_button "登录"
          end

          describe "after signing in" do
            describe "should render the desired protected page" do
              it { should have_selector('h1', '编辑个人信息') }
              it { should have_field 'user_name',with:user.name }
              it { current_path.should == edit_user_path(user)  }
            end
          end
        end
      end
    end

    describe "非当前用户访问修改其他用户" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
      before { sign_in user }

      describe "访问其他用户编辑页面" do
        before { visit edit_user_path(wrong_user) }
        it { should have_selector('h1', 'Welcome to the Sample App') }
      end

      # describe "submitting a PUT request to the Users#update action" do
      #   before { put user_path(wrong_user) }
      #   specify { response.should redirect_to(root_path) }
      # end
    end
  end
end
