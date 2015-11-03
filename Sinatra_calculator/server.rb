require 'sinatra'
require_relative './lib/calculator.rb'

get "/" do
  erb :home
end

post "/calculate_add" do
  first = params[:first_number].to_i
  second = params[:second_number].to_i

  @result = Calculator.new.add(first, second)

  erb :home
end

post "/calculate_substract" do
  first = params[:first_number].to_i
  second = params[:second_number].to_i

  @result = Calculator.new.substract(first, second)

  erb :home
end

post "/calculate_multiply" do
  first = params[:first_number].to_i
  second = params[:second_number].to_i

  @result = Calculator.new.multiply(first, second)

  erb :home
end

post "/calculate_divide" do
  first = params[:first_number].to_i
  second = params[:second_number].to_i

  @result = Calculator.new.divide(first, second)

  erb :home
end
