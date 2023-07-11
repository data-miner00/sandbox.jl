function foo(x::Int64, y::AbstractString)
    print("$x, $y")
end

function foo(x::AbstractString, y::Float64)
    print("Weird $x, $y")
end

function foo(x::Array{Int})
    for i in x
        print(i)
    end
end

# Get all overloads of a method
methods(foo)

# Get which overloads used for the invocation
@which foo([1, 2, 3])
