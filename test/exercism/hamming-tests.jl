using Test

include("../../src/exercism/hamming.jl")

@testset "Hamming Distance" begin

    # identical strands
    @test distance("A", "A") == 0

    @test distance("GGACTGA", "GGACTGA") == 0

    # complete distance
    @test distance("A", "G") == 1

    @test distance("AG", "CT") == 2

    # small distance
    @test distance("AT", "CT") == 1

    @test distance("GGACG", "GGTCG") == 1

    @test distance("ACCAGGG", "ACTATGG") == 2

    # non-unique characters
    @test distance("AGA", "AGG") == 1

    @test distance("AGG", "AGA") == 1
    
    # same nucleotides in different positions
    @test distance("TAG", "GAT") == 2

    # large distance
    @test distance("GATACA", "GCATAA") == 4

    @test distance("GGACGGATTCTG", "AGGACGGATTCT") == 9

    # empty strands
    @test distance("", "") == 0

    # different strand lengths
    @test_throws ArgumentError distance("AATG", "AAA")

    @test_throws ArgumentError distance("ATA", "AGTG")

    @test_throws ArgumentError distance("", "G")

    @test_throws ArgumentError distance("G", "")

end
