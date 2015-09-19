class JsonController < ApplicationController
    
    def pick
        a = params[:id_arr].split(',')
        b = []
        a.each do |x|
            b << Bongsa.find(x)
        end
        render json: {Bongsa: b}
    end
    
    def school
        render json: {School: School.all}
    end
    
    def region
        render json: {Region: Region.all}
    end
    
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
        
        a = Bongsa.where("#{tmp}")
        
        a = a.order(id: :desc)
        
        a = a.limit(params[:limit]).offset(params[:offset]) unless params[:limit].nil? && params[:offset].nil?
        
        b = {
            Bongsa: a
        }
        
        render json: b
    end
    
end
