module Day01

include("util.jl")

function _count_ascending(arr)
    (d′ > d for (d, d′) in zip(arr, arr[2:end])) |> sum
end

"""
inp is a string of ints seperated by new lines
"""
function preprocess(inp)
    inp |> split .|> int
end

part1 = _count_ascending ∘ preprocess

function part2(inp)
    depths = preprocess(inp)
    sums3 = ((depths[i:i+2]) for i ∈ 1:(length(depths)-2)) .|> sum
    _count_ascending(sums3)
end

end # module