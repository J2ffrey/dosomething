class CareerController < ApplicationController
  def save
  c = Career.new
  c.user_id = current_user.id
  c.name = params[:name]
  c.save
  redirect_to 'career/edit'
  
  end
  
  def edit
    render layout: false
  end
  
  def delete    
    params[:chk_info].split(',').each do |x|
      next if x.nil?
      x = x.to_i
      a = Career.where(id: x).first
      a.delete unless a.nil?
    end
    
    redirect_to '/career/edit'
  end
  
  end
end
