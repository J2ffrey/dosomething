class CreateBtimes < ActiveRecord::Migration
  def change
    create_table :btimes do |t|
      t.string :name  #
      t.integer :min
      t.integer :max
      t.timestamps null: false
    end
  end
end
