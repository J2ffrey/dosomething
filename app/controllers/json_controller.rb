class JsonController < ApplicationController
    #before_action( :only => :kk) {authority_check?([self.name.to_s])}
    
    #임시 필터기능
    def tmp_filter(b)
        b2 = []
        b.each do |x|
            next if x.is_visible==0
            next if x.date_recruit_end.nil?
            next if x.date_recruit_start.nil?
            next if x.date_real_start.nil?
            next if x.date_real_end.nil?
            b2 << x
        end
    end
    
    #http://dosomething-j2ffrey-2.c9.io/json/all_update_at
    def all_update_at
        #모든 봉사의 id와 update_at만 보내기
       render json: {Bongsa: Bongsa.select("id, updated_at") } 
    end
    
    # ,으로구분하여 필요한 데이터만 쿼리(
    # ex> http://dosomething-j2ffrey-2.c9.io/json/custom?query=id,updated_at,name,date_recruit_end
    def custom
        #ary = params[:query].split(',')
        render json: {
            Bongsa: Bongsa.select("#{params[:query]}")
            }
    end
    
    #/json/sign_up/
    #email, password, name, phonenumber
    def sign_up
        u = User.new
        u.email = params[:email]
        u.password = params[:password]
        u.name = params[:name]
        u.phonenumber = params[:phonenumber]
        u.authority_bundle_id = AuthorityBundle.where(name:"Primary User").first.id
        
        unless User.where(email: params[:email]).first.nil?
            status = 400
            id = nil
        end
        
        unless u.save!
            status = 200
            id = u.id
        else
            status = 400
            id = nil
        end
        render json: {
            User: ['status' => status,'id' => id]
            }
    end
    
    #email=char
    #password
    def login
        u = User.where(email: params[:email], password: params[:password]).first
        unless u.nil?
            status = 200
            id = u.id
        else
            status = 400
            id = nil
        end
        render json: {
            User: ['status' => status,'id' => id]
            }
    end
    
    #/my_bucket_del?user_id=int&id=int
    def my_bucket_del
        if params[:id] && params[:user_id]
            b = Bucket.where(user_id: params[:user_id], bongsa_id: params[:id])
            #Bucket.destroy(b)
            #u = User.find(params[:user_id])
            #b = u.buckets.find(params[:id])
            b.first.delete
            
            #Bucket.delete(b)
            #render json: {Bucket: b.first}
            render json: {Bucket: User.find(params[:user_id]).buckets}
        end
    end
    
    #/my_bucket_add?user_id=int&id=int
    def my_bucket_add
        if params[:id] && params[:user_id]
            pa = Bongsa.find(params[:id])
            b = Bucket.new
            b.user_id   = params[:user_id]
            b.bongsa_id = pa.id
            b.save
            #render json: {Bucket: b}
            render json: {Bucket: User.find(params[:user_id]).buckets}
        end
    end
    
    #// id
    def my_bucket_to
        if params[:id] && params[:user_id]
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
            b.user_id = params[:user_id]
            b.save
            Bucket.find(params[:id]).delete
        end
    end
    
    #//login?email=asdf@a.a
    # def login
        #params[:email]
        #params[:pwd]
        #User.where(email: params[:email], pwd: params[:pwd])
        
    #     render json: {User: User.where(email: params[:email])}
    # end
    
    #//찜목록 /json/my_bucket?id=integer
    def my_bucket
        if params[:id]
            render json: {Bucket: User.find(params[:id]).buckets}
        end
    end
    
    #json/pick?id_arr=1,2,3,4
    def pick
        a = params[:id_arr].split(',')
        b = []
        a.each do |x|
            k = Bongsa.where(id: x).first
            next if k.nil?
            b << k
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
    
    def category
        #http://dosomething-j2ffrey-2.c9.io/json/category
        render json: {Category: Category.all}
    end
    
    def btime
        #http://dosomething-j2ffrey-2.c9.io/json/btime
        render json: {Btime: Btime.all}
    end
    
    def load
        #http://dosomething-j2ffrey-2.c9.io/json/load?limit=3&offset=5
        b = Bongsa.order(id: :desc).limit(params[:limit]).offset(params[:offset])
        b = tmp_filter(b)
        render json: {Bongsa: b}
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
    
    # s_word, region, school, btime, category, limit, offset
    def filter
        # render json: {Bongsa: Bongsa.first}
        
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
