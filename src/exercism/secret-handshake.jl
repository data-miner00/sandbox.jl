function is_intersect(instructions::Vector{Tuple{Int64, String}}, code::Int)
    filter(x -> code & x[1] > 0, instructions)
end

function arrange(actions::Vector{String})
    if "reverse" in actions
        actions = deleteat!(actions, length(actions))
        reverse(actions)
    else
        actions
    end
end

function secret_handshake(code::Int)
    instructions = [
        (1, "wink"),
        (2, "double blink"),
        (4, "close your eyes"),
        (8, "jump"),
        (16, "reverse"),
    ]

    arrange(map(x -> x[2], is_intersect(instructions, code)))
end
