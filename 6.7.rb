require './lib/generator'

class Baloon
  HIGH_RANGE  = 10..20
  SPEED_RANGE = 1..5
  TIME_RANGE  = 10..20

  attr_accessor :high, :speed, :time

  def initialize(high, speed, time)
    @high = high
    @speed = speed
    @time = time
  end

  def self.random_new
    high, speed, time = rand(HIGH_RANGE), rand(SPEED_RANGE), rand(TIME_RANGE)
    new(high, speed, time)
  end

end

class Baloons

  attr_accessor :baloons

  def initialize(baloons)
    @baloons = baloons
  end

  def self.random_new(amount)
    new Array.new(amount) { Baloon.random_new }
  end

  def add_baloon(baloon)
    baloons << baloon
  end

  def time_sort
    baloons.sort { |a, b| a.time <=> b.time }
  end

  def gunner(n)
    left = 0
    right = n * 10

    while right - left > 1 do
      mid = (left + right) / 2

      ok = true

      for i in 0..(n-1) do
        if mid < baloons[i].high
          ok = false
        else
          self.baloons[i].time = (mid - baloons[i].high) / baloons[i].speed
        end
      end

      time_sort
      for i in 0..(n-1) do
        ok = false if baloons[i].time < i
      end

      if ok
        right = mid
      else
        left = mid
      end
      p mid
    end
  end
end
# 応用例(3): 最適化問題を判定問題に

N = 10
baloons = Baloons.random_new(N)

p baloons
p baloons.gunner(N)
