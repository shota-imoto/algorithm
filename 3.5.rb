require './lib/generator'

# 3.5 全探索(3): 組み合わせの全探索
class CombinationSearch
  attr_accessor :amount, :array, :num
  def initialize(array, num)
    @array = array
    @amount = array.size
    @num = num
  end

  def combination_size
    2 ** amount
  end

  def execute
    combination_size.times do |i|
      bin = i.to_s(2)
      array.extend GetBinary
      new_array = array.get_binary(bin)
      return new_array if new_array.sum == num
    end
    false
  end
end

module GetBinary
  def get_binary(bin)
    bin_array = bin.split('').reverse
    zip(bin_array).map {|n| n[0] if n[1].to_i == 1 }.compact
  end
end

array = Generator.random_array(1..20, 5)

combination_search = CombinationSearch.new(array, 30)

pp "配列: #{combination_search.array}"
pp "求める数: #{combination_search.num}"
pp "組み合わせ: #{combination_search.execute}"
