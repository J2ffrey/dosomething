class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name  #지역 이름
      
      t.timestamps null: false
    end
  end
end
