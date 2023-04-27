using Test

include("../../src/exercism/pangram.jl")

@testset "Pangram" begin
    # empty sentence
    @test !ispangram("")

    # perfect lower case
    @test ispangram("abcdefghijklmnopqrstuvwxyz")

    # pangram with only lower case
    @test ispangram("the quick brown fox jumps over the lazy dog")

    # missing character 'x'
    @test !ispangram("a quick movement of the enemy will jeopardize five gunboats")

    # another missing character 'x'
    @test !ispangram("the quick brown fish jumps over the lazy dog")

    # missing character 'h'
    @test !ispangram("five boxing wizards jump quickly at it")

    # pangram with underscores
    @test ispangram("the_quick_brown_fox_jumps_over_the_lazy_dog")

    # pangram with numbers
    @test ispangram("the 1 quick brown fox jumps over the 2 lazy dogs")

    # missing letters replaced by numbers
    @test !ispangram("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog")

    # pangram with mixed case and punctuation
    @test ispangram("\"Five quacking Zephyrs jolt my wax bed.\"")

    # upper and lower case versions of the same character should not be counted separately
    @test !ispangram("the quick brown fox jumped over the lazy FOX")

    # a-m and A-M are 26 different letters but not a pangram
    @test !ispangram("abcdefghijklm ABCDEFGHIJKLM")

    # pangram with more than 26 letters (if case sensitive)
    @test ispangram("the 1 quick brown fox jumps Over the 2 lazy dogs")

    # An Arabic pangram is not an English pangram
    @test !ispangram("The scholar and poet Al Farāhīdi wrote this Arabic pangram: صِف خَلقَ خَودِ كَمِثلِ الشَمسِ إِذ بَزَغَت — يَحظى الضَجيعُ بِها نَجلاءَ مِعطارِ")
end
