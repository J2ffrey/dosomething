class CreateTempcrls < ActiveRecord::Migration
  def change
    create_table :tempcrls do |t|
      
      t.integer :keytemp
      t.string  :nametemp
      t.integer :is_registerd
      t.integer :from # 0==vms / 1==1365 / 2 ~ 학교들

      t.timestamps null: false
    end
  end
end
