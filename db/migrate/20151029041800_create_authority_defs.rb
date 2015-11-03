class CreateAuthorityDefs < ActiveRecord::Migration
  def change
    create_table :authority_defs do |t|
      t.string :name
      t.string :value
      t.string :text
      t.timestamps null: false
    end
  end
end
