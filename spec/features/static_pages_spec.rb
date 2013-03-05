require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    before {visit root_path}
    it "should have_content 'Sample App'" do
      page.should have_content('Sample App')
    end
    it "should have the right title" do
      #"<title>Ruby on Rails Tutorial Sample App | Home</title>".should have_selector('title',
      #  :text => "Ruby on Rails Tutorial Sample App | Home")
      page.should have_selector(:css ,"title")
      page.should have_selector('h1', :text => 'Sample App')
      find('title').native.text.should have_content("Ruby on Rails Tutorial Sample App | Home")
      #page.should have_selector('title',
      #  :text => "Ruby on Rails Tutorial Sample App | Home")
    end

    it "should have the right links on the layout" do
      visit root_path
      click_link "About"
      page.should have_selector 'h1', text: 'About Us'
      click_link "Help"
      page.should have_selector('h1','Help')
      click_link "Contact"
      page.should have_selector('h1','Contact')
      click_link "Home"
      click_link "Sign up now!"
      page.should # fill in
      click_link "sample app"
      page.should have_selector('h1','Welcome to the Sample App')
    end
  end

  describe "Help page" do
    before {visit help_path}
    it "should have_content 'Help'" do
      page.should have_content('Help')
    end

    it "should have the title 'Help'" do
      page.should have_selector('title',
        :count => 1)
      find('title').native.text.should have_content("Ruby on Rails Tutorial Sample App | Help")
    end
  end

  describe "About page" do
    before {visit about_path}
    it "should have_content 'About Us'" do
      page.should have_content('About Us')
    end

    it "should have the title 'About Us'" do
      find('title').native.text.should have_content("Ruby on Rails Tutorial Sample App | About Us")
      #page.should have_selector('title',
      #  :text => "Ruby on Rails Tutorial Sample App | About Us")
    end
  end

  describe 'Contact page' do
    before { visit contact_path }
    it "should have_content 'Contact' " do
      page.should have_selector('h1','Contract')
    end
    it "should have the title 'Contact'" do
      find('title').native.text.should have_content("Ruby on Rails Tutorial Sample App | Contact")
    end
  end
end
