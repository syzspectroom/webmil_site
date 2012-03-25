# == Schema Information
#
# Table name: pictures
#
#  id         :integer         not null, primary key
#  image      :string(255)
#  title      :string(255)
#  work_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Picture < ActiveRecord::Base
	belongs_to :work
	attr_accessible :image, :title

	mount_uploader :image, PortfolioItemUploader

	validates :image, :presence => true
	validates :title, :presence => true
end

