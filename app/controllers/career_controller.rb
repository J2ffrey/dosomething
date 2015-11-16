class CareerController < ApplicationController
  def index
  c = Career.new
  c.user_id = current_user.id
  c.name = params[:name]
  c.save
  redirect_to :back
  
  end

  def d_career
    c = Career.find(params[:chk_info])
  
      
    
    c.delete
    redirect_to :back
  end
end
