class CreateUserTypes < ActiveRecord::Migration
  def change
    create_table :user_types do |t|
      
      t.string :name
      t.string :text
      t.integer :authority_bundle_id
      
      t.timestamps null: false
    end
  end
end
