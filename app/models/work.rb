# == Schema Information
#
# Table name: works
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  url               :string(255)
#  image             :string(255)
#  short_description :text
#  description       :text
#  show_on_mine_page :boolean
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#

class Work < ActiveRecord::Base
	attr_accessible :name, :url, :image, :image_cache, :short_description, :description, :show_on_mine_page

  	mount_uploader :image, MainPageUploader

	validates :name, presence: true, length: { maximum: 50 }
	validates :url, length: { maximum: 50 }
end
