class SiteController < ApplicationController
  #layout 'landing'
  def home
    render 'home', layout: 'landing'
  end

  def contact
    #render 'contact'
  end

  def say_name
    @name = params[:name]
    render 'say_name'
  end

  def calculator
  end

  def calculate
    @num1 = params[:first_num].to_f
    @num2 = params[:second_num].to_f
    @result = @num1 + @num2
  end
end
