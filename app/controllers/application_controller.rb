class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  def current_user
    if session[:user_id]
      u = User.where(id: session[:user_id]).first
      if u.nil?
        session[:user_id]=
        nil
      else
        u
      end
    else
      nil
    end
  end
  
  #로그인 되었는지 확인하는 function
  def is_signin?
    u = User.new
    if session[:user_id]
      u = User.find(session[:user_id])
      if u.nil?
        flash[:error] = "잘못된 사용자 입니다."
        reset_session
        redirect_to '/error'
      elsif u.available == 0
        flash[:error] = "승인이 되지 않은 사용자입니다."
        reset_session
        redirect_to '/error'
      end
    else
      flash[:error] = "로그인이 필요한 서비스 입니다."
      redirect_to '/error'
    end
  end
  
  #권한 확인하는 function
  def authority_check?(*authorities)
    flag=0
    if session[:user_id].nil?
      flag=0
    else
      u = User.find(session[:user_id])
    end
    c = Array.new(authorities.size, 0)
    
    a = AuthorityBundle.find(u.authority_bundle_id).authorities
    i=0
    authorities.each do |x|
      a.each do |y|
        if AuthorityDef.find(y.authority_def_id).value == x
          flag += 1
          c[i] = 1
          break
        end
      end
      i+=1
    end
    
    if c.include?(0)
      a = AuthorityBundle.find(UserType.find(u.user_type_id).authority_bundle_id).authorities
      i=0
      authorities.each do |x|
        a.each do |y|
          if AuthorityDef.find(y.authority_def_id).value == x
            flag += 1
            c[i] = 1
            break
          end
        end
        i+=1
      end
    end
    
    if !(!(c.include?(0)) || (AuthorityBundle.find(u.authority_bundle_id).name == "Administrator"))
      flash[:error] = "해당 권한이 없는 사용자입니다."
      redirect_to '/error'
    end
  end
  
end
