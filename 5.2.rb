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


f=Frog.new([2, 9, 4, 5, 1, 6, 10])
f.min_cost

pp f.cost_array
