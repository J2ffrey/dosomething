class CreateVltrAges < ActiveRecord::Migration
  def change
    create_table :vltr_ages do |t|
      t.string :name
      t.integer :min
      t.integer :max
      t.timestamps null: false
    end
  end
end
