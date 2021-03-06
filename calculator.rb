# Simple calculator application.
# Avoid global and instance variables, classes.
# Future enhancement, handle decimals and error checking incorrect input

require 'pry' 

def equation_to_array(input_string)
  chars = input_string.split(//)
  eq_array = []
  count = 0

  # Iterate through each character from the input string, if an operator symbol is encountered, create a new object in the array. 
  # Handle cases with negative numbers.
  # Increase 'count' before setting object in 'eq_array' when object isn't empty, to avoid two operators in one object in the array.
  chars.each_with_index do |c,i|
    if /[-+*\/]/.match(c) != nil
      if eq_array[count] == nil
        eq_array[count] = c
        count += 1 if i != 0
      else
        count +=1
        eq_array[count] = c
      end
    else
      if eq_array[count] == nil
        eq_array[count] = c
      elsif chars[i-1] == "-" && /[-+*\/]/.match(chars[i-2]) != nil
        eq_array[count] += c
      elsif /[-+*\/]/.match(chars[i-1]) != nil
        count += 1
        eq_array[count] = c
      else
        eq_array[count] += c
      end
    end
  end

  eq_array
end

def print_result(result)
  puts "="
  puts "#{result}"
end


loop do
  
  puts "\n*******"
  puts "Please enter an operation to add, subtract, multiply or divide two integers."
  puts "Use the + - * / symbols to indicate the operation to perform."
  puts "Examples: 1+1, 4-2, 3*4, 6/4"
  puts "*******\n"

  input = gets.chomp
  input.delete!(" ")
  equation_array = equation_to_array(input)
  operation =  equation_array[1]
binding.pry
  case operation
  when "+"
    result = equation_array[0].to_i + equation_array[2].to_i
    print_result(result)
  when "-"
    result = equation_array[0].to_i - equation_array[2].to_i
    print_result(result)
  when "*"
    result = equation_array[0].to_i * equation_array[2].to_i
    print_result(result)
  when "/"
    if equation_array[2] == "0"
      puts "Cannot divide by zero!"
    else
      result_array = equation_array[0].to_f.divmod(equation_array[2].to_f)

      if result_array[1] == 0 
        fraction = ""
      else
        fraction = (result_array[1].to_f / equation_array[2].to_f).round(2).rationalize
      end

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