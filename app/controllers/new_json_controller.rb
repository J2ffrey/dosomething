class NewJsonController < ApplicationController
  
  class Token
    attr_accessor :status, :msg
    def initialize
      @status = 0
      @msg = ""
    end
  end
  
  # Token.status
  # 400 = Unknown, General Error
  # 401 = User 정보 잘못됨
  # 402 = Bongsa 정보 잘못됨 (없는 봉사를 엑세스)
  # 403 = 로그인 정보(email, pwd) 잘못됨
  # 404 = Bongsa 정보가 없음 (해당 조건의 봉사가 없음)
  # 200 = Good
  # msg = 메시지내용

  # http://dosomething-j2ffrey-2.c9.io/new_json/info
  # input : id=상세정보를 받을 봉사의 id값
  # output : 해당 id값의 봉사 상세정보
  def info
    #id값을 받는다.
    t = Token.new
    b = Bongsa.where(id: params[:id]).first
    if b.nil?
      t.status = 402
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
  
  # http://dosomething-j2ffrey-2.c9.io/new_json/signin
  # input : email=이메일
  #         password=비번
  # output : 성공시 해당 유저의 id
  def signin
    a = User.where(email: params[:email], password: params[:password]).first
    t = Token.new
    if a.nil?
      t.status = 403
      t.msg = "Email이나 비밀번호가 잘못되었습니다."
      render json: {Token: t}
    else
      t.status = 200
      t.msg = "로그인 성공!"
      render json: {
        Token: t,
        User: {id: a.id}
      }
    end
  end
  
  # http://dosomething-j2ffrey-2.c9.io/new_json/bucket
  # input : id=user_id
  #         password=비번
  # output : 성공시 해당 유저의 id
  def bucket
    a = User.where(id: params[:id]).first
    t = Token.new
    arr = Array.new
    
    if a.nil?
      t.status = 401
      t.msg = "잘못된 유저입니다."
      render json: {Token: t}
    else
      a.buckets.each do |y|
        
        b = Hash.new
        x = Bongsa.where(id: y.bongsa_id).first
        if x.nil?
          y.delete
          next
        end
        b['id'] = x.id
        b['name'] = x.name
        b['img_main_url'] = x.img_main.url
        b['date_recruit_start'] = x.date_recruit_start
        b['date_recruit_end'] = x.date_recruit_end
        b['time_expect_total'] = x.time_expect_total
        b['region'] = Region.find(x.region_id).name
        b['organization'] = Organization.find(x.organization_id).name
        
        arr << b
      end
      
      t = Token.new
      if arr.empty?
        t.status = 400
        t.msg = "찜목록 정보가 없습니다."
        render json: {Token: t}
      else
        t.status = 200
        t.msg = "데이터 전송 성공!"
        render json: {
          Token: t,
          Bongsa: arr
        }
      end
    end
  end
  
  # http://dosomething-j2ffrey-2.c9.io/new_json/bucket_save
  # input : u_id=user_id
  #         b_id=봉사_id
  # output : Token
  def bucket_save
    u = User.where(id: params[:u_id]).first
    t = Token.new
    c = 0
    
    if u.nil?
      t.status = 401
      t.msg = "잘못된 유저입니다."
      render json: {Token: t}
    else
      b = Bongsa.where(id: params[:b_id]).first
      if b.nil?
        t.status = 402
        t.msg = "잘못된 봉사입니다."
        render json: {Token: t}
      else
        unless u.buckets.empty?
          u.buckets.each do |x|
            if params[:b_id] == x.bongsa_id
              c = 1
              break
            end
          end
          
          if c==1
            t.status = 403
            t.msg = "이미 추가한 찜봉사입니다!"
            render json: {Token: t}
          end
        end
        if c==0
          bu = Bucket.new
          bu.user_id   = params[:u_id]
          bu.bongsa_id = params[:b_id]
          bu.save
          
          t.status = 200
          t.msg = "찜 추가 성공!"
          render json: {Token: t}
        end
      end
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
      next if b.id!=params[:id].to_i && i == 0 && !params[:id].nil?
      i+=1
      bt = parsing_bongsa(b)
      b2 << bt
      break if i==params[:limit].to_i
    end
    t = Token.new
    if b2.empty?
      t.status = 402
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
      t.status = 402
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
  
  # http://dosomething-j2ffrey-2.c9.io/new_json/calendar
  # input : year=년
  #         month=월
  # output : type의 1은 모집시작, 2는 모집마감
  def calendar
    
    a = Array.new
    b = Hash.new
    today = Time.zone.now.to_date
    
    Bongsa.all.each do |x|
      next if !x.is_visible
      if (x.date_recruit_end.month == params[:month].to_i && x.date_recruit_end.year == params[:year].to_i)
        b = Hash.new
        b['id'] = x.id
        b['day'] = x.date_recruit_end.day
        b['weekday'] = $week_day_index[x.date_recruit_end.cwday]
        b['name'] = x.name
        b['d_day'] = ((today - x.date_recruit_end).to_i) * -1
        b['region'] = Region.find(x.region_id).name
        b['type'] = 2
        b['time_expect_total'] = x.time_expect_total
        
        a << b
      elsif (x.date_recruit_start.month == params[:month].to_i && x.date_recruit_start.year == params[:year].to_i)
        b = Hash.new
        b['id'] = x.id
        b['day'] = x.date_recruit_start.day
        b['weekday'] = $week_day_index[x.date_recruit_start.cwday]
        b['name'] = x.name
        b['d_day'] = ((today - x.date_recruit_start).to_i) * -1
        b['region'] = Region.find(x.region_id).name
        b['type'] = 1
        b['time_expect_total'] = x.time_expect_total
        
        a << b
      end
    end
    
    t = Token.new
    if a.empty?
      t.status = 404
      t.msg = "봉사 정보가 없습니다."
      render json: {Token: t}
    else
      t.status = 200
      t.msg = "데이터 전송 성공!"
      render json: {
        Token: t,
        Bongsa: a
      }
    end
  end
  
  # http://dosomething-j2ffrey-2.c9.io/new_json/home
  # input : id=해당 id부터
  #         limit=불러올 정보개수
  #         r=1 reverse
  # output : 봉사정보 id값부터 limit개
  def home
    a = Array.new
    b = Hash.new
    today = Time.zone.now.to_date
    i = 0
    bongsa = Bongsa.where("id <= #{params[:id].to_i}").reverse if !params[:id].nil?
    bongsa = Bongsa.all.reverse if params[:id].nil?
    bongsa.each do |x|
      break if i==params[:limit].to_i
      next if x.id < params[:id].to_i && !params[:id].nil? && i==0
      next if x.is_visible==0
      b = Hash.new
      b['id'] = x.id
      b['img_main_url'] = x.img_main.url
      b['date_recruit_end'] = x.date_recruit_end
      b['date_recruit_start'] = x.date_recruit_start
      b['time_expect_total'] = x.time_expect_total
      b['name'] = x.name
      b['d_day'] = ((today - x.date_recruit_end).to_i) * -1
      b['region'] = Region.find(x.region_id).name
      
      a << b
      i+=1
    end
    
    t = Token.new
    if a.empty?
      t.status = 404
      t.msg = "봉사 정보가 없습니다."
      render json: {Token: t}
    else
      # a = a.reverse
      t.status = 200
      t.msg = "데이터 전송 성공!"
      render json: {
        Token: t,
        Bongsa: a
      }
    end
  end
  
  # http://dosomething-j2ffrey-2.c9.io/new_json/list
  def list
    t = Token.new
    t.status = 200
    t.msg = "전송 완료."
    
    render json: {
      Token: t,
      Region: Region.all,
      School: School.all,
      Btime: Btime.all,
      Category: Category.all
    }
    
  end
  
  # s_word, region, school, btime, category, limit, offset
  def filter
    first = 0
    tmp = ""
    check = Proc.new {|x|
        if first == 0
            first = 1
        else
            tmp += " AND "
        end
        tmp += "#{x}"
    }
    check.call "name LIKE \"%#{params[:s_word]}%\"" unless params[:s_word].nil?
    check.call "region_id LIKE \"#{params[:region]}\"" unless params[:region].nil?
    check.call "school_id LIKE \"#{params[:school]}\"" unless params[:school].nil?
    check.call "btime_id LIKE \"#{params[:btime]}\"" unless params[:btime].nil?
    check.call "category_id LIKE \"#{params[:category]}\"" unless params[:category].nil?
    
    b = Bongsa.where("#{tmp}")
    b = b.order(id: :desc)
    b = b.limit(params[:limit]).offset(params[:offset]) unless params[:limit].nil? && params[:offset].nil?
    
    t = Token.new
    if b.empty?
      t.status = 404
      t.msg = "봉사 정보가 없습니다."
      render json: {Token: t}
    else
      b2 = Array.new
      b.each do |x|
        b2 << parsing_bongsa(x)
      end
      t.status = 200
      t.msg = "전송 완료."
      render json: {
        Token: t,
        Bongsa: b2
      }
    end
  end
  
  
  
  
  
  
  
  
  def parsing_bongsa(b)
    # dday = (b.date_recruit_end - Date.today).to_i
    b2 = Hash.new
    td = Time.zone.now.to_date
    td = (td - b.date_recruit_end).to_i * -1
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
    b2["dday"] = td
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
