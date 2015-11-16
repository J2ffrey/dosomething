class CreateBongsaLinks < ActiveRecord::Migration
  def change
    create_table :bongsa_links do |t|
      t.integer :bongsa_id    , null: false
      t.string  :name         , null: false
      t.string  :url          , null: false
      t.timestamps null: false
    end
  end
end