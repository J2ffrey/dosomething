class CalendarController < ApplicationController
  
  def index
    date = Date.today
    @day = date.day
    @month = date.month
    @year = date.year
    @ck0 = 1
    @ck1 = 0
    @ck2 = 0
    @ck3 = 0
    @ck4 = 0
    @ck5 = 0
    @s_c = 1
    @e_c = 1
    # @first = 1
  end
  
  def small
    render :layout => false
    if params[:year].nil?
      redirect_to '/'
    end
    @year = params[:year]
    @month = params[:month]
  end
  
  def large
    render :layout => false
    @day = params[:day]
    @year = params[:year]
    @month = params[:month]
    @s_word = params[:s_word]
  end
  
  def test
    a = "박현민"
    if a.include?("박")
      redirect_to '/'
    end
    
  end
end
