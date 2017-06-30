require 'game'

class PagesController < ApplicationController
  
  def game
    @grid = generate_grid(9)
    @start_time = Time.now
  end

  def score
    @word = params[:attempt]
    @grid = params[:grid].chars
    @time_spent = Time.now - Time.parse(params[:time])
    game = GameService.new(word: @word, grid: @grid)
    game.included?(@word, @grid)
  end

  def generate_grid(grid_size)
    Array.new(grid_size) { ('A'..'Z').to_a[rand(26)] }
  end
end
