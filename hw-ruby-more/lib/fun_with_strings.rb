module FunWithStrings
  
  def palindrome?
    string = self.gsub(/\W/, '').upcase
    string = string.downcase
    string == string.reverse
    
  end
  
  def count_words
    
    word_array = self.split(" ")
    hash_map = Hash.new(0)
    
    for word in word_array
      hash_map[word] = word.length
    end
    
    hash_map
    
  end
  def anagram_groups
    # your code here
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end

