# 2.4 計算量を求める例（2）：最近点対問題

require './lib/generator'

class Array
  def from(position)
    self[position, length] || []
  end
end

class NearestDot

  attr_reader :array

  def initialize(two_dimension_array = [])
    @array = two_dimension_array
  end

  def distance(grid, other_grid)
    dist_x = grid[0] - other_grid[0]
    dist_y = grid[1] - other_grid[1]
    Math.sqrt(dist_x ** 2 + dist_y ** 2)
  end

  def nearest_dots
    uniq_array = array.uniq
    min_dist = 100 ** 2
    min_grid = []

    uniq_array.each_with_index do |n, i|
      uniq_array.from(i+1).each do |m|
        dist = distance(n, m)
        if dist < min_dist
          min_dist = dist
          min_grid = [m, n]
        end
      end
    end
    [min_dist, min_grid]
  end

  def nearest_dots2
    min_dist = 100 ** 2
    min_grid = []

    combination_array = array.combination(2)

    combination_array.each do |c|
      dist = distance(*c)
      if dist < min_dist
        min_dist = dist
        min_grid = c
      end
    end

    [min_dist, min_grid]
  end
end


ary = Generator.two_dimension_array
nearest_dot = NearestDot.new(ary)
p nearest_dot.nearest_dots
p nearest_dot.nearest_dots2

