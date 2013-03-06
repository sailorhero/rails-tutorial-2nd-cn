require 'spec_helper'

describe "UserPages" do
  subject { page}
  describe "SignUp page" do
    before { visit signup_path}
    it { should have_selector('h1',text:'Sign Up')}
    it { find('title').native.text.should have_content(full_title("Sign Up"))}
  end
end
