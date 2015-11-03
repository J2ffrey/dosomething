class CreateAuthorityBundles < ActiveRecord::Migration
  def change
    create_table :authority_bundles do |t|
      t.string :name
      t.string :text
      t.timestamps null: false
    end
  end
end
