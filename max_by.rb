def max_by(array)
  return nil if array.empty?
  max = [array.first, yield(array.first)]

  array.each do |e|
    result = yield(e)
    max = [e, result] if result > max.last
  end

  max.first
end
