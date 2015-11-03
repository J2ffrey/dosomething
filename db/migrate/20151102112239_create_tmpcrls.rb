class CreateTmpcrls < ActiveRecord::Migration
  def change
    create_table :tmpcrls do |t|
      
      t.integer :keytemp
      t.string  :nametemp

      t.timestamps null: false
    end
  end
end
