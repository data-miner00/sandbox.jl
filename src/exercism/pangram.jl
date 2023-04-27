"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input::String)
    length(filter(isletter, Set(collect(lowercase(input))))) == 26
end
