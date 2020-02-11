# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  return arr.sum
end

def max_2_sum arr
  return arr.sort.last(2).sum
end

def sum_to_n? arr, n
  
  b = arr.clone
  
  if arr.length > 1
    for element in arr
      for i in b
        if i + element == n and i != element
          return true
        end
      end
    end
    return false
  else
    return false
  end
end

# Part 2

def hello(name)
  return "Hello, " + name
end

def starts_with_consonant? s
  consonants = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'y', 'z',
                'B', 'C', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'Y', 'Z']

  return consonants.include? s[0]

end

def binary_multiple_of_4? s
  
  if s.length == 0
    return false
  end 
  arr = ['a', 'e', 'i', 'o', 'u', 'b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'y', 'z']
  
  for char in arr
    if s.include? char
      return false
    end
  end
  
  integer = s.to_i(2)
  return integer % 4 == 0

end

# Part 3

class BookInStock
  
  def initialize(isbn, price)  
    raise ArgumentError.new("isbn must be of length greater than 0") if isbn.length == 0
    raise ArgumentError.new("price must be greater than zero") if price <= 0
    
    @isbn = isbn
    @price = price 
  end
  
  def price_as_string
    f = '%.2f' % @price.to_f
    return "$" + f.to_s 
  end
  
  def isbn
    @isbn
  end
  
  def price
    @price
  end
  
  def isbn=(isbn)
    @isbn = isbn
  end
  
  def price=(price)
    @price = price
  end
  
end
