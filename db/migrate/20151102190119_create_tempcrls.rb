class CreateTempcrls < ActiveRecord::Migration
  def change
    create_table :tempcrls do |t|
      
      t.integer :keytemp
      t.string  :nametemp
      t.integer :is_registerd
      t.integer :from #0==vms / 1==학교들 / 2==기타

      t.timestamps null: false
    end
  end
end
