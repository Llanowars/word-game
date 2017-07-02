require 'game'

class PagesController < ApplicationController
  
  def game
    @grid = generate_grid(9)
    @start_time = Time.now
    @total = session[:total].nil? ? session[:total] = 0 : session[:total] += 1
  end

  def score
    @word = params[:attempt]
    @grid = params[:grid].gsub(/\W/, "").split("")
    @start_time = Time.parse(params[:time])
    @end_time = Time.now
    @result = run_game(@word, @grid, @start_time, @end_time)
    @total = session[:total]
  end 

  def generate_grid(grid_size)
    Array.new(grid_size) { ('A'..'Z').to_a[rand(26)] }
  end
end
