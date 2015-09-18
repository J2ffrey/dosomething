
Admin.create!([
  {name: "메인페이지에 띄울 봉사 개수", value: "6"}
  ])

Organization.create!([
  {name: "봉사협회", phone:"02)933-1000"}
  ])

Btime.create!([
  {name: "1~3시간", min: 1, max: 3},{name: "4~7시간", min: 4, max: 7},{name: "8시간 이상", min: 8, max: 9999}
  ])

Region.create!([
  {name: "서울"},{name: "경기"},{name: "인천"}
  ])

School.create!([
  {name: "동국대학교1"},{name: "동국대학교2"},{name: "동국대학교3"}
  ])

Category.create!([
  {name: "교육봉사"},{name: "재능봉사"},{name: "노력봉사"},{name: "해외봉사"},{name: "기타봉사"}
  ])
  
VltrAge.create!([
  {name: "18세 이하", min:0, max:18},{name: "19세 이상", min:19, max:99},{name: "제한없음", min:0, max:99}
  ])

Bongsa.create!([
  {img_main: nil, img_poster: nil, name: "서울봉사1", content: "내용입력", is_edu: true, status: 3, organization_id: 1, clerk_name: "현민", clerk_call: "010-1111-2222", is_regular: false, 
  date_recruit_start: Date.new(2015,09,02), date_recruit_end: Date.new(2015,09,02), date_real_start: Date.new(2015,09,02), date_real_end: Date.new(2015,09,02), time_daily_start: 900, time_daily_end: 1600, 
  time_expect_total: 90, vltr_num: 3, vltr_age_id: 1, vltr_sex: 3, vltr_req: "zz", region_id: 1, school_id: 1, btime_id: 1, category_id: 1, 
  admin_add: "jinyee0829@naver.com", admin_mod: "jinyee0829@naver.com", act_time: nil}
])

ViewCount.create!([
  {ip_adress: "219.249.227.19"},
  {ip_adress: "219.249.227.16"},
  {ip_adress: "219.249.227.18"},
  {ip_adress: "219.249.227.15"},
  {ip_adress: "219.249.227.17"},
  {ip_adress: "110.76.142.178"},
  {ip_adress: "219.249.227.17"},
  {ip_adress: "110.76.142.175"},
  {ip_adress: "1.255.24.50"},
  {ip_adress: "1.255.24.50"},
  {ip_adress: "1.255.24.50"},
  {ip_adress: "1.255.24.50"},
  {ip_adress: "1.255.24.50"},
  {ip_adress: "1.255.24.50"},
  {ip_adress: "1.255.24.50"},
  {ip_adress: "1.255.24.50"},
  {ip_adress: "1.255.24.50"},
  {ip_adress: "1.255.24.50"},
  {ip_adress: "1.255.24.49"},
  {ip_adress: "1.255.24.49"},
  {ip_adress: "1.255.24.49"},
  {ip_adress: "66.249.84.216"},
  {ip_adress: "110.76.142.184"},
  {ip_adress: "1.255.24.50"},
  {ip_adress: "1.255.24.50"},
  {ip_adress: "219.249.227.15"},
  {ip_adress: "110.76.142.159"},
  {ip_adress: "1.255.24.50"},
  {ip_adress: "1.255.24.50"},
  {ip_adress: "123.141.172.125"},
  {ip_adress: "1.255.24.49"},
  {ip_adress: "1.255.24.49"},
  {ip_adress: "123.141.172.125"},
  {ip_adress: "123.141.172.125"},
  {ip_adress: "219.249.227.18"},
  {ip_adress: "1.255.24.49"},
  {ip_adress: "1.255.24.49"},
  {ip_adress: "219.249.227.15"},
  {ip_adress: "1.255.24.49"},
  {ip_adress: "1.255.24.49"},
  {ip_adress: "1.255.24.49"},
  {ip_adress: "1.255.24.49"},
  {ip_adress: "1.255.24.49"},
  {ip_adress: "1.255.24.49"},
  {ip_adress: "1.255.24.49"},
  {ip_adress: "1.255.24.49"},
  {ip_adress: "1.255.24.49"},
  {ip_adress: "1.255.24.49"},
  {ip_adress: "1.255.24.49"},
  {ip_adress: "1.255.24.49"},
  {ip_adress: "110.76.142.179"},
  {ip_adress: "219.249.227.11"},
  {ip_adress: "219.249.227.17"},
  {ip_adress: "175.210.250.252"},
  {ip_adress: "175.210.250.252"},
  {ip_adress: "175.210.250.252"},
  {ip_adress: "175.210.250.252"},
  {ip_adress: "118.219.188.170"},
  {ip_adress: "175.210.250.252"},
  {ip_adress: "175.210.250.252"},
  {ip_adress: "175.210.250.252"},
  {ip_adress: "175.210.250.252"},
  {ip_adress: "175.210.250.252"},
  {ip_adress: "175.210.250.252"},
  {ip_adress: "175.210.250.252"},
  {ip_adress: "175.210.250.252"},
  {ip_adress: "66.249.84.161"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "182.231.144.209"},
  {ip_adress: "211.187.45.176"},
  {ip_adress: "210.94.195.131"},
  {ip_adress: "210.94.195.131"},
  {ip_adress: "210.94.195.131"},
  {ip_adress: "210.94.195.131"},
  {ip_adress: "210.94.195.131"},
  {ip_adress: "66.249.88.74"},
  {ip_adress: "211.118.166.131"},
  {ip_adress: "211.118.166.131"},
  {ip_adress: "211.118.166.131"},
  {ip_adress: "211.118.166.131"},
  {ip_adress: "210.94.169.210"},
  {ip_adress: "210.94.169.210"},
  {ip_adress: "210.94.169.210"},
  {ip_adress: "210.94.169.210"},
  {ip_adress: "210.94.169.210"},
  {ip_adress: "210.94.169.210"},
  {ip_adress: "211.118.166.131"},
  {ip_adress: "211.118.166.131"},
  {ip_adress: "210.94.169.210"},
  {ip_adress: "223.33.164.32"},
  {ip_adress: "210.94.169.210"},
  {ip_adress: "211.118.166.131"},
  {ip_adress: "211.118.166.131"},
  {ip_adress: "210.94.169.210"},
  {ip_adress: "211.118.166.131"},
  {ip_adress: "211.118.166.131"},
  {ip_adress: "218.144.63.34"},
  {ip_adress: "218.144.63.34"},
  {ip_adress: "218.144.63.34"},
  {ip_adress: "218.144.63.34"},
  {ip_adress: "218.144.63.34"},
  {ip_adress: "218.144.63.34"},
  {ip_adress: "218.144.63.34"},
  {ip_adress: "218.144.63.34"},
  {ip_adress: "218.144.63.34"},
  {ip_adress: "218.144.63.34"}

])
