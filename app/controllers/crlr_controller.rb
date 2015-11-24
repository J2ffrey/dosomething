class CrlrController < ApplicationController
  before_action {is_signin?}
  def cleaner_crl
    
      @lsst = params[:lsst]
      # 만약 vms에 대한 데이터를 청소할땐
      if @lsst == nil
          Tempcrl.where(:from => nil).reverse.each do |x|
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
      elsif @lsst == "2"
          tempcrl_first_hundred = Tempcrl.where(:from => 1).first(2) #(100)
          tempcrl_last_hundred = Tempcrl.where(:from => 1).last(2) #(100)
          
          n=1
          tempcrl_first_hundred.each do |x|
              uri = URI("http://www.1365.go.kr/nanum/prtl/web/vols/vol/selectWrkView.do?menuNo=P9130&progrmRegistNo=" + x.keytemp.to_s )
              doc_final = Nokogiri::HTML(Net::HTTP.get(uri))
              title = doc_final.css(".subject//h3").inner_text
              
                  if title.nil?
                      shit = Tempcrl.find(x.id)
                      shit.delete
                  end # DELETE_if End
              puts n
              n=n+1
          end # Each do(x) End
          
          m=1
          tempcrl_last_hundred.each do |x|
              uri = URI("http://www.1365.go.kr/nanum/prtl/web/vols/vol/selectWrkView.do?menuNo=P9130&progrmRegistNo=" + x.keytemp.to_s )
              doc_final = Nokogiri::HTML(Net::HTTP.get(uri))
              title = doc_final.css(".subject//h3").inner_text
              
                  if title.nil?
                      shit = Tempcrl.find(x.id)
                      shit.delete
                  end # DELETE_if End
              puts m
              m=m+1
          end # Each do(x) End
          redirect_to '/'
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
