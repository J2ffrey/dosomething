class CreateBuckets < ActiveRecord::Migration
  def change
    create_table :buckets do |t| ##//이 테이블은 Bongsa 테이블과 구성이 같습니다.

      t.string :user_id
      t.string :target_bongsa_id
      
      #사용자가 사후 입력(시간관리에서)
      t.integer	:act_time	        #해당 봉사 후 활동시간 직접등록

      t.timestamps null: false
    end
  end
end
