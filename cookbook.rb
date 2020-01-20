require 'csv'
require_relative 'recipe'

class Cookbook
  attr_reader :recipes
  def initialize(csv_path = nil)
    @csv_path = csv_path
    @recipes = []
    CSV.foreach(@csv_path) { |row| @recipes << Recipe.new(name: row[0], description: row[1], prep_time: row[2], done: row[3], difficulty: row[4]) } unless @csv_path.nil?
  end

  def all
    @recipes
  end

  def save_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    unless @csv_path.nil?
      CSV.open(@csv_path, 'wb', csv_options) do |csv|
        @recipes.each { |element| csv << [element.name, element.description, element.prep_time, element.done, element.difficulty] }
      end
    end
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    save_csv
  end

  def mark_as_done(recipe_index)
    @recipes[recipe_index].make_as_done
    save_csv
  end
end
