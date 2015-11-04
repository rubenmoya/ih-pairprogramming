require 'sinatra'
require 'sinatra/reload'
require_relative './lib/calculator.rb'

get "/" do
  erb :home
end

post "/" do
  first = params[:first_number].to_i
  second = params[:second_number].to_i
  operation = params[:operation]


  if operation == "add"
    @result = Calculator.new.add(first, second)
    @print_result = "#{first} + #{second} = #{@result}"
  elsif operation == "substract"
    @result = Calculator.new.substract(first, second)
    @print_result = "#{first} - #{second} = #{@result}"
  elsif operation == "multiply"
    @result = Calculator.new.multiply(first, second)
    @print_result = "#{first} x #{second} = #{@result}"
  elsif operation == "divide"
    @result = Calculator.new.divide(first, second)
    @print_result = "#{first} / #{second} = #{@result}"
  end

  if params[:save_file]
    IO.write("./public/result.txt", params[:save_file])
    @next_num = IO.read("./public/result.txt")
  end


  erb :home
end
