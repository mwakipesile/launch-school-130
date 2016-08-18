class Sieve
  attr_reader :limit

  def initialize(limit)
    @limit = limit
  end

  def primes
    composites = {}

    (2...limit).each_with_object([]) do |num, prime_numbers|
      next if composites[num]
      prime_numbers << num

      (num..(limit/num).floor).each { |num2| composites[num * num2] = true }
    end
  end
end
