function rotate(shift::Integer, input::Union{AbstractString, Char})
    if isa(input, Char)
        if isuppercase(input)
            return Char((Int(input) - 65 + shift) % 26 + 65)
        else
            return Char((Int(input) - 97 + shift) % 26 + 97)
        end
    else
        output = ""

        for char in input
            ascii = Int(char)
            if isuppercase(char)
                ascii = (ascii - 65 + shift) % 26 + 65
            elseif isletter(char)
                ascii = (ascii - 97 + shift) % 26 + 97
            end
            output *= Char(ascii)
        end

        return output
    end
end
