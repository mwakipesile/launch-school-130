class Palindrome
  attr_reader :value, :min_factor, :max_factor

  def initialize(value, min_factor, max_factor)
    @value = value
    @min_factor = min_factor
    @max_factor = max_factor
  end

  def factors
    lower_limit = (value.to_f / max_factor).ceil
    lower_limit = min_factor if lower_limit < min_factor
    upper_limit = value / min_factor
    upper_limit = max_factor if upper_limit > max_factor
    factors = []

    while upper_limit > lower_limit
      if value % lower_limit == 0
        factors << [lower_limit, value / lower_limit]
        upper_limit = value / lower_limit
      end
      lower_limit += 1
    end

    factors
  end
end
