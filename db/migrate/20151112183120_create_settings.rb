class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :name
      t.integer :value
      t.string :content
      t.timestamps null: false
    end
  end
end
