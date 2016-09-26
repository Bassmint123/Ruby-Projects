# This is one of two db migrate files
class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
			t.string :title
			t.string :image
      t.timestamps
    end
  end
end