class AdminController < ApplicationController
    before_action {is_signin?}
    before_action {authority_check?("cAdmin")}
    
    #instance_variable_set("@" + varname, value)
    def clear_bongsa
        Bongsa.all.each do |x|
            x.delete if x.name == "봉사명"
        end
        redirect_to '/admin/'
    end
    
    def test
        @test = "테
        스트
        입니다.
        ㅋ"
    end
    
    def authority_seed
        model = ['User', 'Bongsa', 'Bucket', 'Region', 'School', 'Btime', 'Category', 'Region2', 'Admin', 'Organiztion', 'VltrAge', 'RealBongsa', 'BongTmp', 'Authority', 'AuthorityBundle', 'AuthorityDef']
        method = ['c', 'u', 'r', 'd']
        
        controller = ['Admin', 'Baguni', 'Calendar', 'Home', 'Json', 'User']
        
        method_e = ['Create', 'Update', 'Read', 'Delete']
        method_k = ['생성', '수정', '읽기', '삭제']
        
        controller.each do |x|
            check = AuthorityDef.where(value: 'c' + x).first
            next unless check.nil?
            tmp = AuthorityDef.new
            tmp.name = x + ' Controller'
            tmp.value = 'c' + x
            tmp.text = x + ' 컨트롤러에 대한 접근 권한'
            tmp.save
        end
        
        model.each do |x|
            i=0
            method.each do |y|
                check = AuthorityDef.where(value: x + '_' + y).first
                next unless check.nil?
                tmp = AuthorityDef.new
                tmp.name = x + '_' + method_e[i]
                tmp.value = x + '_' + y
                tmp.text = x + ' 모델에 대한 ' + method_k[i] + '권한'
                tmp.save
                i+=1
            end
        end
        
        auth = ['Baguni Controller','Calendar Controller','Home Controller']
        p = "Primary User"
        t = AuthorityBundle.where(name: p).first
        if t.nil?
            tmp = AuthorityBundle.new
            tmp.name = p
            tmp.text = "초기 유저를 위한 권한 모음"
            tmp.save
            auth.each do |x|
                tmp2 = Authority.new
                tmp2.authority_bundle_id = tmp.id
                tmp2.authority_def_id = AuthorityDef.where(name: x)
                tmp2.save
            end
        end
        
        redirect_to '/admin/index?admin=authority_def'
    end
    
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
        elsif @admin=="m_setting"
            if @mod == "1"
                @b = Setting.find(params[:id])
            else
                @b = Setting.new
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
        elsif @admin=="m_vltr_age"
            if @mod == "1"
                @b = VltrAge.find(params[:id])
            else
                @b = VltrAge.new
            end
        elsif @admin=="m_bongsa_tmp"
            if @mod == "1"
                @b = BongTmp.find(params[:id])
            else
                @b = BongTmp.new
            end
        elsif @admin=="m_authority_def"
            if @mod == "1"
                @b = AuthorityDef.find(params[:id])
            else
                @b = AuthorityDef.new
            end
        elsif @admin=="m_authority"
            if @mod == "1"
                @b = Authority.find(params[:id])
            else
                @b = Authority.new
            end
        elsif @admin=="m_user"
            if @mod == "1"
                @b = User.find(params[:id])
            else
                @b = User.new
            end
        elsif @admin=="m_user_type"
            if @mod == "1"
                @b = UserType.find(params[:id])
            else
                @b = UserType.new
            end
        elsif @admin=="m_authority_bundle"
            if @mod == "1"
                @b = AuthorityBundle.find(params[:id])
            else
                @b = AuthorityBundle.new
            end
        end
    end
    
    def m_authority_bundle
        re = AuthorityBundle.new
        re = AuthorityBundle.find(params[:id]) if params[:mod]=="1"
        re.name = params[:name]
        re.text = params[:text]
        re.save
        redirect_to '/admin/index?admin=authority_bundle'
    end
    
    def del_authority_bundle
        re = AuthorityBundle.find(params[:id])
        re.destroy
        redirect_to '/admin/index?admin=authority_bundle'
    end
    
    def m_user_type
        re = UserType.new
        re = UserType.find(params[:id]) if params[:mod]=="1"
        re.name = params[:name]
        re.authority_bundle_id = params[:authority_bundle_id]
        re.text = params[:text]
        re.save
        redirect_to '/admin/index?admin=user_type'
    end
    
    def del_user_type
        re = UserType.find(params[:id])
        re.destroy
        redirect_to '/admin/index?admin=user_type'
    end
    
    def m_user
        re = User.new
        re = User.find(params[:id]) if params[:mod]=="1"
        re.name = params[:name]
        re.password = params[:password]
        re.email = params[:email]
        re.phonenumber = params[:phonenumber]
        re.authority_bundle_id = params[:authority_bundle_id]
        re.user_type_id = params[:user_type_id]
        re.organization_id = params[:organization_id]
        re.available = params[:available]
        re.save
        redirect_to '/admin/index?admin=user'
    end
    
    def del_user
        re = User.find(params[:id])
        re.destroy
        redirect_to '/admin/index?admin=user'
    end
    
    def m_authority_def
        re = AuthorityDef.new
        re = AuthorityDef.find(params[:id]) if params[:mod]=="1"
        re.name = params[:name]
        re.value = params[:value]
        re.text = params[:text]
        re.save
        redirect_to '/admin/index?admin=authority_def'
    end
    
    def del_authority_def
        re = AuthorityDef.find(params[:id])
        re.destroy
        redirect_to '/admin/index?admin=authority_def'
    end
    
    def m_authority
        re = Authority.new
        re = Authority.find(params[:id]) if params[:mod]=="1"
        re.authority_bundle_id = params[:authority_bundle_id]
        re.authority_def_id = params[:authority_def_id]
        re.save
        redirect_to '/admin/index?admin=authority&id=' + params[:authority_bundle_id]
    end
    
    def del_authority
        re = Authority.find(params[:id])
        re.destory
        redirect_to '/admin/index?admin=authority&id=' + params[:authority_bundle_id]
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
        re.destory
        redirect_to '/admin/index?admin=region'
    end
    
    def m_vltr_age
        re = VltrAge.new
        re = VltrAge.find(params[:id]) if params[:mod]=="1"
        re.name = params[:name]
        re.min = params[:min]
        re.max = params[:max]
        re.save
        redirect_to '/admin/index?admin=vltr_age'
    end
    
    def del_vltr_age
        re = VltrAge.find(params[:id])
        re.destory
        redirect_to '/admin/index?admin=vltr_age'
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
        re.destory
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
        re.destory
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
        re.destory
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
        re.destory
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
    
    def m_setting
        re = Setting.new
        re = Setting.find(params[:id]) if params[:mod]=="1"
        re.name = params[:name]
        re.value = params[:value]
        re.save
        redirect_to '/admin/index?admin=setting'
    end
    
    def del_setting
        re = Setting.find(params[:id])
        re.delete
        redirect_to '/admin/index?admin=setting'
    end
    
    # def del_bongsa_time
    #     a = Bongsa.find(params[:id]).bongsa_times
    #     a.delete
    #     redirect_to '/admin/m_bongsa_time'
    # end
    
    def add_bongsa_link
        tmp = BongsaLink.new
        tmp.bongsa_id = params[:id]
        tmp.name = params[:n]
        tmp.url = params[:u]
        tmp.save
        
        redirect_to '/admin/m_bongsa_link?bid=' + params[:id].to_s
    end
    
    def del_bongsa_link
        BongsaLink.find(params[:id]).delete
        redirect_to '/admin/m_bongsa_link?bid=' + params[:iid].to_s
    end
    
    def m_bongsa_link
        render :layout => false
    end
    
    def add_bongsa_date
        tmp = BongsaDate.new
        tmp.bongsa_id = params[:id]
        tmp.date_type = params[:t]
        tmp.date_start = params[:s]
        tmp.date_end = params[:e]
        tmp.save
        
        redirect_to '/admin/m_bongsa_date?bid=' + params[:id].to_s
    end
    
    def del_bongsa_time
        BongsaDate.find(params[:id]).delete
        redirect_to '/admin/m_bongsa_date?bid=' + params[:iid].to_s
    end
    
    def m_bongsa_date
        render :layout => false
    end
    
    def add_bongsa_time
        tmp = BongsaTime.new
        tmp.bongsa_id = params[:id]
        tmp.time_type = params[:t]
        tmp.time_start = params[:s]
        tmp.time_end = params[:e]
        tmp.save
        
        redirect_to '/admin/m_bongsa_time?bid=' + params[:id].to_s
    end
    
    def del_bongsa_time
        BongsaTime.find(params[:id]).delete
        redirect_to '/admin/m_bongsa_time?bid=' + params[:iid].to_s
    end
    
    def m_bongsa_time
        render :layout => false
    end
    
    def m_bongsa
        
        unless params[:org_name].nil?
            org = Organization.new
            org.name = params[:org_name]
            org.save
            organization_id = org.id
        end
        
        if params[:mod] == "1"
            re = Bongsa.find(params[:id])
        else
            re = Bongsa.new
        end
            
        arr = Bongsa.attribute_names
        date = ['date_real_end','date_real_start','date_recruit_end','date_recruit_start']
        spec = ['organization_id']
        arr.each do |x|
            next if x=="id" || x=="created_at" || x=="updated_at"
            if date.include?(x)
                eval("re.#{x} = Date.parse(params[:#{x}]) unless params[:#{x}].nil? || params[:#{x}]==\'\'")
            elsif spec.include?(x)
                if params[:organization_id] == ""
                    eval("re.#{x} = #{organization_id}")
                else
                    eval("re.#{x} = params[:#{x}]")
                end
            else
                eval("re.#{x} = params[:#{x}] ")#unless params[:#{x}].nil? || params[:#{x}]==\'\'")
            end
        end
        
        re.content = "#{re.summary}
        #{re.content_etc}"
        
        re.save
        
        redirect_to '/admin/index?admin=bongsa'
    end
    
    def del_bongsa
        re = Bongsa.find(params[:id])
        re.destroy
        redirect_to '/admin/index?admin=bongsa'
    end
    
    def bongsa_tmp_save
        result = Array.new
        result_keytmp_all = Array.new
        ary = Array.new
        
        uri = URI("http://www.vms.or.kr/partspace/reqList.jsp")
        html_doc = Nokogiri::HTML(Net::HTTP.get(uri))
        html_doc.xpath('//td[@class="table_list"]/a/@onclick').each do |a|
            result_keytmp_all << a.value.last(9).first(6)
        end
        
        result_keytmp_first = result_keytmp_all.first
        result_keytmp = result_keytmp_first.to_i
        @stop_keytmp = result_keytmp_first.to_i
        
        if Tempcrl.count == 0
            @stop_keytmp = 191609
            @result_keytmp = 191452
        else  
            loop do
                break if Tempcrl.where(:keytemp => result_keytmp).take != nil
                break if result_keytmp <= 200
                ary << result_keytmp
                result_keytmp = result_keytmp - 1
            end
            @result_keytmp = ary.last.to_i
        end
        
        loop do 
          break if @result_keytmp <= 200
            result << @result_keytmp
              
            #nametmp 추출
            uri = URI("http://www.vms.or.kr/partspace/reqView.jsp?seq=" + @result_keytmp.to_s )
            doc_final = Nokogiri::HTML(Net::HTTP.get(uri))
            
          next if doc_final == nil
            title = doc_final.css(".table_t1//tr:nth-child(3)//td:nth-child(2)").inner_text.split(" ")
            title.delete_at(-1)
            result_nametmp = title.join(' ')
            
            #Tempcrawl에 key 저장, nametmp 저장
            tt = Tempcrl.new
            tt.keytemp = @result_keytmp
            tt.nametemp = result_nametmp
            tt.is_registerd = 0
            tt.save
             
            #loop의 다음 순환을 준비
            @result_keytmp = @result_keytmp + 1
          break if @result_keytmp == @stop_keytmp + 1
            
        end
        redirect_to :back
    end
    
    def bongsa_tmp
        if params[:lsst] == nil
            @lsst = 1
        else
            @lsst = params[:lsst].to_i
        end
        
        if params[:page] == nil
            @page = 1
        else
            @page = params[:page].to_i
        end
    end
    
    def bongsa_tmp_list_delete
        if params[:lsst]=="1"
            tt = Tempcrl.find(params[:id])
            tt.destroy
        elsif params[:lsst]=="2"
            tt = TempcrlA.find(params[:id])
            tt.destroy
        end
        
        unless params[:page].nil?
            redirect_to "/admin/bongsa_tmp?page=#{params[:page]}"
        else
            redirect_to :back
        end
    end
    
    def m_bongsa_tmp
        @page = params[:page]
        
        #크롤된 목록에서 봉사 1개 선택시 vms의 해당 봉사페이지에서 파싱해오는 함수 + 수정가능한 형태로 뿌려준다.
        
        #result_final = Array.new
        unless params[:mod].nil?
        else
        @k = Tempcrl.find(params[:id])
        
        uri = URI("http://www.vms.or.kr/partspace/reqView.jsp?seq=" + @k.keytemp.to_s )
        uri_final = uri
        doc_final = Nokogiri::HTML(Net::HTTP.get(uri_final))
        
        #파싱(봉사명)
        parsed_title =  doc_final.css(".table_t1//tr:nth-child(3)//td:nth-child(2)").inner_text.split(" ")
        parsed_title.delete_at(-1)
        @parsed_title = parsed_title.join(' ')
        
        #파싱(봉사기관)
        parsed_org =  doc_final.css(".table_t1//tr:nth-child(3)//td:nth-child(4)").inner_text
        @parsed_org = parsed_org.strip!.split("").drop(1).join
        
        #파싱(상세내용)
        parsed_content = doc_final.css(".table_t2//tr:nth-child(9)//td:nth-child(2)").inner_text
        @parsed_content = parsed_content
        
        #파싱(봉사지역)
        parsed_region = doc_final.css(".table_t1//tr:nth-child(5)//.table_t2//tr:nth-child(2)//td:nth-child(2)").inner_text
        @parsed_region = parsed_region
        
        #파싱(정기여부)
        parsed_regular = doc_final.css(".table_t1//tr:nth-child(5)//.table_t2//tr:nth-child(7)//td:nth-child(2)").inner_text
        if parsed_regular.first == "정"
            icon = "1" # (정기)
        else
            icon = "0" # (비정기)
        end
        @parsed_regular = icon
        
        #파싱(봉사기간)
        parsed_term = doc_final.css(".table_t1//tr:nth-child(5)//.table_t2//tr:nth-child(8)//td:nth-child(2)").inner_text
        @parsed_term_start = parsed_term.first(10)
        @parsed_term_end   = parsed_term.last(10)
        
        #파싱(모집인원)
        parsed_howmany =  doc_final.css(".table_t1//tr:nth-child(5)//.table_t2//tr:nth-child(5)//td:nth-child(2)").inner_text.split("")
        parsed_howmany.delete_at(-1)
        @parsed_howmany = parsed_howmany.join('')
        
        #파싱(사전교육)
        parsed_preedu = doc_final.css(".table_t1//tr:nth-child(6)//.table_t2//tr:nth-child(5)//td:nth-child(2)").inner_text
        if parsed_preedu.length <= 2
        parsed_preedu = "0" #(사전교육 없음)
        else
        parsed_preedu = "1" #(사전교육 있음)
        end
        @parsed_preedu = parsed_preedu
        
        #파싱(특이조건)
        parsed_sp_note = doc_final.css(".table_t1//tr:nth-child(6)//.table_t2//tr:nth-child(4)//td:nth-child(2)").inner_text
        @parsed_sp_note = parsed_sp_note
        
        #파싱(모집상태)
        parsed_status = doc_final.css('.table_t1//tr:nth-child(4)//td:nth-child(6)').xpath('//td/img/@alt').inner_text
        if parsed_status.index('모집중') != nil 
            parsed_status.replace "1" #"모집중"
        elsif parsed_status.index('모집완료') != nil
            parsed_status.replace "2" #"모집완료"
        else
            parsed_status.replace "0" #"모집예정"
        end
        
        @parsed_status = parsed_status
        
        #파싱(담당자)
        parsed_clerk = doc_final.css(".table_t2//tr:nth-child(10)//td:nth-child(2)").inner_text
        @parsed_clerk = parsed_clerk
        
        #파싱(담당자 연락처)
        parsed_call = doc_final.css(".table_t2//tr:nth-child(11)//td:nth-child(2)").inner_text
        @parsed_call = parsed_call
        
        #파싱(담당자 이메일)
        parsed_email = doc_final.css(".table_t2//tr:nth-child(12)//td:nth-child(2)").inner_text
        @parsed_email = parsed_email
    
        # @result_final = result_final
        #redirect_to '/admin/bongsa_post_tmp_save?drt=1'
        
        end
    end
    
    def bongsa_post_tmp_save
        unless params[:org_name].nil?
            org = Organization.new
            org.name = params[:org_name]
            org.save
            organization_id = org.id
        end
        
        if params[:mod]=="1"
            re = BongTmp.find(params[:id]) 
        else
            re = BongTmp.new
        end
        # re.save
        arr = BongTmp.attribute_names
        date = ['date_real_end','date_real_start','date_recruit_end','date_recruit_start']
        spec = ['organization_id']
        arr.each do |x|
            next if x=="id" || x=="created_at" || x=="updated_at" || x=="link"
            if date.include?(x)
                eval("re.#{x} = Date.parse(params[:#{x}]) unless params[:#{x}].nil? || params[:#{x}]==\'\'")
            elsif spec.include?(x)
                if params[:organization_id] == ""
                    eval("re.#{x} = #{organization_id}")
                else
                    eval("re.#{x} = params[:#{x}]")
                end
            else
                eval("re.#{x} = params[:#{x}] ")#unless params[:#{x}].nil? || params[:#{x}]==\'\'")
            end
        end
        re.save
        
        @iid = re.id
        
        if params[:mod]!="1"
            tt = Tempcrl.find(params[:id]) 
            tt.is_registerd = 1
            tt.save
        end
        
        if params[:drt]=="1"
            @direct_adrs = '/admin/crawled_realmodify/' + @iid.to_s
            redirect_to @direct_adrs
        else
            redirect_to '/admin/bongsa_tmp'
        end
    end
    
    def modify_bongsa_tmp
        @re = BongTmp.find(params[:id])
        @mod = params[:mod]
    end
    
    def del_bongsa_tmp
        re = BongTmp.find(params[:id])
        re.destroy
        redirect_to :back
    end
    
    def crawled_realmodify
        @b = BongTmp.find(params[:id])
    end
    
    def crawled_realsave
        
        # del = BongTmp.find(params[:idd])
        # del.destroy
        
        # re = Bongsa.new
        # re.img_poster = params[:img_poster]
        # re.img_main = params[:img_main]
        # re.name = params[:name]
        # re.is_approval = params[:is_approval]
        # re.address = params[:address]
        # re.clerk_email = params[:clerk_email]
        # re.content = params[:content]
        # re.is_edu = true if params[:is_edu] == 1
        # re.is_edu = false if params[:is_edu] == 0
        # re.status = params[:status]
        # re.organization_id = params[:organization_id]
        # re.clerk_call = params[:clerk_call]
        # re.clerk_name = params[:clerk_name]
        # re.is_regular = true if params[:is_regular] == 1
        # re.is_regular = false if params[:is_regular] == 0
        # re.date_real_end = Date.parse(params[:date_real_end])
        # re.date_real_start = Date.parse(params[:date_real_start])
        # re.date_recruit_end = Date.parse(params[:date_recruit_end])
        # re.date_recruit_start = Date.parse(params[:date_recruit_start])
        # re.time_expect_total = params[:time_expect_total]
        # re.time_daily_end = params[:time_daily_end]
        # re.time_daily_start = params[:time_daily_start]
        # re.vltr_req = params[:vltr_req]
        # re.vltr_sex = params[:vltr_sex]
        # re.vltr_age_id = params[:vltr_age_id]
        # re.vltr_num = params[:vltr_num]
        # re.region_id = params[:region_id]
        # re.school_id = params[:school_id]
        # re.btime_id = params[:btime_id]
        # re.category_id = params[:category_id]
        # re.admin_mod = params[:admin_mod]
        # re.admin_add = params[:admin_add]
        # re.act_time = params[:act_time]
        # re.save
        # redirect_to '/admin/index?admin=bongsa'
        #==============================================
        unless params[:org_name].nil?
            org_name = params[:org_name]
            # org_name = org_name.split(" ")
            # oarray = Array.new
            
            # Organization.all.each do |odb|
            #     org_name.each do |oname|
            #         if odb.index(oname) != nil
            #             oarray << oname
            #         end
            #         if oarray.count > 1
            #             org_name = odb
            #         end
            #     end
            # end
            org = Organization.new
            org.name = org_name
            org.save
            organization_id = org.id
        end
        
        if params[:mod]=="1"
            re = Bongsa.find(params[:id]) 
        else
            re = Bongsa.new
        end
        
        arr = Bongsa.attribute_names
        date = ['date_real_end','date_real_start','date_recruit_end','date_recruit_start']
        spec = ['organization_id']
        arr.each do |x|
            next if x=="id" || x=="created_at" || x=="updated_at"
            if date.include?(x)
                eval("re.#{x} = Date.parse(params[:#{x}])") #unless params[:#{x}].nil? || params[:#{x}]==\'\'")
            elsif spec.include?(x)
                if params[:organization_id] == ""
                    eval("re.#{x} = #{organization_id}")
                else
                    eval("re.#{x} = params[:#{x}]")
                end
            else
                eval("re.#{x} = params[:#{x}] ")#unless params[:#{x}].nil? || params[:#{x}]==\'\'")
            end
        end
        
        re.content = "#{re.summary}
        #{re.content_etc}"
        
        unless params[:img_main_url].nil?
            re.img_main = params[:img_main_url].to_s
        end
        
        re.save
        
        if params[:mod]!="1"
            if params[:lsst]=="1"
                tt = Tempcrl.find(params[:tid]) 
                tt.is_registerd = 1
                tt.save
            elsif params[:lsst]=="2"
                tt = TempcrlA.find(params[:tid]) 
                tt.is_registerd = 1
                tt.save
            end
        end
        
        if params[:lsst]=="1"
            redirect_to '/admin/bongsa_tmp'
        elsif params[:lsst]=="2"
            redirect_to '/admin/bongsa_tmp?lsst=2'
        end
    end
    
    def bongsa_tmp_save_second
        result_keytmp_all = Array.new
        i=1
        loop do
          @i = i
          uri = URI("http://www.1365.go.kr/nanum/prtl/web/vols/vol/selectWrkList.do?menuNo=P9130&currentPageNo="+i.to_s+"&schSido=6110000&korNm1=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C&korNm3=%EC%A0%84%EC%B2%B4&schCateGu=all")
          html_doc = Nokogiri::HTML(Net::HTTP.get(uri))
          html_doc.xpath('//td[@class="subject"]/a/@href').each do |a|
              aa = a.value.last(10).first(7)
              result_keytmp_all << aa
          end
          break if TempcrlA.where(:from => 1).where(:keytemp => result_keytmp_all.last).take != nil
          #아래의 break 조건문은 Tmpcrl이 비어있을때를 제외하고는 주석처리해둘것.
          # break if result_keytmp_all.count >= 15
          
          break if i.to_i > 81
          i = i.to_i + 1
        end
        
        if TempcrlA.where(:from => 1).count != 0
          n=1
          loop do
            iidd = TempcrlA.where(:keytemp => result_keytmp_all.last)
            break if iidd.count == 0
            result_keytmp_all.pop
            n=n+1
            break if n > 10 # 10으로 설정한 이유 : 한 페이지에 10개 게시물이 보여지고 이전 페이지까지 체크하러갈 필요가 없기 때문에.
          end
        end
        
        result_keytmp_all.reverse.each do |key|
          #nametmp 추출
          uri = URI("http://www.1365.go.kr/nanum/prtl/web/vols/vol/selectWrkView.do?menuNo=P9130&progrmRegistNo=" + key.to_s )
          doc_final = Nokogiri::HTML(Net::HTTP.get(uri))
            
        next if doc_final == nil
          title = doc_final.css(".subject//h3").inner_text
          result_nametmp = title.strip!
          #Tempcrawl에 key 저장, nametmp 저장
          tt = TempcrlA.new
          tt.keytemp = key.to_i
          tt.nametemp = result_nametmp
          tt.is_registerd = 0
          tt.from = 1
          tt.save
        end
        
        redirect_to '/admin/bongsa_tmp?lsst=2'
    end
    
    def m_bongsa_tmp_second
        
        #크롤된 목록에서 봉사 1개 선택시 1365의 해당 봉사페이지에서 파싱해오는 함수 + 수정가능한 형태로 뿌려준다.
        
        unless params[:mod].nil?
        else
        @k = TempcrlA.find(params[:id])
        
        uri = URI("http://www.1365.go.kr/nanum/prtl/web/vols/vol/selectWrkView.do?menuNo=P9130&progrmRegistNo=" + @k.keytemp.to_s )
        doc_final = Nokogiri::HTML(Net::HTTP.get(uri))
        
        #파싱(봉사명)
        parsed_title =  doc_final.css(".subject//h3").inner_text.strip!
        @parsed_title = parsed_title
        
        #파싱(봉사기관)
        parsed_org =  doc_final.css(".info//table//tbody//tr:nth-child(5)//td:nth-child(2)").inner_text
        @parsed_org = parsed_org.strip!#.split("").drop(1).join
        
        #파싱(상세내용)
        parsed_content = doc_final.css(".content_view").inner_text
        @parsed_content = parsed_content
        
        #파싱(봉사지역)
        parsed_region = doc_final.css(".info//table//tbody//tr:nth-child(6)//td:nth-child(2)").inner_text
        @parsed_region = parsed_region
        
        # #파싱(정기여부) # 1365에서는 알 수 없음.
        # parsed_regular = doc_final.css(".table_t1//tr:nth-child(5)//.table_t2//tr:nth-child(7)//td:nth-child(2)").inner_text
        # if parsed_regular.first == "정"
        #     icon = "1" # (정기)
        # else
        #     icon = "0" # (비정기)
        # end
        # @parsed_regular = icon
        
        #파싱(봉사기간) # 1365는 모집기간 + 봉사시간 도 받을 수 있음.
        parsed_term = doc_final.css(".info//table//tbody//tr:nth-child(1)//td:nth-child(2)").inner_text
        parsed_term_start = parsed_term.first(10).first(4) + '-' + parsed_term.first(10).first(7).last(2) + '-' + parsed_term.first(10).last(2)
        @parsed_term_start = parsed_term_start
        parsed_term_end = parsed_term.last(10).first(4) + '-' + parsed_term.last(10).first(7).last(2) + '-' + parsed_term.last(10).last(2)
        @parsed_term_end   = parsed_term_end
        
        #파싱(모집인원) #1365는 신청인원도 받을 수 있음.
        parsed_howmany =  doc_final.css(".info//table//tbody//tr:nth-child(2)//td:nth-child(4)").inner_text.split("")
        
        ir=1
        loop do
          parsed_howmany.pop
          ir = ir+1
          break if ir > 6
        end
        @parsed_howmany = parsed_howmany.join('').to_i
        
        # #파싱(사전교육) # 1365는 알 수 없음.
        # parsed_preedu = doc_final.css(".table_t1//tr:nth-child(6)//.table_t2//tr:nth-child(5)//td:nth-child(2)").inner_text
        # if parsed_preedu.length <= 2
        # parsed_preedu = "0" #(사전교육 없음)
        # else
        # parsed_preedu = "1" #(사전교육 있음)
        # end
        # @parsed_preedu = parsed_preedu
        
        #파싱(특이조건)
        parsed_sp_note_one = doc_final.css(".info//table//tbody//tr:nth-child(4)//th:nth-child(1)").inner_text
        parsed_sp_note_two = doc_final.css(".info//table//tbody//tr:nth-child(4)//td:nth-child(2)").inner_text
        parsed_sp_note_three = doc_final.css(".info//table//tbody//tr:nth-child(4)//th:nth-child(3)").inner_text
        parsed_sp_note_four = doc_final.css(".info//table//tbody//tr:nth-child(4)//td:nth-child(4)").inner_text
        @parsed_sp_note = parsed_sp_note_one + " : " + parsed_sp_note_two.strip + " // " + parsed_sp_note_three + " : " + parsed_sp_note_four.strip
        
        #파싱(모집상태)
        parsed_status = doc_final.xpath('//div[@class="subject"]/h3/img/@alt').inner_text
        if parsed_status.index('모집중') != nil 
            parsed_status.replace "1" #"모집중"
        elsif parsed_status.index('모집완료') != nil
            parsed_status.replace "2" #"모집완료"
        else
            parsed_status.replace "0" #"모집예정"
        end
        
        @parsed_status = parsed_status
        
        # #파싱(담당자)
        parsed_clerk = doc_final.css(".name//em").inner_text
        @parsed_clerk = parsed_clerk
        
        #파싱(담당자 연락처)
        parsed_call = doc_final.css(".phone//em").inner_text
        @parsed_call = parsed_call
        
        #파싱(담당자 이메일) #1365는 이메일은 안나오고 펙스 + 기관주소만 나옴.
        parsed_fax = doc_final.css(".fax//em").inner_text
        @parsed_fax = parsed_fax
    
        # @result_final = result_final
        #redirect_to '/admin/bongsa_post_tmp_save?drt=1'
        
        
        #*** 위에 있으면서 바뀐것들.
        #*** 이메일 >> 펙스 // 특이조건의 정형화.
        
        #=========1365만 추가되는 것들============#
        
        
        #파싱(신청인원)
        parsed_bitches_many = doc_final.css(".info//table//tbody//tr:nth-child(3)//td:nth-child(4)").inner_text
        @parsed_bitches_many = parsed_bitches_many
        
        #파싱(모집기간)
        parsed_recruit = doc_final.css(".info//table//tbody//tr:nth-child(2)//td:nth-child(2)").inner_text
        parsed_recruit_start = parsed_recruit.first(10).first(4) + '-' + parsed_recruit.first(10).first(7).last(2) + '-' + parsed_recruit.first(10).last(2)
        @parsed_recruit_start = parsed_recruit_start
        parsed_recruit_end = parsed_recruit.last(10).first(4) + '-' + parsed_recruit.last(10).first(7).last(2) + '-' + parsed_recruit.last(10).last(2)
        @parsed_recruit_end = parsed_recruit_end
        
        #파싱(봉사시간)
        parsed_daily = doc_final.css(".info//table//tbody//tr:nth-child(1)//td:nth-child(4)").inner_text
        
        parsed_daily_start = parsed_daily.first(3).split("")
        parsed_daily_start.pop
        @parsed_daily_start = parsed_daily_start.join('').to_i
        
        parsed_daily_end = parsed_daily.last(3).split("")
        parsed_daily_end.pop
        @parsed_daily_end = parsed_daily_end.join('').to_i
        
        #파싱(봉사요일)
        parsed_weekday = doc_final.css(".info//table//tbody//tr:nth-child(3)//td:nth-child(2)").inner_text
        parsed_weekday = parsed_weekday.strip!
        week_day_index = ['월','화','수','목','금','토','일']
        @parsed_weekday = Array.new
        week_day_index.each do |x|
            if parsed_weekday.index(x)
              @parsed_weekday << x
            end
        end
        
        @parsed_weekday = @parsed_weekday.join('')
        
        end
  
    end
end
