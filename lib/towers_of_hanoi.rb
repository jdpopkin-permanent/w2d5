class TowersOfHanoi

  attr_reader :towers

  def initialize(size)
    @tower_one = (1..size).to_a.reverse
    @tower_two = []
    @tower_three = []
    @towers = [@tower_one, @tower_two, @tower_three]
  end

  def render
    result = ''
    @towers.each_with_index do |tower, i|
      result += "Tower #{i+1}: #{tower}\n"
    end
    result
  end

  def move(start_index, end_index)
    # check if destination too big
    raise IOError.new("Invalid Move") if start_index < 1 || end_index < 1
    start_tower = towers[start_index - 1]
    end_tower = towers[end_index - 1]
    if start_tower.empty?
      raise IOError.new("Invalid move")
    elsif !end_tower.empty? && start_tower.last > end_tower.last
      raise IOError.new("Invalid move")
    end

    end_tower.push(start_tower.pop)
    self
  end

  def get_move
    puts "Choose a start and end tower separated by commas."
    input = gets.chomp.split(",")
    move(input[0].to_i, input[1].to_i)

  rescue StandardError => e
    puts e
    retry
  end

  def play
    until won?
      puts self.render
      get_move
    end
    puts "You won!"
  end

  def won?
    return false unless @towers[0].empty?
    towers[1].empty? || towers[2].empty?
  end

end