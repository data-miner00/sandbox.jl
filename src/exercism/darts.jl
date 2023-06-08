function score(x::Real, y::Real)
    radius = hypot(x, y)
    if radius ≤ 1 10
    elseif radius ≤ 5 5
    elseif radius ≤ 10 1
    else 0 end
end
