# @param {Integer} n
# @return {String}
def convert_to_title(n)
  return '' if(n == 0)
  return int_to_character(n) if(n <= 26)
  
  number = n % 26
  number = 26 if(number == 0)
  n = (n - number) / 26
  convert_to_title(n) + int_to_character(number)
end

# number <= 26
def int_to_character(number)
  number += ('A'.ord - 1)
  number.chr
end
