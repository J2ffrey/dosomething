class CreateBongsaDates < ActiveRecord::Migration
  def change
    create_table :bongsa_dates do |t|
      t.integer :bongsa_id  , null: false
      t.string  :date_type  , default: ""
      t.date    :date_start , null: false
      t.date    :date_end   , null: false
      t.timestamps null: false
    end
  end
end
