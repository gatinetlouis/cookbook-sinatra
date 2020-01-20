require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require_relative 'recipe'
require_relative 'cookbook'
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get '/' do
  @cookbook = Cookbook.new('recipes.csv')
  erb :index
end

get '/new' do
  erb :new
end

get '/about' do
  erb :about
end

get '/recipes/:index' do
  recipes = @cookbook.all
  @i = params[:index].to_i - 1
  erb :recipes
end
