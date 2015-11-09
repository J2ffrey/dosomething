class BaguniController < ApplicationController
    before_action {is_signin?}
    
    def timemanage
        
        #---봉사 한개 선택해서 입력창에 띄우기---#
        #@bongsa = Bongsa.all
        #@bongsa2 = Bucket.where(:user_id => current_user.id)
        
        @buckets = current_user.buckets
        @real_bongsas = current_user.real_bongsas
        
        #---총 봉사시간 구현하기---#(용현)
        sum = 0
        @real_bongsas.each do |i|
            x = i.time_total.to_i
            sum = sum + x
        end
        @sum_times = sum
    end
    
    def register
        #a = current_user.buckets
        #a = Bongsa.find(Bucket.where(id: params[:id], user_id: current_user.id).target_bongsa_id)
        a = Bongsa.find(Bucket.find(params[:id]).target_bongsa_id)
        b = RealBongsa.new
        b.title = a.name
        b.content = a.content.first(30)
        b.date_start = a.date_real_start
        b.date_end = a.date_real_end
        b.time_total = a.time_expect_total
        b.location = Region.find(a.region_id).name
        b.region = Organization.find(a.organization_id).name
        b.img = a.img_main
        b.user_id = current_user.id
        b.save
        Bucket.find(params[:id]).delete
        redirect_to :back
    end
    
    def modify
        f = RealBongsa.find(params[:id])
        f.time_total = params[:time_total]
        f.save
        redirect_to '/baguni/timemanage'
    end
    
    def delete2
        a = current_user.real_bongsas.find(params[:id])
        a.delete
        redirect_to :back
    end
    
    def delete
        a = current_user.buckets.find(params[:id])
        a.delete
        redirect_to :back
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
        redirect_to :back
    end
end