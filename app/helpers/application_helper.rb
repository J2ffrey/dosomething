module ApplicationHelper
  
  # def current_user
  #   if session[:user_id]
  #     u = User.where(id: session[:user_id]).first
  #     if u.nil?
  #       session[:user_id]=
  #       nil
  #     else
  #       u
  #     end
  #   else
  #     nil
  #   end
  # end
  
  # def authority_confirm?(*authorities)
  #   flag=0
  #   if session[:user_id].nil?
  #     flag=0
  #   else
  #     u = User.find(session[:user_id])
  #   end
  #   c = Array.new(authorities.size, 0)
    
  #   a = AuthorityBundle.find(u.authority_bundle_id).authorities
  #   i=0
  #   authorities.each do |x|
  #     a.each do |y|
  #       if AuthorityDef.find(y.authority_def_id).value == x
  #         flag += 1
  #         c[i] = 1
  #         break
  #       end
  #     end
  #     i+=1
  #   end
    
  #   if c.include?(0)
  #     a = AuthorityBundle.find(UserType.find(u.user_type_id).authority_bundle_id).authorities
  #     i=0
  #     authorities.each do |x|
  #       a.each do |y|
  #         if AuthorityDef.find(y.authority_def_id).value == x
  #           flag += 1
  #           c[i] = 1
  #           break
  #         end
  #       end
  #       i+=1
  #     end
  #   end   
  #   b = true
    
  #   if (c.include?(0)) && (AuthorityBundle.find(u.authority_bundle_id).name != "Administrator")
  #     b = false
  #   end
    
  #   return b
  # end
  
end
