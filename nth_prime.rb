class Prime
  @primes = [2, 3]

  def self.nth(number)
    raise ArgumentError if number < 1
    nth_prime_index = number - 1
    current_odd_num = @primes.last

    until @primes[nth_prime_index]
      current_odd_num += 2
      @primes << current_odd_num if next_prime?(current_odd_num)
    end

    @primes[nth_prime_index]
  end

  def self.next_prime?(number)
    max_factor = number**0.5

    @primes.each do |prime|
      return true if prime > max_factor
      return false if number % prime == 0
    end
  end
end
