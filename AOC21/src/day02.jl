module Day02

include("util.jl")

dirs = Dict(
    "forward" => [1, 0],
    "down" => [0, 1],
    "up" => [0, -1]
)

function parse_row(row)
    dir, mag = split(row)
    return dirs[dir] * int(mag)
end

function part1(inp)
    commands = inp |> spliton("\n") .|> parse_row
    position = sum(commands)
    *(position...)
end

function part2(inp)
    pos = [0, 0]
    aim = 0

    for row in split(inp, "\n")
        command, mag = split(row)
        if command == "forward"
            pos += [1, aim] * int(mag)
        else
            aim += (command == "down" ? 1 : -1) * int(mag)
        end
    end

    *(pos...)
end

end # module
