class CreateAuthorities < ActiveRecord::Migration
  def change
    create_table :authorities do |t|
      t.integer :authority_bundle_id
      t.integer :authority_def_id
      t.timestamps null: false
    end
  end
end
