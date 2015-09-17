class CreateRealBongsas < ActiveRecord::Migration
  def change
    create_table :real_bongsas do |t|
      t.string :title
      t.string :content
      t.string :date_start
      t.string :date_end
      t.string :time_total
      t.string :location
      t.string :region
      t.string :img
      t.integer :user_id
      
      t.timestamps null: false
    end
  end
end
