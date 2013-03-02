require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "should have_content 'Sample App'" do
      visit '/static_pages/home'
      page.should have_content('Sample App')
    end
    it "should have the right title" do
      visit '/static_pages/home'
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
    it "should have_content 'Help'" do
      visit '/static_pages/help'
      page.should have_content('Help')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title',
        :count => 1)
      find('title').native.text.should have_content("Ruby on Rails Tutorial Sample App | Help")
    end
  end

  describe "About page" do

    it "should have_content 'About Us'" do
      visit '/static_pages/about'
      page.should have_content('About Us')
    end

    it "should have the title 'About Us'" do
      visit '/static_pages/about'
      find('title').native.text.should have_content("Ruby on Rails Tutorial Sample App | About Us")
      #page.should have_selector('title',
      #  :text => "Ruby on Rails Tutorial Sample App | About Us")
    end
  end
end
