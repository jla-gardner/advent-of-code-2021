using Test, AOC21

days = lpad.(1:25, 2, "0") 
paths = joinpath.(@__DIR__, "day" .* days .* ".jl")

@show get_parts("01")

function get_parts(day)
    submodule = getproperty(AOC21, Symbol("Day$day"))
    return getproperty.(submodule, [:part1, :part2])
end

function run_tests(file, day)
    include(file)

    part1, part2 = get_parts(day)

    @test_set "Day $day" begin
        @test_set "part1" begin
            _run_tests(part1, part_1_tests)
        end
        @test_set "part2" begin
            _run_tests(part2, part_2_tests)
        end
    end
end


end # module