class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 1

    sum = (1..number / 2).select { |factor| number % factor == 0 }.inject(:+)

    return 'deficient' if sum < number
    return 'abundant' if sum > number
    'perfect'
  end
end
