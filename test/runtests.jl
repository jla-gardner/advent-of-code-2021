using Test, AOC21

function run_tests(file, day)
    include(file) # imports the part_1_tests and part_2_tests into current scope

    code = getproperty(AOC21, Symbol("Day$day"))

    @testset "Day $day" begin
        @testset "part1" begin
            _run_tests(code.part1, part_1_tests)
        end
        @testset "part2" begin
            _run_tests(code.part2, part_2_tests)
        end
    end
end

function _run_tests(func, tests)
    for (inp, out) in tests
        @test func(inp) == out
    end
end

days = lpad.(1:25, 2, "0")
paths = joinpath.(@__DIR__, "day" .* days .* ".jl")
idxs = map(isfile, paths)

for (path, day) in zip(paths[idxs], days[idxs])
    run_tests(path, day)
end
