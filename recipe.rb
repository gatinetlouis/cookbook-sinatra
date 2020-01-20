class Recipe
  attr_reader :name, :description, :prep_time, :done, :difficulty

  def initialize(attributes = { done: false, difficulty: 'difficile' })
    @name = attributes[:name]
    @description = attributes[:description]
    @prep_time = attributes[:prep_time]
    @done = attributes[:done]
    @difficulty = attributes[:difficulty]
  end

  def make_as_done
    @done = true
  end
end
