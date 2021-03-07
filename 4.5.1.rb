require './lib/generator'
# 4.5.1 部分和問題

class PartOfSum
  attr_accessor :array, :cache
  def initialize(array)
    @array = array
    @cache = {}
  end

  # キャッシュなし
  def check_sumable?(w)
    _check_sumable?(array.size, w)
  end

  def _check_sumable?(i, w)
    return w == 0 if i == 0
    return _check_sumable?(i-1, w) || _check_sumable?(i-1, w-array[i-1])
  end

  # キャッシュあり
  def check_sumable_cache?(w)
    _check_sumable_cache?(array.size, w)
  end

  def _check_sumable_cache?(i, w)
    return w == 0 if i == 0

    cache["#{i-1}-#{w}"] = _check_sumable_cache?(i-1, w) if cache["#{i-1}-#{w}"].nil?
    cache["#{i-1}-#{w-array[i-1]}"] = _check_sumable_cache?(i-1, w-array[i-1]) if cache["#{i-1}-#{w-array[i-1]}"].nil?

    return cache["#{i-1}-#{w}"] || cache["#{i-1}-#{w-array[i-1]}"]
  end
end

array = Generator.random_array(1..20, 8)
part_of_sum = PartOfSum.new(array)
pp "配列：#{array}"
n = gets.to_i
pp part_of_sum.check_sumable?(n)

# メモ
# 現状の実装だとw-array[i-1]が負の値となるの分岐に入ったあとも、処理を継続してしまう
