class JsonController < ApplicationController
    
    #json/pick?id_arr=1,2,3,4
    def pick
        a = params[:id_arr].split(',')
        b = []
        a.each do |x|
            b << Bongsa.find(x)
        end
        render json: {Bongsa: b}
    end
    
    #http://dosomething-j2ffrey-2.c9.io/json/school
    def school
        #http://dosomething-j2ffrey-2.c9.io/json/school
        render json: {School: School.all}
    end
    
    def region
        #http://dosomething-j2ffrey-2.c9.io/json/region
        render json: {Region: Region.all}
    end
    
    def load
        #http://dosomething-j2ffrey-2.c9.io/json/load?limit=3&offset=5
        render json: {Bongsa: Bongsa.order(id: :desc).limit(params[:limit]).offset(params[:offset])}
    end
    
    def find
        render json: {Bongsa: Bongsa.find(params[:id])}
    end
    
    def a
        render json: {Bongsa: Bongsa.all[1,2]}
    end
    
    def first
        #http://dosomthing-j2ffrey-2.c9.io/json/first?num=2
        render json: {Bongsa: Bongsa.first(params[:num])}
    end
    
    def last
        render json: {Bongsa: Bongsa.last(params[:num])}
    end
    
    def calendar
        #year, month, day
        
        #b = Bongsa.where("date_recruit_start LIKE \"#{a}\" OR date_recruit_end LIKE \"#{a}\"")
        #a = Bongsa.all
        
        #a = Bongsa.where(date_recruit_start.mon: params[:month], date_recruit_start.year: params[:year])
        
        render json: {Bongsa: a}
    end
    
    def calendar_day
        #year, month, day
        a = Date.parse("#{params[:year]}-#{params[:month]}-#{params[:day]}")
        
        #b = Bongsa.where("date_recruit_start LIKE \"#{a}\" OR date_recruit_end LIKE \"#{a}\"")
        
        render json: {Bongsa: Bongsa.where("date_recruit_start LIKE \"#{a}\" OR date_recruit_end LIKE \"#{a}\"")}
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
        
        # abcd
        # name like "ab__"
        #{x} AND #{x'} AND ...
        #"name LIKE \"박현민\""
        #'name LIKE "박현민"'
        #"name LIKE \"박현민\"%"
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
