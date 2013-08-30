def hello_world
  "Hello, World!"
end


class Array

  def my_uniq
    results = []
    self.each do |el|
      results << el unless results.include?(el)
    end
    results
  end

  def sum_two
    result = []
    self.each_with_index do |el1, i|
      self.each_with_index do |el2, j|
        next if i >= j
        result << [i, j] if el1 + el2 == 0
      end
    end
    result
  end

end