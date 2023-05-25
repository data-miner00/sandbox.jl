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

# Author: datjet7410
# Link: https://exercism.org/tracks/julia/exercises/rotational-cipher/solutions/datjet7410
function rotate_v1(shift::Int, input::Char)
    if input in 'a':'z'
        (input - 'a' + shift) % 26 + 'a'
    elseif input in 'A':'Z'
        (input - 'A' + shift) % 26 + 'A'
    else
        input
    end
end

function rotate_v1(shift::Int, input::AbstractString)
    map(input) do char
        rotate_v1(shift, char)
    end

    # map(char -> rotate(shift, char), input)
end

for i = 0:26
    @eval begin
        macro $(Symbol("R$(i)_str"))(input)
            rotate_v1($1, input)
        end
    end
end

# Author: tS7hKamAYL84j91
# Link: https://exercism.org/tracks/julia/exercises/rotational-cipher/solutions/tS7hKamAYL84j91
function rotate_v2(shift::Int, input::Char)
    base = islowercase(input) ? 'a' : 'A'
    isletter(input) ? mod(input - base + shift, 26) + base : input
end

rotate_v2(shift::Int, input::String) =
    input |> collect |> xs->map(char -> rotate(shift, char), xs) |> join

for shift in 0:26
    macro_name = Symbol("R" * string(shift) * "_str")
    eval(quote(macro $macro_name(p) rotate($shift, p) end) end)
end

# Author: scer
# Link: https://exercism.org/tracks/julia/exercises/rotational-cipher/solutions/scer
function rotate_char(shift::Integer, input::Char)
    input ∉ 'a':'z' && input ∉ 'A':'Z' && return input

    initial = input ∈ 'A':'Z' ? 'A' : 'a'
    ((input - initial + shift) % 26) + initial
end

rotate_char(shift::Integer, char::Char) = rotate_char(shift, char)

function rotate_v3(shift::Integer, input::AbstractString)
    map(char -> rotate_char(shift, char), input)
end


# Author: rwclutterbuck
# Link: https://exercism.org/tracks/julia/exercises/rotational-cipher/solutions/rwclutterbuck
@inline function rotate_v4(shift::Integer, code::UInt8)
    a, A, z, Z = UInt8.(('a', 'A', 'z', 'Z'))
    lowest_char = A + 0x20*(a <= code <= z)
    char_shift = lowest_char + (code - lowest_char + shift) % 0x1a
    isletter = (a <= code <= z) | (A <= code <= Z)
    isletter * char_shift + !isletter * code
end

function rotate_v4(shift::Int, code::Char)
    c_int = transcode(UInt8, string(code))
    shift = UInt8(mod(shift, 26))
    Char(transcode(UInt32, rotate_v4.(shift, c_int))...)
end

function rotate_v4(shift::Int, code::String)
    c_int = transcode(UInt8, code)
    shift = UInt8(mod(shift, 26))
    transcode(String, rotate_v4.(shift, c_int))
end

for i = 0:26
    macro_name = Symbol("R", string(i), "_str")
    @eval macro $(macro_name)(code)
        rotate_v4($i, code)
    end
end
