# --encoding: utf-8 --
require 'spec_helper'

describe "UserPages" do
  subject { page}
  describe "SignUp page" do
    before { visit signup_path}
    it { should have_selector('h1',text:'Sign Up')}
    it { find('title').native.text.should have_content(full_title("Sign Up"))}

    let(:submit) {"Create my account"  }

    describe "with invalid information" do
      it "should not create a user" do
        expect{ click_button submit}.not_to change(User,:count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",   with:"Example User"
        fill_in "Email",  with: "user@example.com"
        fill_in "Password",   with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect{click_button submit}.to change(User,:count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user){User.find_by_email('user@example.com')}

        it {should have_selector("h1",text:user.name)}
        it {should have_selector("div.alert-success",text: "欢迎")}

        it {should have_link('Sign out')}
      end
    end
  end

  describe "User show pages" do
    let(:user) { FactoryGirl.create(:user) }
    # Code to make a user variable
    before {visit user_path(user)}

    it { should have_selector('h1',    text: user.name) }
    it { find('title').native.text.should have_content(user.name)}
  end

  describe "编辑页面" do
    let(:user) { FactoryGirl.create(:user)}
    before do
      sign_in user
      visit edit_user_path(user) 
    end

    describe "编辑页面显示" do
      it { should have_selector('h1','编辑个人信息')}
      it { find('title').native.text.should have_content("编辑个人信息")}
      it { should have_link('change',href: 'http://gravatar.com/emails')}
    end

    describe "更新数据无效" do
      before { click_button "保存"}
      it { should have_content('error')}
    end

    describe "更新数据有效" do
      let(:new_name ) { "New User"}
      let(:new_email) { "new@example.com"}

      before do
        fill_in "user_name",   with: new_name
        fill_in "user_email",  with: new_email
        fill_in "user_password",   with: user.password
        fill_in "user_password_confirmation", with: user.password
        click_button "保存"
      end

      it { find('title').native.text.should have_content(new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out', href: signout_path) }
      specify { user.reload.name.should == new_name }
      specify { user.reload.email.should == new_email }
    end
  end
  

  before(:all) { 30.times { FactoryGirl.create(:user) } }
  after(:all) { User.delete_all }
  describe "index" do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) do
      sign_in user
      visit users_path
    end

    it { current_path.should == users_path }
    it { should have_selector('h1',"所有用户")}
    describe "分页测试" do
      it { should have_selector('div.pagination')}
      it "should list each user" do
        User.paginate(page:1).each do |user|
          page.should have_selector('li',text:user.name)
        end
      end
    end

    describe "删除链接" do
      it { should_not have_link('删除')}

      describe "作为管理员" do
        let(:admin){FactoryGirl.create(:admin)}

        before do
          sign_in admin
          visit users_path
        end

        it {should have_link('删除',href:user_path(User.first))}
        it "should be able to delete another user" do
          expect{ first(:link, "删除").click}.to change(User,:count).by(-1)
        end

        it {should_not have_link("删除",href:user_path(admin))}
      end
    end

  end
end
