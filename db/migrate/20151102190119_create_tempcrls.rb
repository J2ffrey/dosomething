class CreateTempcrls < ActiveRecord::Migration
  def change
    create_table :tempcrls do |t|
      
      t.integer :keytemp
      t.string  :nametemp
      t.integer :is_registerd

      t.timestamps null: false
    end
  end
end
