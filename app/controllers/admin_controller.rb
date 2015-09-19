class AdminController < ApplicationController
    #before_filter :current_user

    def index
        @admin = params[:admin]
        
        @mod = params[:mod]
        @mod = 0 if params[:mod].nil?
        @id = params[:id].to_i
        @id = 0 if params[:id].nil?
        
        #region school btime category
        
        if @admin=="m_region"
            if @mod == "1"
                @b = Region.find(params[:id])
            else
                @b = Region.new
            end
        elsif @admin=="m_school"
            if @mod == "1"
                @b = School.find(params[:id])
            else
                @b = School.new
            end
        elsif @admin=="m_btime"
            if @mod == "1"
                @b = Btime.find(params[:id])
            else
                @b = Btime.new
            end
        elsif @admin=="m_category"
            if @mod == "1"
                @b = Category.find(params[:id])
            else
                @b = Category.new
            end
        elsif @admin=="m_region2"
            if @mod == "1"
                @b = Region2.find(params[:id])
            else
                @b = Region2.new
            end
        elsif @admin=="m_admin"
            if @mod == "1"
                @b = Admin.find(params[:id])
            else
                @b = Admin.new
            end
        elsif @admin=="m_org"
            if @mod == "1"
                @b = Organization.find(params[:id])
            else
                @b = Organization.new
            end
        elsif @admin=="m_bongsa"
            if @mod == "1"
                @b = Bongsa.find(params[:id])
            else
                @b = Bongsa.new
            end
        end
    end

    def m_region
        re = Region.new
        re = Region.find(params[:id]) if params[:mod]=="1"
        re.name = params[:name]
        re.save
        redirect_to '/admin/index?admin=region'
    end
    
    def del_region
        re = Region.find(params[:id])
        re.delete
        redirect_to '/admin/index?admin=region'
    end
    
    def m_region2
        re = Region2.new
        re = Region2.find(params[:id]) if params[:mod]=="1"
        re.name = params[:name]
        re.region_id = params[:region_id]
        re.save
        redirect_to '/admin/index?admin=region2'
    end
    
    def del_region2
        re = Region2.find(params[:id])
        re.delete
        redirect_to '/admin/index?admin=region2'
    end
    
    def m_school
        re = School.new
        re = School.find(params[:id]) if params[:mod]=="1"
        re.name = params[:name]
        re.save
        redirect_to '/admin/index?admin=school'
    end
    
    def del_school
        re = School.find(params[:id])
        re.delete
        redirect_to '/admin/index?admin=school'
    end
    
    def m_category
        re = Category.new
        re = Category.find(params[:id]) if params[:mod]=="1"
        re.name = params[:name]
        re.save
        redirect_to '/admin/index?admin=category'
    end
    
    def del_category
        re = Category.find(params[:id])
        re.delete
        redirect_to '/admin/index?admin=category'
    end
    
    def m_btime
        re = Btime.new
        re = Btime.find(params[:id]) if params[:mod]=="1"
        re.name = params[:name]
        re.min = params[:min]
        re.max = params[:max]
        re.save
        redirect_to '/admin/index?admin=btime'
    end
    
    def del_btime
        re = Btime.find(params[:id])
        re.delete
        redirect_to '/admin/index?admin=btime'
    end
    
    def m_org
        re = Organization.new
        re = Organization.find(params[:id]) if params[:mod]=="1"
        re.name = params[:name]
        re.phone = params[:phone]
        re.save
        redirect_to '/admin/index?admin=org'
    end
    
    def del_org
        re = Organization.find(params[:id])
        re.delete
        redirect_to '/admin/index?admin=org'
    end
    
    def m_admin
        re = Admin.new
        re = Admin.find(params[:id]) if params[:mod]=="1"
        re.name = params[:name]
        re.value = params[:value]
        re.save
        redirect_to '/admin/index?admin=admin'
    end
    
    def del_admin
        re = Admin.find(params[:id])
        re.delete
        redirect_to '/admin/index?admin=admin'
    end
    
    def m_bongsa
        re = Bongsa.new
        re = Bongsa.find(params[:id]) if params[:mod]=="1"
        re.img_poster = params[:img_poster]
        re.img_main = params[:img_main]
        re.name = params[:name]
        re.content = params[:content]
        re.is_edu = true if params[:is_edu] == 1
        re.is_edu = false if params[:is_edu] == 0
        re.status = params[:status]
        re.organization_id = params[:organization_id]
        re.clerk_call = params[:clerk_call]
        re.clerk_name = params[:clerk_name]
        re.is_regular = true if params[:is_regular] == 1
        re.is_regular = false if params[:is_regular] == 0
        re.date_real_end = Date.parse(params[:date_real_end])
        re.date_real_start = Date.parse(params[:date_real_start])
        re.date_recruit_end = Date.parse(params[:date_recruit_end])
        re.date_recruit_start = Date.parse(params[:date_recruit_start])
        re.time_expect_total = params[:time_expect_total]
        re.time_daily_end = params[:time_daily_end]
        re.time_daily_start = params[:time_daily_start]
        re.vltr_req = params[:vltr_req]
        re.vltr_sex = params[:vltr_sex]
        re.vltr_age_id = params[:vltr_age_id]
        re.vltr_num = params[:vltr_num]
        re.region_id = params[:region_id]
        re.school_id = params[:school_id]
        re.btime_id = params[:btime_id]
        re.category_id = params[:category_id]
        re.admin_mod = params[:admin_mod]
        re.admin_add = params[:admin_add]
        re.act_time = params[:act_time]
        re.save
        redirect_to '/admin/index?admin=bongsa'
    end
    
    def del_bongsa
        re = Bongsa.find(params[:id])
        re.delete
        redirect_to '/admin/index?admin=bongsa'
    end
end
