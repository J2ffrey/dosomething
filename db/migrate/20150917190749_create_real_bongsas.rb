class CreateRealBongsas < ActiveRecord::Migration
  def change
    create_table :real_bongsas do |t|
      t.integer :user_id    #소속유저
      
      t.string :title       #봉사제목
      t.string :content     #봉사내용
      t.integer :org_name   #기관명
      t.date :date_start    #시작날짜
      t.date :date_end      #종료날짜
      t.string :time_total  #봉사시간
      
      t.timestamps null: false
    end
  end
end
