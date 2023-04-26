using Test

include("../../src/exercism/nucleotide-count.jl")

@testset "Nucleotide Count" begin
    # empty strand
    @test count_nucleotides("") == Dict('A' => 0, 'C' => 0, 'G' => 0, 'T' => 0)
    
    # strand with one nucleotide in single-character input
    @test count_nucleotides("G") == Dict('A' => 0, 'C' => 0, 'G' => 1, 'T' => 0)

    # strand with repeated nucleotide
    @test count_nucleotides("GGGGGGG") == Dict('A' => 0, 'C' => 0, 'G' => 7, 'T' => 0)

    # strand with multiple nucleotides
    @test count_nucleotides("AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC") == Dict('A' => 20, 'C' => 12, 'G' => 17, 'T' => 21)

    # strand with invalid nucleotides
    @test_throws DomainError count_nucleotides("AGXXACT")
end
