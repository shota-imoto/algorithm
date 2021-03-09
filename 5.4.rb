require './lib/generator'
# 動的計画法の例(1): ナップサック問題

class NapSack
  attr_accessor :array, :weight_limit, :values, :dup_values
  def initialize(array, weight_limit)
    @array = array
    @weight_limit = weight_limit
    @values = Array.new(weight_limit) { 0 }
    @dup_values = []
  end

  def chmax(weight, value)
    dup_values[weight] = value if dup_values[weight] < value
  end

  def max_value
    array.each do |w, v|
      self.dup_values = values.dup
      values.each_with_index do |current_value, i|
        chmax(i, current_value)
        chmax(i+w, current_value + v) if i+w < weight_limit
      end
      p self.values = dup_values.dup
    end
  end
end


array = [[2, 3], [1, 2], [3, 6], [2, 1], [1, 3], [5, 85]]
nap_sack = NapSack.new(array, 100)
nap_sack.max_value


def each_test
  array = [1,2,3,4,5]
  array.each_with_index{|n, i| array[i+1]=100 if array.size < i; p "i: #{i}, n: #{n}"  }
end


# 各重さごとの最大の合計価値をvaluesに格納していく
# arrayの中のものをeachループで一つずつ採用or不採用のときの値をvaluesの各重さの値と比較して、大きければ代入
