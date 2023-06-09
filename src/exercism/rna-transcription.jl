function to_rna(dna::AbstractString)
    d = Dict('G'=>'C', 'C'=>'G', 'T'=>'A', 'A'=>'U')
    map(x -> begin
        if !haskey(d, x) throw(ErrorException("Invalid key"))
        else d[x] end end, dna)
end