class Fibonatch
  attr_accessor :cache

  def initialize
    @cache = [0, 1]
  end

  def execute(n)
    @cache[n] = @cache[n] || execute(n-1) + execute(n-2)
  end
end


print 'fibonatch: '
n = gets.to_i

f = Fibonatch.new
f.execute(n)
pp f.cache
