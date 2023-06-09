function encode(s::AbstractString)
    encoded = reduce(f, s; init=[])
    join([ (pair[2] > 1 ? string(pair[2]) : "") * pair[1] for pair in encoded])
end

f(acc, x) = 
    isempty(acc) || last(acc)[1] != x ?
        push!(acc, [x, 1]) :
        (last(acc)[2] += 1; acc)

function decode(s::AbstractString)
    pairs = reduce(g, s, init=[])
    map(pair -> repeat(pair[2], parse(Int, pair[1])), pairs) |> join
end

# Very ugly but I've tried
# Takes me 2 days: Bad and fragile
g(acc, x) = begin
    if length(acc) == 0 && isnumeric(x)
        push!(acc, Any[x])
    elseif length(acc) == 0
        push!(acc, Any['1', x])
    elseif length(last(acc)) == 1 && isnumeric(x)
        char = last(acc)[1]
        last(acc)[1] = char * x
    elseif length(last(acc)) == 1
        push!(last(acc), x)
    elseif length(last(acc)) == 2 && isnumeric(x)
        push!(acc, Any[x])
    elseif length(last(acc)) == 2 && x ≠ last(acc)[2]
        push!(acc, Any['1', x])
    end

    acc
end
