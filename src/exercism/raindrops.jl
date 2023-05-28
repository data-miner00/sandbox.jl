
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
