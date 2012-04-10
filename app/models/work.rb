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

class Work < ActiveRecord::Base
	attr_accessible :name, :url, :main_image, :main_image_cache, :short_description, :description, :show_on_mine_page, :pictures_attributes

	acts_as_url :name, url_attribute: :slug

	has_many :pictures
	accepts_nested_attributes_for :pictures, allow_destroy: true


	scope :for_main_page, where(show_on_mine_page: true).order("created_at asc").limit(3)
	# scope :find_by_slug, (lambda { |slug| where("slug = ?", slug).joins(:pictures).first unless slug.nil? })
	

	def self.find_by_slug slug
		where("slug = ?", slug).joins(:pictures).first unless slug.nil?	
	end

	mount_uploader :main_image, MainPageUploader

	validates :main_image, presence: true
	validates :name, presence: true, length: { maximum: 50, minimum: 3 }
	validates :url, length: { maximum: 50 } , url: true

	def to_param
    slug
  end

end
