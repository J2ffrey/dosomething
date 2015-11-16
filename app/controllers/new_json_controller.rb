class NewJsonController < ApplicationController
  
  class Token
    attr_accessor :status, :msg
    def initialize
      @status = 0
      @msg = ""
    end
  end
  
  #token.status
  # 400 = Error
  # 200 = Good
  # msg = 메시지내용
  
  #상세정보페이지에서 필요한 정보를 모두 보내준다.
  #필요한 정보. id
  # 봉사제목
  # 남은기간
  # 모집기간
  # 활동기간
  # 기타기간
  # 봉사총시간
  # 활동지역
  # 인증서발급유무
  # 이미지 2개
  # 신청하기링크
  # 모집대상
  # 일별 봉사시간
  # 담당자정보
  # 활동혜택
  # 관련링크
  # 기타사항
  # http://dosomething-j2ffrey-2.c9.io/new_json/info
  # input : id=상세정보를 받을 봉사의 id값
  # output : 해당 id값의 봉사 상세정보
  def info
    #id값을 받는다.
    t = Token.new
    b = Bongsa.where(id: params[:id]).first
    if b.nil?
      t.status = 400
      t.msg = "해당 id값의 봉사정보가 존재하지 않습니다."
      render json: {Token: t}
    else
      t.status = 200
      t.msg = "데이터 전송 성공!"
      b2 = parsing_bongsa(b)
      render json: {
        Token: t,
        Bongsa: b2
      }
    end
  end
  
  # http://dosomething-j2ffrey-2.c9.io/new_json/load
  # input : id=시작id 없을경우 처음부터
  #         limit=몇개 가져올 것인지
  # output : id값 부터 최신순으로 limit개의 봉사정보
  def load
    a = Bongsa.order(id: :desc)
    i = 0
    b2 = []
    a.each do |b|
      next if b.id!=params[:id] && i == 0 && params[:id].present?
      i+=1
      bt = parsing_bongsa(b)
      b2 << bt
      break if i==params[:limit]
    end
    t = Token.new
    if b2.empty?
      t.status = 400
      t.msg = "봉사 정보가 없습니다."
      render json: {Token: t}
    else
      t.status = 200
      t.msg = "데이터 전송 성공!"
      render json: {
        Token: t,
        Bongsa: b2
      }
    end
  end
  
  # http://dosomething-j2ffrey-2.c9.io/new_json/all
  # input : none;
  # output : Bongsa.all
  def all
    t = Token.new
    if Bongsa.all.empty?
      t.status = 400
      t.msg = "봉사정보가 존재하지 않습니다."
      render json: {Token: t}
    else
      t.status = 200
      t.msg = "데이터 전송 성공!"
      b3 = []
      Bongsa.all.each do |b|
        b2 = parsing_bongsa(b)
        b3 << b2
      end
      render json: {
        Token: t,
        Bongsa: b3
      }
    end
  end
  
  def parsing_bongsa(b)
    # dday = (b.date_recruit_end - Date.today).to_i
    b2 = Hash.new
    b2['id'] = b.id
    b2['name'] = b.name
    # b2['date_recruit_string'] = b.date_recruit_start.to_s + ' ~ ' + b.date_recruit_end.to_s + '(' + dday.to_s + ')'
    b2['date_recruit_start'] = b.date_recruit_start
    b2['date_recruit_end'] = b.date_recruit_end
    b2['date_real_start'] = b.date_real_start
    b2['date_real_end'] = b.date_real_end
    b2['time_expect_total'] = b.time_expect_total
    b2['address'] = b.address
    b2['is_approval'] = b.is_approval
    b2['img_main'] = b.img_main.url
    b2['img_poster'] = b.img_poster.url
    b2['link'] = b.link
    b2['vltr_req'] = b.vltr_req
    b2['vltr_num'] = b.vltr_num
    b2['vltr_num2'] = b.vltr_num2
    b2['clerk_name'] = b.clerk_name
    b2['clerk_call'] = b.clerk_call
    b2['clerk_email'] = b.clerk_email
    b2['clerk_link'] = b.clerk_link
    b2['status'] = b.status
    i=0
    b.bongsa_times.each do |x|
      i+=1
      b2["bongsa_times#{i}_weekday"] = x.time_type
      b2["bongsa_times#{i}_start"] = x.time_start
      b2["bongsa_times#{i}_end"] = x.time_end
    end
    b2['bongsa_times'] = i
    b2["incentive"] = b.incentive
    b2["content_etc"] = b.content_etc
    b2["organization"] = Organization.find(b.organization_id).name
    b2["btime"] = Btime.find(b.btime_id).name
    b2["category"] = Category.find(b.category_id).name
    b2["region"] = Region.find(b.region_id).name
    b2["school"] = School.find(b.school_id).name
    i=0
    b.bongsa_links.each do |x|
      i+=1
      b2["bongsa_links#{i}_name"] = x.name
      b2["bongsa_links#{i}_url"] = x.url
    end
    b2['bongsa_links'] = i
    i=0
    b.bongsa_dates.each do |x|
      i+=1
      b2["bongsa_dates#{i}_type"] = x.date_type
      b2["bongsa_dates#{i}_start"] = x.date_start
      b2["bongsa_dates#{i}_end"] = x.date_end
    end
    b2['bongsa_dates'] = i
    # b2[""] =
    b2
  end
  
  
end
