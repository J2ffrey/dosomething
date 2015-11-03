class CreateTempcrawls < ActiveRecord::Migration
  def change
    create_table :tempcrawls do |t|
      
      t.integer :keytemp
      t.string  :nametemp

      t.timestamps null: false
    end
  end
end
