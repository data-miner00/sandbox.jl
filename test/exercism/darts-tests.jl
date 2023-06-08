using Test

include("../../src/exercism/darts.jl")

@testset "Darts" begin

    # Missed target
    @test score(-9, 9) == 0

    # On the outer circle
    @test score(0, 10) == 1

    # On the middle circle
    @test score(-5, 0) == 5

    # On the inner circle
    @test score(0, -1) == 10

    # Exactly on centre
    @test score(0, 0) == 10

    # Near the centre
    @test score(-0.1, -0.1) == 10

    # Just within the inner circle
    @test score(0.7, 0.7) == 10

    # Just outside the inner circle
    @test score(0.8, -0.8) == 5

    # Just within the middle circle
    @test score(-3.5, 3.5) == 5

    # Just outside the middle circle
    @test score(-3.6, -3.6) == 1

    # Just within the outer circle
    @test score(-7.0, 7.0) == 1

    # Just outside the outer circle
    @test score(7.1, -7.1) == 0

    # Asymmetric position between the inner and middle circles
    @test score(0.5, -4) == 5
end