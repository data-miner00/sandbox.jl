
function raindrops(number::Int)
    div3 = number % 3 == 0
    div5 = number % 5 == 0
    div7 = number % 7 == 0

    if !div3 && !div5 && !div7
        string(number)
    else
        (div3 ? "Pling" : "") * (div5 ? "Plang" : "") * (div7 ? "Plong" : "")
    end
end


# Author: taigua
# Link: https://exercism.org/tracks/julia/exercises/raindrops/solutions/taigua
function raindrops_v2(number::Int)
    rs = [(3, "Pling"), (5, "Plang"), (7, "Plong")]
    s = map(x -> x[2], filter(x -> number % x[1] == 0, rs)) |> join
    length(s) == 0 ? string(number) : s
end


# Author: justinluther502
# Link:
function raindrops_v3(number::Real)
    factors = [number % 3 == 0, number % 5 == 0, number % 7 == 0]
    any(factors) ? string(("Pling", "Plang", "Plong")[factors]...) : string(n)
end
