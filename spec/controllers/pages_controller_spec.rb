require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do
    
    before {get :home}

    it "returns http success" do
      response.should be_success
    end
    it "should have 'Webmil | Home' title" do
      response.should have_selector('title', content: 'Webmil | Home')
    end
    it "should not have 'Latest works' section without db records" do
      response.should_not have_selector('h2', content: 'Latest Works')
    end
    it "should have 'Latest works' section when db record exists" do
      create(:work, show_on_mine_page: true)
      get :home
      response.should have_selector('h2', content: 'Latest Works')
    end

  end


  describe "GET 'works'" do

    before {get 'works'}

    it "returns http success" do
      response.should be_success
    end

    it "should have 'Webmil | Works' title" do
      response.should have_selector('title', content: 'Webmil | Works')
    end
  end

  describe "GET 'team'" do
    
    before {get 'team'}

    it "returns http success" do
      response.should be_success
    end

    it "should have 'Webmil | Team' title" do
      response.should have_selector('title', content: 'Webmil | Team')
    end
  end

  describe "GET 'contacts'" do
    
    before {get 'contacts'}
    
    it "returns http success" do
      response.should be_success
    end
    it "should have 'Webmil | Contacts' title" do
      response.should have_selector('title', content: 'Webmil | Contacts')
    end
  end

end
