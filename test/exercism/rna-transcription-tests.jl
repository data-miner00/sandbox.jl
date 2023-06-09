using Test

include("../../src/exercism/rna-transcription.jl")

@testset "RNA Transcription" begin
    # empty rna sequence
    @test to_rna("") == ""

    # rna complement of cytosine is guanine
    @test to_rna("C") == "G"

    # rna complement of guanine is cytosine
    @test to_rna("G") == "C"

    # rna complement of thymine is adenine
    @test to_rna("T") == "A"

    # rna complement of adenine is uracil
    @test to_rna("A") == "U"

    # rna complement
    @test to_rna("ACGTGGTCTTAA") == "UGCACCAGAAUU"

    # dna correctly handles invalid input
    @test_throws ErrorException to_rna("U")

    # dna correctly handles completely invalid input
    @test_throws ErrorException to_rna("XXX")

    # dna correctly handles partially invalid input
    @test_throws ErrorException to_rna("ACGTXXXCTTAA")
end
