function count_nucleotides(strand)
    accepted_values = ['A', 'C', 'G', 'T']
    maps = Dict{Char, Int}('A' => 0, 'C' => 0, 'G' => 0, 'T' => 0)
    for char in strand
        if char ∉ accepted_values
            throw(DomainError("Invalid character"))
        end
        maps[char] = get(maps, char, 0) + 1
    end
    
    return maps
end
