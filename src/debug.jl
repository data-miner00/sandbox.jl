"""
The `@show` is a macro that enables debugging by printing out
the values that it is being passed to the standard output
and returning the value if to the caller.
"""

function add(a, b)
    @show a b
    return (@show a+b)
end

add(6, 20)

안녕하세요 = "Hello"
@show 안녕하세요
