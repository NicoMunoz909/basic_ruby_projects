def caesar_cipher (string, shift)
    encrypted_string = ""
    for i in 0...string.length do
        char_code = string[i].ord
        code_base = char_code >= 97? 97:65
        if((char_code>=65 && char_code<=97) || (char_code >=97 && char_code<=122))
            encrypted_string += (((char_code + shift - code_base) % 26) +code_base).chr
        else
            encrypted_string += string[i]
        end
    end
    return encrypted_string
end

string = "What a string!"
puts caesar_cipher(string,5)