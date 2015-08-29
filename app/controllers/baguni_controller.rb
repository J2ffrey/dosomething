class BaguniController < ApplicationController

    def timemanage
    
    #---봉사 한개 선택해서 입력창에 띄우기---#
    @bongsa = Bongsa.all
    
    #----------카테고리별 보기---------------#
    if params[:category].nil? || params[:category] == "0"
        @bongsa2 = Bongsa.all
    else
        @bongsa2 = Bongsa.where(:ctgory => params[:category])
    end
    
    #----------총 봉사시간 구현하기-----------#
    tt=Array.new
    
        Bongsa.all.each do |t|
            next if t.act_time==nil
            tt << t.act_time
        end
    
    @tt = tt
    @total_time = @tt.sum
    
    
    end
    
    def a_update #봉사 시간을 입력받아(사실 시간 뿐만아니라 다 고칠 수 있음) 저장하는 곳입니다.
        
        #if #params[:confirm]=="1" #수정 업데이트

        
        if params[:confirm]=="2" #신규 추가 업데이트
            update = Bongsa.new
            update.ctgory   = params[:ctgory]
            update.name     = params[:name]
            update.org      = params[:org]
            update.term     = params[:term]
            update.content  = params[:content]
            update.act_time = params[:act_time]
            update.save
            
            redirect_to :back
        else
            update = Bongsa.find(params[:id])
            update.ctgory   = params[:ctgory]
            update.name     = params[:name]
            update.org      = params[:org]
            update.term     = params[:term]
            update.content  = params[:content]
            update.act_time = params[:act_time]
            update.save
            
            redirect_to :back
        end
    end
    
    def bongsa_delete
        @one_prj = Bongsa.find(params[:id])
        @one_prj.delete
        
        redirect_to :back
    end
end