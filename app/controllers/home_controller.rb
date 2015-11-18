class HomeController < ApplicationController
    #respond_to :html, :js
    before_action(:only => [ :mypage, :private_info ]) {is_signin?}
    #before_action(:only => [ :mypage, :private_info ]) {authority_check?("Bucket_c", "Bucket_d")}
    
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
        
        @s_word = String.new
        @s_word = params[:s_word]
        @bongsa = Bongsa.all
        #방문자
        ip_adress_set = Array.new
        ViewCount.all.each do |x|
            ip_adress_set << x.ip_adress
            @total_view_count = ip_adress_set.count
        end
        
        # render layout: false #J커리 코드 중첩 피하는 코드
    end
    
    def bongsa_information
         @b = Bongsa.find(params[:id])
    end    
    
    def bongsa_info
        @b = Bongsa.find(params[:id])
    end
    
    def error
        render layout: true
    end
    
    def read_me
        
    end
    
    def intro
        render :layout => false
    end
    
    def main_org
       @bongsa = Bongsa.all
    end
  
end
