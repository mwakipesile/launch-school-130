def count(arr)
  arr.inject(0) { |a, e| a += yield(e) ? 1 : 0 }
end