hash1 = {title: "mr cat", age: 33, long_word: "smile"}

hash2 = {title: "sandy", age: 2, long_word: "hakakaka"}

def compare(hash1, hash2)
    res = []
    
   hash1.each do |k,v|
      unless k == :title 
            
            
                if v.class == String
                    if hash1[k].size > hash2[k].size
                      p "hash 1 longer"
                      res << hash1[k]
                    elsif hash1[k].size < hash2[k].size
                        p  "hash 2 longer"
                        res << hash2[k]
                    else
                        p "are same size"
                    end
                else
                    if hash1[k] > hash2[k]
                      p "hash 1 bigger"
                      res << hash1[k]
                    elsif hash1[k] < hash2[k]
                        p  "hash 2 bigger"
                        res << hash2[k]
                    else
                        p "are same size"
                    end
                end
                
        end
   end
   
   return res
end