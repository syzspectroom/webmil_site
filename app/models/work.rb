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
#

class Work < ActiveRecord::Base
	attr_accessible :name, :url, :main_image, :main_image_cache, :short_description, :description, :show_on_mine_page, :pictures_attributes

	has_many :pictures
	accepts_nested_attributes_for :pictures, allow_destroy: true


  	mount_uploader :main_image, MainPageUploader

	validates :name, presence: true, length: { maximum: 50 }
	validates :url, length: { maximum: 50 }
end
