class DosomethingController < ApplicationController
    
    def index
        mark = ViewCount.new
        mark.ip_adress = request.remote_ip
        mark.save
        
        @bongsa = Bongsa.all
        
        ip_adress_set = Array.new
        ViewCount.all.each do |x|
        ip_adress_set << x.ip_adress
        @total_view_count = ip_adress_set.count
        end                                                 
    end
   
    def mypage
    end
       
    def calender
       render layout: false  
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
         redirect_to '/', :flash => { :success => '변경된 비밀번호로 다시 로그인 하세요'}
         
      else
        redirect_to "/dosomething/private_info", :notice => '비밀번호를 확인하세요'
      end
      
      guest.save
    end
    
    def json_test
        @bongsa = Bongsa.all
        render json: @bongsa
        
        # @univ = params[:univ]
        
        # @volunteer_list = Volunteer.where(univ=@univ, type='SELF', time=time)
        # render json: @volunteer_list
        
        
    end
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
        b.ctgory    = params[:ctgory]
        b.content   = params[:content] # <== value로 입력받아놓는 부분?
        
        b.foster_img = params[:fosterimg]
        
        b.t_start   = params[:t_start] # <== value로 입력받아놓는 부분?
        b.t_end     = params[:t_end]
        
        b.org_name  = params[:org_name] # <== value로 입력받아놓는 부분?
        b.clerk     = params[:clerk]
        
        b.pre_edu   = params[:pre_edu] #사전교육 유/무
        b.status    = params[:status]
        
        
        
        b.vltr_age  = params[:vltr_age]
        b.vltr_sex  = params[:vltr_sex]
        b.vltr_req  = params[:vltr_req]
        b.act_time  = params[:act_time] # <== 직접 입력을 받아야 하는 사항
        
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
        b.ctgory    = params[:ctgory]
        b.content   = params[:content] # <== value로 입력받아놓는 부분?
        
        b.foster_img = params[:fosterimg]
        
        b.t_start   = params[:t_start] # <== value로 입력받아놓는 부분?
        b.t_end     = params[:t_end]
        
        b.org_name  = params[:org_name] # <== value로 입력받아놓는 부분?
        b.clerk     = params[:clerk]
        
        b.pre_edu   = params[:pre_edu] #사전교육 유/무
        b.status    = params[:status]
        
        b.vltr_age  = params[:vltr_age]
        b.vltr_sex  = params[:vltr_sex]
        b.vltr_req  = params[:vltr_req]
        b.act_time  = params[:act_time] # <== 직접 입력을 받아야 하는 사항
        
        b.save
        redirect_to '/dosomething/data_input'
    end
end
