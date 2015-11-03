module ApplicationHelper
  
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
  
end
