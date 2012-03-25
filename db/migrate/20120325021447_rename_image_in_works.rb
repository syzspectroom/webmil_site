class RenameImageInWorks < ActiveRecord::Migration
	def change
		change_table :works do |t|
			t.rename :image, :main_image
		end
	end
end
