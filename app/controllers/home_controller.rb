class HomeController < ApplicationController
    #respond_to :html, :js
    def temp
        render :layout => false
    end
    
    def filter5
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
        
        @a = Bongsa.where("#{tmp}")
        
        render json: @a
    end
    
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
        @a = Bongsa.where("#{tmp}")
        
        render :layout => false
    end
    
    def calendar2
        
    end
    
    def bongsa_calendar
        
    end
    
    def index
        mark = ViewCount.new
        mark.ip_adress = request.remote_ip
        mark.save
        
        #검색기능 미완성
        @s_word = String.new
        @s_word = params[:s_word]
        @bongsa = Bongsa.all
        #unless @s_word.nil?
        #    @bongsa = Bongsa.new
        #    #<% if x.user_name.include?(@word) %>
        #    Bongsa.all.each do |sb|
        #        @bongsa << sb if sb.name.include?(@s_word)
        #    end
        #end
        #방문자
        ip_adress_set = Array.new
        ViewCount.all.each do |x|
            ip_adress_set << x.ip_adress
            @total_view_count = ip_adress_set.count
        end
        
        # render layout: false #J커리 코드 중첩 피하는 코드
    end
   
    def mypage
        
    end
       
    def calendar
       # render layout: false
    end
    
    def private_info
      @u_password = params[:u_password]
      @con_password = params[:con_password]
  
      
    end
    
    def private_final
      guest = User.find(params[:id])
      @new_password = params[:u_password]
      @con_password = params[:con_password]
      
      if @new_password == @con_password
         guest.password = @con_password
         current_user.password = guest.password
         
         flash[:alert] = '변경이 완료 되었습니다. 다시 로그인 해주세요'
         redirect_to '/home/index'
      else
         flash[:alert] = '비밀번호를 확인 후 다시 입력하세요'
         redirect_to '/home/private_info'
      end
      
      guest.save
    end
    
   # def json_test
        # unless params[:region_select].nil?
        #   @region = params[:region_select]
        # else
        # end
        # unless params[:school_select].nil?
        #   @univ = params[:school_select]
        # else
        # end
        # unless params[:time_select].nil?
        #   @time = params[:time_select]
        # else
        # end
        # unless params[:type_select].nil?
        #   @type = params[:type_select]
        # else
        # end
        
        # @bongsa_list = Bongsa.where(:region => @region, :school => @univ, :t_start => @time, :ctgory => @type).take
        #@bongsa = Bongsa.all
        # @bongsa_list = Bongsa.where(:region => @region).take
        #render json: @bongsa_list
   # end
    

#========================================================================================================================
    #관리자만 이용하는 공간이 아닌 페이지 또는 함수는 이 선을 넘지 않습니다.
    
    


#========================================================================================================================
    #관리자버전용 controller
    def data_input
        @bongsa = Bongsa.all
        
    end
    
    def data_delete
        b = Bongsa.find(params[:id])
        b.delete
        redirect_to :back
    end
    
    def bongsa_save
        b = Bongsa.new
        b.name      = params[:name] # <== value로 입력받아놓는 부분?
        b.bongsa_img = params[:bongbongimg]
        b.region    = params[:region]
        b.time      = params[:time]
        b.ctgory    = params[:ctgory]
        b.content   = params[:content] # <== value로 입력받아놓는 부분?
        
        b.foster_img = params[:fosterimg]
        
        b.date_mozip_start   = params[:date_mozip_start] # <== value로 입력받아놓는 부분?
        b.date_mozip_end     = params[:date_mozip_end]
        b.date_real_start    = params[:date_real_start]
        b.date_real_end      = params[:date_real_end]
        b.time_daily_start   = params[:time_daily_start]
        b.time_daily_end     = params[:time_daily_end]
        b.time_expect_total  = params[:time_expect_total]
        
        b.org_name  = params[:org_name] # <== value로 입력받아놓는 부분?
        b.clerk     = params[:clerk]
        b.school    = params[:school] #주관 대학 또는 인근 대학(메인페이지 Selection 을 위한 메뉴)
        
        b.pre_edu   = params[:pre_edu] #사전교육 유/무
        b.status    = params[:status]
        
        
        
        b.vltr_age  = params[:vltr_age]
        b.vltr_sex  = params[:vltr_sex]
        b.vltr_req  = params[:vltr_req]
        b.act_time  = params[:act_time] # <== 직접 입력을 받아야 하는 사항
        b.how_many  = params[:how_many]
        b.clerk_call = params[:clerk_call]
        
        b.input_admin = params[:input_admin]
        
        b.save
        redirect_to:back
    end

    def data_modify
        
    end

    def data_modify_save
        b = Bongsa.find(params[:id])
        b.name      = params[:name] # <== value로 입력받아놓는 부분?
        b.bongsa_img = params[:bongbongimg]
        b.region    = params[:region]
        b.time      = params[:time]
        b.ctgory    = params[:ctgory]
        b.content   = params[:content] # <== value로 입력받아놓는 부분?
        
        b.foster_img = params[:fosterimg]
        
        b.date_mozip_start   = params[:date_mozip_start] # <== value로 입력받아놓는 부분?
        b.date_mozip_end     = params[:date_mozip_end]
        b.date_real_start    = params[:date_real_start]
        b.date_real_end      = params[:date_real_end]
        b.time_daily_start   = params[:time_daily_start]
        b.time_daily_end     = params[:time_daily_end]
        b.time_expect_total  = params[:time_expect_total]
        
        
        b.org_name  = params[:org_name] # <== value로 입력받아놓는 부분?
        b.clerk     = params[:clerk]
        b.school    = params[:school] #주관 대학 또는 인근 대학(메인페이지 Selection 을 위한 메뉴)
        
        b.pre_edu   = params[:pre_edu] #사전교육 유/무
        b.status    = params[:status]
        
        b.vltr_age  = params[:vltr_age]
        b.vltr_sex  = params[:vltr_sex]
        b.vltr_req  = params[:vltr_req]
        b.act_time  = params[:act_time] # <== 직접 입력을 받아야 하는 사항
        b.how_many  = params[:how_many]
        b.clerk_call = params[:clerk_call]
        
        b.input_admin = params[:input_admin]
        
        b.save
        
        redirect_to '/home/data_input'
    end
    

    def bongsa_information
    
         @b = Bongsa.find(params[:id])
            # b.name      = params[:name] # <== value로 입력받아놓는 부분?
            # b.bongsa_img = params[:bongsa_img]
            # b.region    = params[:region]
            # b.time      = params[:time]
            # b.ctgory    = params[:ctgory]
            # b.content   = params[:content] # <== value로 입력받아놓는 부분?
        
            # b.foster_img = params[:foster_img]
        
            # b.t_mozip_start   = params[:date_mozip_start] # <== value로 입력받아놓는 부분?
            # b.t_mozip_end     = params[:date_mozip_end]
        
            # b.t_real_start = params[:date_real_start]
            # b.t_real_end = params[:date_real_end]
            # b.t_daily_start = params[:time_daily_start]
            # b.t_daily_end = params[:time_daily_end]
            # b.t_expect_total = params[:time_expect_total]
            # b.org_name  = params[:org_name] # <== value로 입력받아놓는 부분?
            # b.clerk     = params[:clerk] # 담당자
            # b.school    = params[:school] #주관 대학 또는 인근 대학(메인페이지 Selection 을 위한 메뉴)
        
            # b.pre_edu   = params[:pre_edu] #사전교육 유/무
            # b.status    = params[:status] # 모집현황
    
            # b.vltr_age  = params[:vltr_age] # 지원가능연령
            # b.vltr_sex  = params[:vltr_sex] # 지원가능 성별
            # b.vltr_req  = params[:vltr_req] # 지원가능 상세조건<== 직접 입력을 받아야 하는 사항
            # b.how_many  = params[:how_many] # 모집인원
            # b.clerk_call = params[:clerk_call] # 담당자 연락처
            # b.act_time = params[:act_time] # 해당 봉사후 활동시간 직접등록
            # b.save
    end
    
    
     def bongsa_info
    
         @b = Bongsa.find(params[:id])
            # b.name      = params[:name] # <== value로 입력받아놓는 부분?
            # b.bongsa_img = params[:bongsa_img]
            # b.region    = params[:region]
            # b.time      = params[:time]
            # b.ctgory    = params[:ctgory]
            # b.content   = params[:content] # <== value로 입력받아놓는 부분?
        
            # b.foster_img = params[:foster_img]
        
            # b.t_mozip_start   = params[:date_mozip_start] # <== value로 입력받아놓는 부분?
            # b.t_mozip_end     = params[:date_mozip_end]
        
            # b.t_real_start = params[:date_real_start]
            # b.t_real_end = params[:date_real_end]
            # b.t_daily_start = params[:time_daily_start]
            # b.t_daily_end = params[:time_daily_end]
            # b.t_expect_total = params[:time_expect_total]
            # b.org_name  = params[:org_name] # <== value로 입력받아놓는 부분?
            # b.clerk     = params[:clerk] # 담당자
            # b.school    = params[:school] #주관 대학 또는 인근 대학(메인페이지 Selection 을 위한 메뉴)
        
            # b.pre_edu   = params[:pre_edu] #사전교육 유/무
            # b.status    = params[:status] # 모집현황
    
            # b.vltr_age  = params[:vltr_age] # 지원가능연령
            # b.vltr_sex  = params[:vltr_sex] # 지원가능 성별
            # b.vltr_req  = params[:vltr_req] # 지원가능 상세조건<== 직접 입력을 받아야 하는 사항
            # b.how_many  = params[:how_many] # 모집인원
            # b.clerk_call = params[:clerk_call] # 담당자 연락처
            # b.act_time = params[:act_time] # 해당 봉사후 활동시간 직접등록
            # b.save
     end
    def read_me
        
    end
    
    def intro
    end
end
