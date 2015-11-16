class HistoryController < ApplicationController
  
  def save
    h = History.new
    h.user_id = current_user.id
    h.time = params[:time]
    h.name = params[:name]
    
    if h.time.nil?
      h.time = 0
    end
    h.save
    
    redirect_to '/history/edit'
  end
  
  def edit
    render layout: false
  end
  
  def delete    
    params[:chk_his].split(',').each do |x|
      next if x.nil?
      x = x.to_i
      a = History.where(id: x).first
      a.delete unless a.nil?
    end
    
    redirect_to '/history/edit'
  end
  
  def test
    @k = params[:chk_his].split(',')
    @p = params[:chk_his]
  end
  
end