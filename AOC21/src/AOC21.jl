module AOC21

days = "day" .* lpad.(1:25, 2, "0") .* ".jl"
paths = filter(isfile, joinpath.(@__DIR__, days))

foreach(include, paths)

end # module