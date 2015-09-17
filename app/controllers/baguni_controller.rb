class BaguniController < ApplicationController

    def timemanage
        
        #---봉사 한개 선택해서 입력창에 띄우기---#
        #@bongsa = Bongsa.all
        #@bongsa2 = Bucket.where(:user_id => current_user.id)
        
        @buckets = current_user.buckets
        
        
        zz = Array.new
            @bongsa2.all.each do |x|
                next if x.target_bongsa_id.nil?
                y = x.target_bongsa_id
                z = Bongsa.find(y)
                zz << z
            end
        @my_bongsa_in_bucket = zz
        
        #----------카테고리별 보기---------------#
        # if params[:category].nil? || params[:category] == "0"
        #     @bongsa2 = @bongsa2
        # else
        #     @bongsa2 = Bongsa.where(:ctgory => params[:category])
        # end
        
        #----------총 봉사시간 구현하기-----------#
        tt=Array.new
        
            @bongsa2.each do |t|
                next if t.act_time==nil
                tt << t.act_time
            end
        
        @tt = tt
        @total_time = @tt.sum
    
    
    end
    
    def a_update #봉사 시간을 입력받아(사실 시간 뿐만아니라 다 고칠 수 있음) 저장하는 곳입니다.
        
        #if #params[:confirm]=="1" #수정 업데이트

        
        if params[:confirm]=="2" #신규 추가 업데이트
            update = Bucket.new
            
            update.act_time     = params[:act_time]
            update.save
            
            redirect_to :back
        else
            update = Bucket.find(params[:id])
            
            update.act_time     = params[:act_time]
            update.save
            
            redirect_to :back
        end
        
    end
    
    def bongsa_delete
        @one_bucket = Bucket.find(params[:id])
        @one_bucket.delete
        
        redirect_to :back
    end
    
    def bucket_save
        pa = Bongsa.find(params[:id])
        
        b = Bucket.new
        b.user_id   = current_user.id
        b.target_bongsa_id = pa.id
        b.save
        flash[:alert] = "'" + pa.name + "' 가 스크랩 되었습니다."
        redirect_to '/'
    end
end