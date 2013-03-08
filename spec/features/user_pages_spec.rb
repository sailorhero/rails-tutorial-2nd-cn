require 'spec_helper'

describe "UserPages" do
  subject { page}
  describe "SignUp page" do
    before { visit signup_path}
    it { should have_selector('h1',text:'Sign Up')}
    it { find('title').native.text.should have_content(full_title("Sign Up"))}
  end

  describe "User show pages" do
    let(:user) { FactoryGirl.create(:user) }
    # Code to make a user variable
    before {visit user_path(user)}

    it { should have_selector('h1',    text: user.name) }
    it { find('title').native.text.should have_content(user.name)}
  end
end
