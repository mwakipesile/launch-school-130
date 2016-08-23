def divisors(number)
  return [number] if number == 1
  interval = number.even? ? 1 : 2

  (1..(number**0.5).floor).step(interval).with_object([]) do |n, divs|
    divs.concat([n, number/n]) if number % n == 0
  end.sort
end

t = Time.now
p divisors(999962000356)
p Time.now - t