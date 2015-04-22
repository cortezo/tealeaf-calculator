# Simple calculator application.
# Avoid global and instance variables, classes.
# Future enhancement, handle decimals.

require 'pry' 

def split_equation(input_string)
  input_string.split(/\W/)
end

def perform_operation(operation)
end

def print_result(result)
  puts "=\n#{result}"
end

loop do
  
  puts "\n\n*******\nPlease enter an operation to add, subtract, multiply or divide two numbers.\
    \nUse the + - * / symbols to indicate the operation to perform.\
    \nExamples: 1+1, 4-2, 3*4, 6/4\
    \n*******\n"


  input = gets.chomp
  equation = input.delete(" ")

  case equation
  when /\d[+]\d/
    numbers = split_equation(equation)
    result = numbers[0].to_i + numbers[1].to_i
    print_result(result)
  when /\d[-]\d/
    numbers = split_equation(equation)
    result = numbers[0].to_i - numbers[1].to_i
    print_result(result)
  when /\d[*]\d/
    numbers = split_equation(equation)
    result = numbers[0].to_i * numbers[1].to_i
    print_result(result)
  when /\d[\/]\d/
    numbers = split_equation(equation)
    if numbers[1] == "0"
      puts "Cannot divide by zero!"
    else
      binding.pry
      result_array = numbers[0].to_f.divmod(numbers[1].to_i)
      fraction = (result_array[1].to_f / numbers[1].to_f).round(2).rationalize
      fraction = "" if result_array[1] == 0
      result = "#{result_array[0]} #{fraction}"
      print_result(result)
    end
  else
    puts "Please enter a valid mathmatical operation without decimals.  Examples for format:  1+1, 2-2, 3*3, 4*4"
  end

  puts "\nWould you like to continue?  Please enter 'Y' to continue."
  continue = gets.chomp
  if continue != 'Y'
    break
  end

end