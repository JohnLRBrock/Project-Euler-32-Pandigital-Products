# concats the multiplicand, multiplier, and product
def concat_quotient(a, b)
  a.to_s + b.to_s + (a * b).to_s
end

# returns true if the product a * b = c is 1-n pandigital
# int, int, int -> boolean
def pandigital?(a, b, n)
  # concat the multiplicand, multiplier, and product
  equation = concat_quotient(a, b)
  # if there are 9 characters in the equation
  # and each number from 1 to 9 are in the equation
  # then the equation must be 1 to 9 pandigital 
  return false unless equation.length == 9
  numbers = ['1','2','3','4','5','6','7','8','9']
  numbers.each do |number|
    return false unless equation.include?(number)
  end
  true
end

def products(target)
  sum = 0
  i = 2
  j = i + 1
  products = Hash.new()
  while concat_quotient(i, j).length <= target
    while concat_quotient(i, j).length <= target
      unless products[i * j]
        puts "i:#{i} J:#{j}"
        if pandigital?(i, j, target)
          sum += i * j 
          products[i * j] = true
        end
      end
      j += 1
    end
    j = i + 1
    i += 1
  end
  sum
end

puts products(9)