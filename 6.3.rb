# 一般化した二分探索法

def judge?(x)
  # 判定処理
end

def binary_search()
  while right - left > 1
    mid = left + (right - left) / 2
    if judge?(mid)
      right = mid
    else
      left = mid
    end
  end
  right
end
