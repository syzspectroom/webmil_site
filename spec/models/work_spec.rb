# == Schema Information
#
# Table name: works
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  url               :string(255)
#  main_image        :string(255)
#  short_description :text
#  description       :text
#  show_on_mine_page :boolean
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#  slug              :string(255)
#

require 'spec_helper'

describe Work do
  
  it "should not be valid without name" do
  	build(:work, name: "").should_not be_valid
  end

  it "should not be valid with name length over 50 letters" do
  	build(:work, name: rand(36**60).to_s(36)).should_not be_valid
  end

  it "should not be valid with name length less than 3 letters" do
  	build(:work, name: rand(36**2).to_s(36)).should_not be_valid
  end

  it "should not be valid without url" do
  	build(:work, url: '').should_not be_valid
  end

  it "should not be valid with wrong url" do
  	build(:work, url: 'wrong').should_not be_valid
  end

  it "should not be valid without image" do
  	build(:work, main_image: '').should_not be_valid
  end

  it "should be valid with url, name and main_image" do
  	build(:work).should be_valid
  end

  describe "with pictures" do
    before(:each) do
      @work  = create(:work)
    end

    it "should have a pictures method" do
      @work.should respond_to(:pictures)
    end

    it "should not be valid with empty picture" do
      @work.pictures.build.should_not be_valid
    end
  end

  it "should have the scope for_main_page" do
    Work.should respond_to(:for_main_page)
  end

  describe "on main page" do
    it "should include with show_on_mine_page flag" do
      work_for_main_page = create(:work, show_on_mine_page: true)
      Work.for_main_page.should include(work_for_main_page) 
    end

    it "should not include work without show_on_mine_page flag" do
      work_not_for_main_page = create(:work)
      Work.for_main_page.should_not include(work_not_for_main_page) 
    end

    it "should include only 3 works" do
      4.times do |n|
        create(:work, name:"work#{n}", show_on_mine_page: true)
      end

      Work.for_main_page.count.should equal 3
    end

    it "should include only latest works" do
      works = Hash.new
      4.times do |n|
        works[n.to_s] = create(:work, name:"work#{n}", show_on_mine_page: true)
      end

      Work.for_main_page.should_not include(works.first)
    end
  end

  describe "slug" do
    it "should not be nil" do
      work = create(:work)
      work.slug.should_not be_nil
    end

    it "should not be empty" do
      work = create(:work)
      work.slug.should_not be_empty
    end

    it "should be unique" do
      work1 = create(:work, name: 'test name')
      work2 = create(:work, name: 'test name')

      work1.slug.should_not be_equal work2.slug
    end
  end

  it "shoud have scope find_by_slug" do
    Work.should respond_to(:find_by_slug)
  end

  it "find by slug" do
    work = create(:work, name: 'new test name')
    Work.find_by_slug(work.name.to_url).should include work
  end  
end
