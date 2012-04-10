require "spec_helper"
require 'carrierwave/test/matchers'

describe MainPageUploader do
	include CarrierWave::Test::Matchers

	before do
		@work = create :work
		# image = work.main_image.new
		MainPageUploader.enable_processing = true
		@uploader = MainPageUploader.new(@work, :main_image)
		
		@uploader.store! @work.main_image

	end

	after do
		MainPageUploader.enable_processing = false
		# @uploader.remove!
	end

    it "main image should be exactly 310 by 200 pixels" do
      @uploader.should have_dimensions(310, 200)
  	end

  	it "should have premission 644" do
  	  @uploader.should have_permissions(0644)
  	end
end