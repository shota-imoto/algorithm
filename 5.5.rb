require './lib/generator'
# 5.5 動的計画法の例(2): 編集距離
class EditDistance
  attr_accessor :dp, :str1, :str2
  def initialize(str1, str2)
    @str1 = [''] + str1.split('')
    @str2 = [''] + str2.split('')
    @dp = Array.new(str1.size + 1) do |_|
      Array.new(str2.size + 1) { |_| Float::INFINITY }
    end
  end

  def chmin(i, n)
    # if
  end

  def execute
    dp[0][0] = 0
    str1.each_with_index do |s, i|
      str2.each_with_index do |t, j|
        # p s.empty?
        # p "s: #{s}, t: #{t}"
        if !s.empty? && !t.empty?
          if s == t
            dp[i][j] = dp[i-1][j-1] if dp[i][j] > dp[i-1][j-1]
          else
            dp[i][j] = dp[i-1][j-1] + 1 if dp[i][j] > dp[i-1][j-1] + 1
          end
        end

        if !s.empty?
          dp[i][j] = dp[i-1][j] + 1 if dp[i][j] > dp[i-1][j] + 1
        end

        if !t.empty?
          dp[i][j] = dp[i][j-1] + 1 if dp[i][j] > dp[i][j-1] + 1
        end
      end
    end
  end
end


str1 = 'logistic'
str2 = 'algorithm'
ed = EditDistance.new(str1, str2)
ed.execute

pp ed.dp
