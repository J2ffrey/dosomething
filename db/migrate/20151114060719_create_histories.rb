class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|

      t.string :user_id
      t.string :name
      t.integer :time
      t.timestamps null: false
    end
  end
end
