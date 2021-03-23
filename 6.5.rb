# 応用例(1): 年齢当てゲーム

class AgeQuiz
  attr_accessor :left, :right, :answer

  def initialize(range, answer)
    @left = range.first
    @right = range.last
    @answer = answer
  end

  def over?(age)
    age > answer
  end

  def speculate
    while right - left > 1
      mid = left + (right - left) / 2
      p "l: #{left} r:#{right}"
      if over?(mid)
        self.right = mid
      else
        self.left = mid
      end
    end
    left
  end
end

age_quiz = AgeQuiz.new(20..36, 36)

p age_quiz.speculate
