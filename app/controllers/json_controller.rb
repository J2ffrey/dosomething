class JsonController < ApplicationController
    
    def load
        render json: {Bongsa: Bongsa.order(id: :desc).limit(params[:limit]).offset(params[:offset])}
    end
    
    def find
        render json: {Bongsa: Bongsa.find(params[:id])}
    end
    
    def a
        render json: {Bongsa: Bongsa.all[1,2]}
    end
    
    def first
        render json: {Bongsa: Bongsa.first(params[:num])}
    end
    
    def last
        render json: {Bongsa: Bongsa.last(params[:num])}
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
        
        a = {
            Bongsa: Bongsa.where("#{tmp}")
        }
        
        render json: a
    end
    
end
