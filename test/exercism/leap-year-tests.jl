using Test

include("../../src/exercism/leap-year.jl")

@testset "Leap Year" begin
    # Year not divisible by 4: common year
    @test !is_leap_year(2015)

    # Year divisible by 2, not divisible by 4: common year
    @test !is_leap_year(1970)

    # Year divisible by 4, not divisible by 100: leap year
    @test is_leap_year(1996)
    
    # Year divisible by 4 and 5: leap year
    @test is_leap_year(1960)

    # Year divisible by 4, not divisible by 100: leap year
    @test is_leap_year(2016)

    # Year divisible by 100, not divisible by 400: common year
    @test !is_leap_year(2100)

    # Year divisible by 100 but not by 3: common year
    @test !is_leap_year(1900)
    
    # Year divisible by 400: leap year
    @test is_leap_year(2000)
    
    # Year divisible by 400 but not by 125: leap year
    @test is_leap_year(2400)
    
    # Year divisible by 200, not divisible by 400: common year
    @test !is_leap_year(1800)
end
