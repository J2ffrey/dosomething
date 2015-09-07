class CreateBongsas < ActiveRecord::Migration
  def change
    create_table :bongsas do |t|
      
      #데이터 이미지
      t.string  :bongsa_img       #메인 이미지
      t.string  :foster_img       #포스터 사진
      
      #봉사정보
      t.string	:name		          #봉사명
      t.text		:content	        #상세 내용
      t.integer	:pre_edu	        #사전교육 유/무
      t.integer	:status		        #모집현황(모집중, 모집예정, 모집종료)
      
      #주최 및 담당처 정보
      t.string	:org_name	        #주관단체 혹은 주관처
      t.string  :clerk            #담당자
      t.text    :clerk_call       #담당자 연락처
      
      #기간 및 시간
      t.integer :regular            #정기 혹은 비정기
      t.string	:date_mozip_start	  #모집시작일
      t.string	:date_mozip_end		  #모집마감일
      t.integer :date_real_start    #봉사 실 시작일
      t.integer :date_real_end      #봉사 실 종료일
      t.integer :time_daily_start   #하루 시작 시각
      t.integer :time_daily_end     #하루 종료 시각
      t.integer :time_expect_total  #총 획득 예상시간
      
      #지원 자격 요건
      t.integer :how_many         #모집인원
      t.integer	:vltr_age	        #지원가능 연령(범주로 지정. select value)
      t.integer	:vltr_sex	        #지원가능 성별
      t.text		:vltr_req	        #지원가능 상세조건
      
      #Selector
      t.string	:region		        #지역             <== region
      t.string  :school           #주관 대학        <== school
      t.string  :time             #봉사시간         <== time
      t.integer	:ctgory		        #분야(category)   <== type
      
      #관리자서명(최초에 데이터 입력시 기록.)
      t.string  :input_admin      #최근 수정한 관리자 이메일
      
      #사용자가 사후 입력(시간관리에서)
      t.integer	:act_time	        #해당 봉사 후 활동시간 직접등록

      t.timestamps null: false
    end
  end
end
