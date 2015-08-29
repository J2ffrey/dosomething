# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
b = Bongsa.new
    
    b.name = "유니세프 대학생 자원봉사단 U Champ 모집" # <== value로 입력받아놓는 부분?
    b.region = "서울 강남역"
    b.ctgory = 1
    b.content = "유니세프 산하 대학생 자원봉사단에서 맴버를 모집합니다" # <== value로 입력받아놓는 부분?
    
    b.t_start = "8월 3일".to_s # <== value로 입력받아놓는 부분?
    b.t_end = "8월 10일".to_s
    
    b.org_name = "유니세프" # <== value로 입력받아놓는 부분?
    b.clerk = "이창우"
    
    b.pre_edu = "0" #사전교육 유/무
    b.status = "1"
    
    b.vltr_age = "1"
    b.vltr_sex = "0"
    b.vltr_req = "#해당 봉사 후 활동시간 직접등록"
    b.act_time = 0 # <== 직접 입력을 받아야 하는 사항
    
    b.save
    
b = Bongsa.new
    
    b.name = "실종 유괴예방인형극 자원봉사자 모집" # <== value로 입력받아놓는 부분?
    b.region = "서울 광화문"
    b.ctgory = 2
    b.content = "실종, 유괴로 부터 우리 아이들을 지켜내는 일입니다^^" # <== value로 입력받아놓는 부분?
    
    b.t_start = "8월 3일".to_s # <== value로 입력받아놓는 부분?
    b.t_end = "8월 10일".to_s
    
    b.org_name = "초록우산어린이재단" # <== value로 입력받아놓는 부분?
    b.clerk = "류진이"
    
    b.pre_edu = "0"
    b.status = "2"
    
    b.vltr_age = "2"
    b.vltr_sex = "0"
    b.vltr_req = "#해당 봉사 후 활동시간 직접등록"
    b.act_time = 0 # <== 직접 입력을 받아야 하는 사항
    
    b.save
    
b = Bongsa.new
    
    b.name = "BC카드 빨간밥차 봉사단 3기 모집" # <== value로 입력받아놓는 부분?
    b.region = "서울시 중구"
    b.ctgory = 3
    b.content = "무료급식을 위한 전국 규모의 봉사단입니다." # <== value로 입력받아놓는 부분?
    
    b.t_start = "8월 7일".to_s # <== value로 입력받아놓는 부분?
    b.t_end = "8월 10일".to_s
    
    b.org_name = "동국대학교" # <== value로 입력받아놓는 부분?
    b.clerk = "김용현"
    
    b.pre_edu = "1"
    b.status = "3"
    
    b.vltr_age = "3"
    b.vltr_sex = "1"
    b.vltr_req = "#해당 봉사 후 활동시간 직접등록"
    b.act_time = 0 # <== 직접 입력을 받아야 하는 사항
    
    b.save
    
b = Bongsa.new
    
    b.name = "굿네이버스 빈곤가정지원 후원물품 세팅봉사" # <== value로 입력받아놓는 부분?
    b.region = "서울 영등포"
    b.ctgory = 1
    b.content = "빈곤가정아동 후원물품 세팅봉사" # <== value로 입력받아놓는 부분?
    
    b.t_start = "8월 3일".to_s # <== value로 입력받아놓는 부분?
    b.t_end = "8월 3일".to_s
    
    b.org_name = "굿네이버스" # <== value로 입력받아놓는 부분?
    b.clerk = "황유정"
    
    b.pre_edu = "0"
    b.status = "1"
    
    b.vltr_age = "1"
    b.vltr_sex = "2"
    b.vltr_req = "#해당 봉사 후 활동시간 직접등록"
    b.act_time = 0 # <== 직접 입력을 받아야 하는 사항
    
    b.save
    
b = Bongsa.new
    
    b.name = "국제 NGO 기아대책 글로벌시민교육봉사단 모집" # <== value로 입력받아놓는 부분?
    b.region = "서울 월드컵공원"
    b.ctgory = 2
    b.content = "초등학교 대상 글로벌 시민교육을 함께할 봉사단을 찾습니다." # <== value로 입력받아놓는 부분?
    
    b.t_start = "8월 9일".to_s # <== value로 입력받아놓는 부분?
    b.t_end = "8월 10일".to_s
    
    b.org_name = "기아 대책 경인본부" # <== value로 입력받아놓는 부분?
    b.clerk = "이재철"
    
    b.pre_edu = "1"
    b.status = "2"
    
    b.vltr_age = "2"
    b.vltr_sex = "2"
    b.vltr_req = "#해당 봉사 후 활동시간 직접등록"
    b.act_time = 0 # <== 직접 입력을 받아야 하는 사항
    
    b.save