require 'spec_helper'

describe WorkController do
  render_views

  describe "GET 'index'" do
    before {  get 'index'}
    it "returns http success" do
      response.should be_success
    end
    it "should have 'Webmil | Works' title" do
      response.should have_selector('title', content: 'Webmil | Works')
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

end
