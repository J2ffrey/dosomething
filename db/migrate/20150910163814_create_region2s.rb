class CreateRegion2s < ActiveRecord::Migration
  def change
    create_table :region2s do |t|
      t.string :name
      t.integer :region_id
      t.timestamps null: false
    end
  end
end
