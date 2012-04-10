class AddSlugToWorks < ActiveRecord::Migration
	def change
		change_table :works do |t|
			t.string :slug
			t.index :slug, unique: true 
		end
	end
end
