def each_cons(array, cons = 2)
  (0..array.size - cons).each { |idx| yield(*array.slice(idx, cons)) }
  nil
end
