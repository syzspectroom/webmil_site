class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :image
      t.string :title
      t.integer :work_id

      t.timestamps
    end
  end
end
