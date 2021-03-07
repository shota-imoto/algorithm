# 再帰の例(1): ユークリッドの互除法

def gcd(m, n)
  r = m % n
  # p "m:#{m}, n:#{n}, r:#{r}"
  return n if r == 0
  gcd(n, r)
end

print "m = "
m = gets.to_i
print "n = "
n = gets.to_i

p gcd(m, n)
