def recursion_sum(n)
  return 1 if n == 1
  n + recursion_sum(n - 1)
end

p "1からNまでの総和を計算"
print "N = "
n = gets.to_i
pp recursion_sum(n)

