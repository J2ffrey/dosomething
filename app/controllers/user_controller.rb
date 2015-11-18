class UserController < ApplicationController
  before_action :is_signin?, except: [:sign_up, :sign_up_confirm, :sign_in, :user_agreement]
  
  def sign_up_confirm
    
    if User.where(:email => params[:email]).first.nil?
      u = User.new
      u.name = params[:name]
      u.picture = params[:picture]
      u.phonenumber = params[:phonenumber]
      u.organization_id = params[:organization_id]
      u.organization_id = 0 if params[:organization_id].nil?
      u.email = params[:email]
      u.password = params[:password]
      u.authority_bundle_id = AuthorityBundle.where(name:"Primary User").first.id
      u.user_type_id = 1
      u.available = 1
      u.available = 0 if u.organization_id > 0
      u.save
      
      session[:user_id] = u.id
      
      if !(u.organization_id.nil? || u.organization_id == 0)
        redirect_to '/home/main_org'
      else
        redirect_to '/home/index'
      end
    else
      flash[:error] ="이미 가입된 계정이 있습니다."
      redirect_to :back
    end
    
    
  end
  
  #     t.integer  :sign_in_count,           null: false, default: 0
  #     t.datetime :current_sign_in_at
  #     t.datetime :last_sign_in_at
  #     t.string   :current_sign_in_ip
  #     t.string   :last_sign_in_ip
      
  
  # 로그인
  def sign_in
    u = User.where(email: params[:email], password: params[:password]).first
    unless u.nil?
      session[:user_id] = u.id
      
      u.last_sign_in_ip = u.current_sign_in_ip
      u.last_sign_in_at = u.current_sign_in_at
      
      u.sign_in_count += 1
      
      u.current_sign_in_ip = request.remote_ip
      u.current_sign_in_at = Time.zone.now
      u.save
    else
      flash[:error] ="아이디 혹은 비밀번호가 맞지 않습니다"
    end
    
    redirect_to "#{params[:redirect]}" unless params[:redirect].nil?
    redirect_to :back if params[:redirect].nil?
  end
  
  def sign_out
    reset_session
    redirect_to "#{params[:redirect]}" unless params[:redirect].nil?
    redirect_to :back if params[:redirect].nil?
  end  
  
  def mypage
    
  end
  
  def mypage_edit
    
  end
  
  def delete_account
    
  end
  
  def delete_account_confirm
    current_user.delete
    reset_session
    redirect '/home/index'
  end

  def mypage_confirm
    u = User.find(current_user.id)
    
    @destroy = History.find(params[:id])
    @destroy.destroy
    
    @new_password = params[:password]
    @confirm_password = params[:confirm_password]
    
    if @new_password == @confirm_password
      u.password = @confirm_password if params[:confirm_password] != nil && params[:confirm_password].length >= 8
    if params[:phonenumber].length <=0
      u.phonenumber = current_user.phonenumber
    else
      u.phonenumber = params[:phonenumber]
    end
      u.intro = params[:intro] unless params[:intro].nil?
      u.career = params[:career] unless params[:career].nil?
      
    if params[:school].length <=0
      u.school = current_user.school
    else
      u.school = params[:school] 
    end
      u.save
      #flash[:alert] = params[:phonenumber].to_s
      
    elsif @new_password != @confirm_password
      if @new_password.length >= 8 && @confirm_password.length >= 8
        flash[:alert] = '비밀번호가 일치하지 않습니다.'
      else
        flash[:alert] = '비밀번호가 변경되지 않았습니다.'
        u.phonenumber = params[:phonenumber] unless params[:phonenumber].nil?
        u.intro = params[:intro] unless params[:intro].nil?
        u.career = params[:career] unless params[:career].nil?
        u.school = params[:school] unless params[:school].nil?
        u.save
      end
      
    else
      u.phonenumber = params[:phonenumber] unless params[:phonenumber].nil?
      u.intro = params[:intro] unless params[:intro].nil?
      u.career = params[:career] unless params[:career].nil?
      u.school = params[:school] unless params[:school].nil?
      u.save  
      
    end
    
    redirect_to :back
    #@history = current_user.histories
  end
  
  def user_agreement
      
  end
  
  
  def user_delete
    u = current_user
    
    u.delete
    redirect_to '/home/index'
  end
  # def user_find
  
  # end
  
  # def user_find_confirm
  #   u = User.find(params[:name], params[:phonenumber])
  #   unless u.nil?
  #     session[:user_id] = u.id
  #   else
  #     flash[:error] ="이름 혹은 전화번호가 맞지 않습니다"
  #   end
  # end
end
