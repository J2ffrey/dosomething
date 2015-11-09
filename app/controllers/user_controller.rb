class UserController < ApplicationController
  
  def sign_up_confirm
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
  end
  
  # 로그인
  def sign_in
    u = User.where(email: params[:email], password: params[:password]).first
    unless u.nil?
      session[:user_id] = u.id
    else
      flash[:error] = "패스워드나 이메일 틀림"
    end
    
    redirect_to "#{params[:redirect]}" unless params[:redirect].nil?
    redirect_to :back if params[:redirect].nil?
  end
  
  def sign_out
    reset_session
    redirect_to "#{params[:redirect]}" unless params[:redirect].nil?
    redirect_to :back if params[:redirect].nil?
  end
  

end
