module AOC21

include("util.jl")

days = "day" .* lpad.(1:25, 2, "0") .* ".jl"
paths = filter(isfile, joinpath.(@__DIR__, days))

foreach(include, paths)

end # module