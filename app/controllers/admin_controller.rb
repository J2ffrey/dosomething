class AdminController < ApplicationController
    before_action {is_signin?}
    before_action {authority_check?("cAdmin")}
    
    def authority_seed
        model = ['User', 'Bongsa', 'Bucket', 'Region', 'School', 'Btime', 'Category', 'Region2', 'Admin', 'Organiztion', 'VltrAge', 'RealBongsa', 'BongsaTmp', 'Authority', 'AuthorityBundle', 'AuthorityDef']
        method = ['c', 'u', 'r', 'd']
        # method_n = Hash.new
        # method_n = ['c' => 'Create', 'u' => 'Update', 'r' => 'Read', 'd' => 'Delete']
        # method_k = Hash.new
        # method_k = ['c' => '생성', 'u' => '수정', 'r' => '읽기', 'd' => '삭제']
        
        method_e = ['Create', 'Update', 'Read', 'Delete']
        method_k = ['생성', '수정', '읽기', '삭제']
        
        model.each do |x|
            i = 0
            method.each do |y|
                check = AuthorityDef.where(value: x + '_' + y).first
                next unless check.nil?
                tmp = AuthorityDef.new
                #tmp.name = x + '_' + method_n["#{y}"]
                tmp.name = x + '_' + method_e[i]
                tmp.value = x + '_' + y
                #tmp.text = x + ' 모델에 대한 ' + method_k["#{y}"] + '권한'
                tmp.text = x + ' 모델에 대한 ' + method_k[i] + '권한'
                tmp.save
                i += 1
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
        elsif @admin=="m_vltr_age"
            if @mod == "1"
                @b = VltrAge.find(params[:id])
            else
                @b = VltrAge.new
            end
        elsif @admin=="m_bongsa_tmp"
            if @mod == "1"
                @b = BongsaTmp.find(params[:id])
            else
                @b = BongsaTmp.new
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
        re.delete
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
        re.delete
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
        re.delete
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
        re.is_approval = params[:is_approval]
        re.address = params[:address]
        re.clerk_email = params[:clerk_email]
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
    
    def bongsa_tmp_save
        #상위 몇 개 긁어올 것인지 설정하고 싶을 때, 이것을 바꾸세요.(최초=10)
        #restrict = 10
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
        
        #   if Tempcrl.count == 0
        #       stop_keytmp = 190300
        #       result_keytmp = 190200
        #   else 
              loop do
                  break if Tempcrl.where(:keytemp => result_keytmp).take != nil
                  break if result_keytmp <= 190200
                  ary << result_keytmp
                  result_keytmp = result_keytmp - 1
              end
              @result_keytmp = ary.last.to_i
        #   end
        
        
          
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
    end
    
    def bongsa_tmp_list_delete
        tt = Tempcrl.find(params[:id])
        tt.delete
        redirect_to :back
    end
    def m_bongsa_tmp
        #result_final = Array.new
        @k = Tempcrl.find(params[:id])
        #189784 #186283 #189787
        uri = URI("http://www.vms.or.kr/partspace/reqView.jsp?seq=" + @k.keytemp.to_s )
        uri_final = uri
        doc_final = Nokogiri::HTML(Net::HTTP.get(uri_final))
        
        #파싱(봉사명)
        parsed_title =  doc_final.css(".table_t1//tr:nth-child(3)//td:nth-child(2)").inner_text.split(" ")
        parsed_title.delete_at(-1)
        @parsed_title = parsed_title.join(' ')
        
        #파싱(봉사기관)
        parsed_org =  doc_final.css(".table_t1//tr:nth-child(3)//td:nth-child(4)").inner_text
        @parsed_org = parsed_org
        
        #파싱(상세내용)
        parsed_content = doc_final.css(".table_t2//tr:nth-child(9)//td:nth-child(2)").inner_text
        @parsed_content = parsed_content
        
        #파싱(봉사지역)
        parsed_region = doc_final.css(".table_t1//tr:nth-child(5)//.table_t2//tr:nth-child(2)//td:nth-child(2)").inner_text
        @parsed_region = parsed_region
        
        #파싱(정기여부)
        parsed_regular = doc_final.css(".table_t1//tr:nth-child(5)//.table_t2//tr:nth-child(7)//td:nth-child(2)").inner_text
        if parsed_regular.first == "정"
          icon = 1 # (정기)
        else
          icon = 0 # (비정기)
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
        parsed_preedu = 0 #(사전교육 없음)
        else
        parsed_preedu = 1 #(사전교육 있음)
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
        
        #파싱(담당자 연락처)
        parsed_email = doc_final.css(".table_t2//tr:nth-child(12)//td:nth-child(2)").inner_text
        @parsed_email = parsed_email
    
        # @result_final = result_final
        
    end
    
    def bongsa_post_tmp_save
        re = BongsaTmp.new
        re = BongsaTmp.find(params[:id]) if params[:mod]=="1"
        
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
        
        tt = Tempcrl.find(params[:id])
        tt.is_registerd = 1
        tt.save
        
        redirect_to '/admin/index?admin=bongsa_tmp'
    end
    
    def del_bongsa_tmp
        re = BongsaTmp.find(params[:id])
        re.delete
        redirect_to '/admin/index?admin=bongsa_tmp'
    end
end
