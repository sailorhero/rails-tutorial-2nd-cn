require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    before {visit '/static_pages/home'}
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
  end

  describe "Help page" do
    before {visit '/static_pages/help'}
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
    before {visit '/static_pages/about'}
    it "should have_content 'About Us'" do
      page.should have_content('About Us')
    end

    it "should have the title 'About Us'" do
      find('title').native.text.should have_content("Ruby on Rails Tutorial Sample App | About Us")
      #page.should have_selector('title',
      #  :text => "Ruby on Rails Tutorial Sample App | About Us")
    end
  end
end
