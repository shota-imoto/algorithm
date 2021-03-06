class Generator
  class << self
    def two_dimension_array(range = 1..100, length = 30)
      Array.new(length) do |_|
        [rand(range), rand(range)]
      end
    end

    def two_dimension_table(height, width, range = 1..100)
      Array.new(height) do |_|
        Array.new(width) { |_| rand(range) }
      end
    end

    def random_array(range = 1..100, length = 5)
      Array.new(length) { |_| rand(range)}
    end
  end

end
