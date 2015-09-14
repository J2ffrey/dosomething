class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name  #학교이름
      
      t.timestamps null: false
    end
  end
end
