dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
def substrings(string, dictionary)
    substrings = {}
    string_array = string.split(" ")
    for j in 0...string_array.length do
        for i in 0...dictionary.length do
            if (string_array[j].downcase.include?(dictionary[i].downcase))
                if (substrings.has_key?("#{dictionary[i]}"))
                    substrings["#{dictionary[i]}"] += 1
                else
                    substrings["#{dictionary[i]}"] = 1
                end
            end
        end  
    end
    
    return substrings
end

p substrings("Howdy partner, sit down! How's it going?",dictionary)