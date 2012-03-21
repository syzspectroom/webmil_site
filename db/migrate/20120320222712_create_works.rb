class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :name
      t.string :url
      t.string :image
      t.text :short_description
      t.text :description
      t.boolean :show_on_mine_page

      t.timestamps
    end
  end
end
