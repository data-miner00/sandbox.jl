# "Square the sum of the first `n` positive integers"
# function square_of_sum(n::Integer)
#     Int((n/2 * (1 + n)) ^ 2)
# end

# "Sum the squares of the first `n` positive integers"
# function sum_of_squares(n::Integer)
#     Int(n/6 * (n + 1) * (2*n + 1))
# end

function square_of_sum(n::Integer)
    reduce(+, range(1, n)) ^ 2
end

function sum_of_squares(n::Integer)
    reduce(+, map(x -> x^2, range(1, n)))
end

"Subtract the sum of squares from square of the sum of the first `n` positive ints"
function difference(n::Integer)
    square_of_sum(n) - sum_of_squares(n)
end
