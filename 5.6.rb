require './lib/generator'
# 5.6 動的計画法の例(3): 区間分割の仕方を最適化
class DivideSection
  attr_accessor :scores, :dp
  def initialize(scores)
    @scores = scores
    @dp = Array.new(scores.size) { Float::INFINITY }
  end

  def chmin(a, b)
    dp[a] = b if dp[a] > b
  end

  def execute
    dp[0] = 0
    scores.each_with_index do |s, i|
      p s
      0.upto(i - 1) do |j|
        # p "i: #{i}, j: #{j}"
        # p "dp[i] #{dp[i]} dp[j] #{dp[j] + s[j]}"
        chmin(i, dp[j] + s[j])
      end
    end
  end
end


scores = Generator.two_dimension_table(5, 5, 1..20)
divide_section = DivideSection.new(scores)
divide_section.execute

p divide_section.dp

# |o|o|o|o|o|
# |o|o o o o|
# |o o|o o o|
# |o o o|o o|
# iの区切りをずらしていく|
# |o o o|o o|

# iの区切りが2のとき
# jの区切りが0だと
# |o o o|o o|
# jの区切りが1だと
# |o|o o|o o|
# jの区切りが2だと
# |o o|o|o o|

# score表？
# 区切り方によって、ランダムに数値が変わる
# どう区切ると合計値がランダムに変わるか

