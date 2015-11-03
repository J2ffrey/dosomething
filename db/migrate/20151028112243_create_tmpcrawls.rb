class CreateTmpcrawls < ActiveRecord::Migration
  def change
    create_table :tmpcrawls do |t|
      
      t.integer :keytmp
      t.string  :nametmp

      t.timestamps null: false
    end
  end
end