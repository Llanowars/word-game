require 'game'

class PagesController < ApplicationController
  
  def game
    @grid = generate_grid(9)
    @start_time = (Time.now)
  end

  def score
    @attempt = params[:attempt]
    @grid = params[:grid]
  # @start_time = Date.parse params[:time]
  # @end_time = Time.now
  end

  def generate_grid(grid_size)
    Array.new(grid_size) { ('A'..'Z').to_a[rand(26)] }
  end
end
