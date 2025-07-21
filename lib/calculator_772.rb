# https://leetcode.com/problems/basic-calculator-iii/
class Calculator772
  def calculate(s)
    return 0 if s.nil? || s.empty?

    stack = []
    current_number = 0
    last_operator = '+'
    expr = "#{s}@"

    expr.each_char do |token|
      next if token == ' '

      if token.match(/\d/)
        current_number = current_number * 10 + token.to_i
      elsif token == '('
        stack << last_operator
        last_operator = '+'
      else
        case last_operator
          when '+'
            stack << current_number
          when '-'
            stack << -current_number
          when '*'
            stack << stack.pop * current_number
          when '/'
            last_num = stack.pop
            stack << (last_num.abs / current_number.abs) * (last_num * current_number < 0 ? -1 : 1)
        end
        current_number = 0
        last_operator = token

        if token == ')'
          while !stack.empty? && stack.last.is_a?(Integer)
            current_number += stack.pop
          end
          last_operator = stack.pop
        end
      end
    end

    stack.sum
  end
end
