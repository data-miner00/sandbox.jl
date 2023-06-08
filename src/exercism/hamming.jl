function distance(a::AbstractString, b::AbstractString)
    if length(a) ≠ length(b) throw(ArgumentError("invalid length")) end
    if length(a) == 0 0
    else mapreduce((x, y) -> x ≠ y ? 1 : 0, +, a, b) end
end
