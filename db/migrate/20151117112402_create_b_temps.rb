class CreateBTemps < ActiveRecord::Migration
  def change
    create_table :b_temps do |t|
      
      #봉사정보
      t.string	:name		          , default: "봉사명", null: false     #봉사명
      t.text		:content	                          #상세 내용
      t.string  :summary          , default: ""     #간략 설명
      t.text    :content_etc                        #기타 설명
      t.text    :incentive                          #활동 혜택
      t.string	:status		        , default: ""     #모집현황(모집중, 모집예정, 모집종료)
      t.boolean :is_approval      , default: true   #인증서 발급여부
      t.text    :address                            #주소(디테일한 지역주소)
      t.boolean	:is_edu 	        , default: false  #사전교육 유/무
      t.boolean :is_visible       , default: false  #봉사활동 보이기 여부
      t.integer :time_expect_total, default: 0      #총 획득 예상시간
      t.integer :view_count       , default: 0      #조회수
      t.string  :link             , default: ""     #신청링크
      
      #관련 링크 달기 bongsa_links
      #기타 기간 달기 bongsa_dates
      #봉사시간 월,화,수,목,금,토,일 구분짓기 
      # bongsa_times
      
      #데이터 이미지
      t.string  :img_main         , default: ""     #메인 이미지
      t.string  :img_poster       , default: ""     #포스터 사진
      
      #주최 및 담당처 정보
      t.integer :organization_id  , default: 1, null: false     #주관단체//
      t.string  :clerk_name       , default: ""     #담당자
      t.string  :clerk_call       , default: ""     #담당자 연락처
      t.string  :clerk_email      , default: ""     #담당자 이메일
      t.string  :clerk_link       , default: ""     #담당자 링크
      
      #기간 및 시간
      t.boolean :is_recruit_always , default: false #상시모집시 1(true)
      t.boolean :is_regular        , default: false #정기 혹은 비정기
      t.date	:date_recruit_start	 , default: nil   #모집시작일
      t.date	:date_recruit_end		 , default: nil   #모집마감일
      t.date :date_real_start      , default: nil   #봉사 실 시작일
      t.date :date_real_end        , default: nil   #봉사 실 종료일
      
      #지원 자격 요건 및 신청
      t.integer :vltr_num         , default: 1      #모집인원
      t.integer :vltr_num2        , default: 0      #신청인원
      t.string	:vltr_req 	      , default: ""     #지원가능 상세조건
      
      #분류 Selector _id
      t.integer	:region_id		    , default: 1, null: false     #지역           <== region
      t.integer :school_id        , default: 1, null: false     #주관 대학      <== school
      t.integer :btime_id         , default: 1, null: false     #봉사시간       <== time
      t.integer	:category_id		  , default: 1, null: false     #분야(category) <== category
      
      #관리자서명(최초에 데이터 입력시 기록.)-> 수정시에도.
      t.string  :admin_add        , default: ""     #최초 등록한 관리자 이메일
      t.string  :admin_mod        , default: ""     #최근 수정한 관리자 이메일

      t.timestamps null: false
    end
  end
end
