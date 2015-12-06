class CrlrController < ApplicationController
  before_action {is_signin?}
  def cleaner_crl
    
      @lsst = params[:lsst]
      # 만약 vms에 대한 데이터를 청소할땐
      if @lsst == nil
          Tempcrl.all.reverse.each do |x|
              uri = URI("http://www.vms.or.kr/partspace/reqView.jsp?seq=" + x.keytemp.to_s )
              uri_final = uri
              doc_final = Nokogiri::HTML(Net::HTTP.get(uri_final))
              parsed_status = doc_final.css('.table_t1//tr:nth-child(4)//td:nth-child(6)').xpath('//td/img/@alt').inner_text
              
                  if parsed_status.index('모집완료') != nil
                      shit = Tempcrl.find(x.id)
                      shit.delete
                  end # DELETE_if End
          end # Each do(x) End
          redirect_to '/'
        #   redirect_to '/admin/bongsa_tmp'
      
      # 만약 1365에 대한 데이터를 청소할땐
      elsif @lsst != nil
          
          # 이 울타리 안에있는건 몇개를 검사하고 지울지 정하기 위해서(한번에 다하면 오래걸리고 에러나는 경우가 많아서) 만들어둠
          #====================================================================================================================
          tempcrla = Array.new
          @many = Array.new
          
          tempcrla = TempcrlA.all
        #   tempcrla = TempcrlA.first(200) #처음 200개를 검사하도록 설정했음. 해보시고 잘 되면 all로 바꿔주면 됨
          
              #  이 변수들은 앞에 200개만 돌렸을때 그 마지막 데이터가 뭔지 확인하려고 만들어둠
              #===============================================================================
              @id = tempcrla.last.id.to_s
              @keytemp = tempcrla.last.keytemp.to_s
              #===============================================================================
          #===================================================================================================================
          
          tempcrla.each do |x|
            uri = URI("http://www.1365.go.kr/nanum/prtl/web/vols/vol/selectWrkView.do?menuNo=P9130&progrmRegistNo=" + x.keytemp.to_s )
            doc_final = Nokogiri::HTML(Net::HTTP.get(uri))
            title = doc_final.css(".subject//h3").inner_text.strip!
             
            if title.to_s != TempcrlA.find(x.id).nametemp.to_s
                shit = TempcrlA.find(x.id)
                @many << shit.id
                shit.delete
            end # DELETE_if End
          end # Each do(x) End
              
          redirect_to "/admin/bongsa_tmp?lsst=2&id=#{@id}&keytemp=#{@keytemp}&many=#{@many.count}"
          #redirect_to '/admin/bongsa_tmp?lsst=2'
          
      end # if(@lsst => parameter) End
  end # def(cleaner) End
  
  def temp
    # http://www.1365.go.kr/nanum/prtl/web/vols/vol/selectWrkView.do?menuNo=P9130&progrmRegistNo=1791901
    trashcan = Array.new
    
    ssibal = Tempcrl.where(:from => 1)
    ssibal.each do |sb|
        byungsin = Tempcrl.find(sb.id)
        byungsin.delete
        trashcan << "1365는 다 지웠어 니기럴"
    end
    
    zzindda = Tempcrl.where(:from => nil)
    zzindda.each do |zd|
        if zd.id > 1040
            eza = Tempcrl.find(zd.id)
            trashcan << zd.id
            eza.delete
        end
    end
    
    @can = trashcan
    
  end
end
