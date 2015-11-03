class CalendarController < ApplicationController
  
  def index
    date = Date.today
    
    @day = date.day
    @month = date.month
    @year = date.year
  end
  
  def large
    render :layout => false
    @day = params[:day]
    @year = params[:year]
    @month = params[:month]
  end
  
end
