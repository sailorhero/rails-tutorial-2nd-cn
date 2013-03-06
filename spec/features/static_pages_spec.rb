require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    before {visit root_path}
    subject {page}
    it {should have_content('Sample App')}
    it {should have_selector('h1', :text => 'Sample App')}
    it {should have_selector(:css ,"title")}
    it {find('title').native.text.should have_content("Ruby on Rails Tutorial Sample App | Home") }
    it "should have the right links on the layout" do
      visit root_path
      click_link "About"
      should have_selector 'h1', text: 'About Us'
      click_link "Help"
      should have_selector('h1','Help')
      click_link "Contact"
      should have_selector('h1','Contact')
      click_link "Home"
      click_link "Sign up now!"
      should # fill in
      click_link "sample app"
      should have_selector('h1','Welcome to the Sample App')
    end
  end

  describe "Help page" do
    before {visit help_path}
    subject{page}
    it { should have_content('Help')}
    it { should have_selector('title',:count => 1) }
    it { find('title').native.text.should have_content("Ruby on Rails Tutorial Sample App | Help")}
    
  end

  describe "About page" do
    before {visit about_path}
    subject{page}
    it {should have_content('About Us')}
    it {find('title').native.text.should have_content("Ruby on Rails Tutorial Sample App | About Us")}
  end

  describe 'Contact page' do
    before { visit contact_path }
    subject { page}
    it { should have_selector('h1','Contract')}
    it { find('title').native.text.should have_content("Ruby on Rails Tutorial Sample App | Contact")}
  end
end
