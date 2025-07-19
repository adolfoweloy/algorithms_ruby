class Calculator227
  def calculate(s)
    return 0 if s.nil?

    operator = "+"
    result = 0
    last_num = 0
    num = 0

    s.each_char.with_index do |token, index|
        if token =~ /\d/
            num = num * 10 + token.to_i
        end

        if is_operator(token)  || index == s.length - 1
            puts "Processing: operator=#{operator}, num=#{num}, last_num=#{last_num}, result=#{result}"
            case operator
                when "+"
                  result += last_num
                  last_num = num
                when "-"
                  result += last_num
                  last_num = -num
                when "*"
                  last_num *= num
                when "/"
                  last_num = (last_num.abs / num) * (last_num < 0 ? -1 : 1)
                when " "
                  # No operation for spaces
            end

            operator = token
            num = 0
        end
    end

    result + last_num
  end

  def is_operator(token)
    ["+", "-", "*", "/"].include?(token)
  end
end
