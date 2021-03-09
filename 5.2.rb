require './lib/generator'
# 動的計画法の例題

scaffold = Generator.random_array

class Frog
  attr_accessor :array, :cost_array
  def initialize(array)
    @array = array
    @cost_array = [0]
  end

  def cost(i, j)
    (array[i] - array[j]).abs
  end

  def sum_cost(i, j)
    (array[i] - array[j]).abs + cost_array[i]
  end

  def min_cost
    1.upto(array.size-1) do |i|
      cost_array << sum_cost(i-1, i) if i == 1
      cost_array << [sum_cost(i-2, i), sum_cost(i-1, i)].min
    end
    cost_array[-1]
  end
end

class Frog2
  attr_accessor :array, :cost_array
  def initialize(array)
    @array = array
    @cost_array = Array.new(array.size) { Float::INFINITY }
  end

  def cost(i, j)
    (array[i] - array[j]).abs
  end

  def sum_cost(i, j)
    (array[i] - array[j]).abs + cost_array[i]
  end

  def chmin(i, value)
    cost_array[i] = value if cost_array[i] > value
  end

  def min_cost
    0.upto(array.size-1) do |i|
      chmin(i, 0) if i == 0
      chmin(i, sum_cost(i-1, i)) if i > 0
      chmin(i, sum_cost(i-2, i)) if i > 1
    end
    cost_array[-1]
  end
end

class Frog3
  attr_accessor :array, :cost_array
  def initialize(array)
    @array = array
    @cost_array = Array.new(array.size) { Float::INFINITY }
  end

  def cost(i, j)
    (array[i] - array[j]).abs
  end

  def sum_cost(i, j)
    (array[i] - array[j]).abs + cost_array[i]
  end

  def chmin(i, value)
    cost_array[i] = value if cost_array[i] > value
  end

  def min_cost
    chmin(0, 0)
    0.upto(array.size-1) do |i|
      chmin(i+1, sum_cost(i, i+1)) if i + 1 < array.size
      chmin(i+2, sum_cost(i, i+2)) if i + 2 < array.size
      pp cost_array
    end
    cost_array[-1]
  end
end


f=Frog3.new([2, 9, 4, 5, 1, 6, 10])
f.min_cost

pp f.cost_array


