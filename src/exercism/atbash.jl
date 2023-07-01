function encode(input::AbstractString)
    filtered = filter(x -> x ∈ 'a':'z' || x ∈ 'A':'Z' || x ∈ '0':'9', lowercase(input))
    dict = Dict(vcat('a':'z') .=> reverse(vcat('a':'z')))
    map(x -> x ∉ '0':'9' ? dict[x] : x, filtered) |> chunk
end

function decode(input::AbstractString)
    filtered = join(split(input, " "), "")
    dict = Dict(reverse(vcat('a':'z')) .=> vcat('a':'z'))
    map(x -> x ∉ '0':'9' ? dict[x] : x, filtered)
end

function chunk(input::AbstractString)
    size = 5
    join([input[i:(i+size-1 > length(input) ? length(input) : i+size-1)] for i in range(1, length(input); step=size)], " ")
end

module SecondTry
    function encode(input::AbstractString)
        filtered = filter(x -> isletter(x) || isdigit(x), input |> lowercase)
        mapped = map(corresponsing_chars, filtered)
        chunked = map(join, Iterators.partition(mapped, 5))
        join(chunked, " ")
    end

    function decode(input::AbstractString)
        unspaced = filter(x -> !isspace(x), input)
        map(corresponsing_chars, unspaced)
    end

    function corresponsing_chars(input::AbstractChar)
        isletter(input) ? 'z' - (input - 'a') : input
    end
end
