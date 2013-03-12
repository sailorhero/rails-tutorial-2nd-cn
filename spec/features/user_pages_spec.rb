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
end
