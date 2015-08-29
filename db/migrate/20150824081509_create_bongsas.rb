class CreateBongsas < ActiveRecord::Migration
  def change
    create_table :bongsas do |t|

      t.string	:name		    #봉사명=
      t.string  :bongsa_img #메인 이미지
      t.string	:region		  #지역=
      t.integer	:ctgory		  #분야(category)=
      t.text		:content	  #상세 내용=
      
      t.string  :foster_img   #포스터 사진
      
      t.string	:t_start	#시작일=
      t.string	:t_end		#종료일=
      
      t.string	:org_name	#주관=
      t.string  :clerk    #담당자
      
      t.integer	:pre_edu	#사전교육 유/무
      t.integer	:status		#모집현황(모집중, 모집예정, 모집종료)					
      
      t.integer	:vltr_age	#지원가능 연령(범주로 지정. select value)
      t.integer	:vltr_sex	#지원가능 성별
      t.text		:vltr_req	#지원가능 상세조건
      
      #school
      #time
      
      t.integer	:act_time	#해당 봉사 후 활동시간 직접등록=

      t.timestamps null: false
    end
  end
end
