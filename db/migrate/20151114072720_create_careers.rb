class CreateCareers < ActiveRecord::Migration
  def change
    create_table :careers do |t|
      t.string :user_id
      t.string :name
      t.timestamps null: false
    end
  end
end
