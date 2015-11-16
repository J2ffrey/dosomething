class CreateBongsaTimes < ActiveRecord::Migration
  def change
    create_table :bongsa_times do |t|
      t.integer :bongsa_id  , null: false
      t.string :time_type  , default: "매일"
      t.string  :time_start , null: false
      t.string  :time_end   , null: false
      t.timestamps null: false
    end
  end
end
