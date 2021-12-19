include("util.jl")
coords, instructions = 13 |> getinput |> spliton("\n\n")
coords = coords |> spliton("\n") .|> x -> int.(split(x, ",")) .+ 1;
##
fold_on = 656
transform = (x, y) -> [min(x, 2fold_on - x), y]
marks = zeros(Int, 1310, 1310)
for (c) in coords
    x, y = transform(c...)
    marks[x, y] = 1
end
marks |> sum
##

function fold_x(on)
    return function (c)
        x, y = c
        return [min(x, 2on - x), y]
    end
end
function fold_y(on)
    return function (c)
        x, y = c
        return [x, min(y, 2on - y)]
    end
end

transforms = []
for i in split(instructions, "\n")
    fold, amount = split(i, "=")
    if occursin("x", fold)
        push!(transforms, fold_x(int(amount) + 1))
    else
        push!(transforms, fold_y(int(amount) + 1))
    end
end

final_transform = ∘(reverse(transforms)...)
##
mask = zeros(Int, 40, 6)
for c in coords
    x, y = final_transform(c)
    mask[x, y] = 1
end

vals = map(val -> val == 1 ? "█" : " ", mask')
for r in eachrow(vals)
    println(join(r, ""))
end
