include("util.jl");

##

test = """fs-end
he-DX
fs-he
start-DX
pj-DX
end-zg
zg-sl
zg-pj
pj-he
RW-he
fs-DX
pj-RW
zg-RW
start-pj
he-WI
zg-he
pj-fs
start-RW"""

# inp = 12 |> getinput |> spliton("\n")
inp = test |> spliton("\n")
small = cave -> lowercase(cave) == cave

##

connections = Dict("_" => Set())
function add_edge(a, b)
    if a ∉ keys(connections)
        connections[a] = Set()
    end
    push!(connections[a], b)
end

for (a, b) in split.(inp, "-")
    add_edge(a, b)
    add_edge(b, a)
end

##

paths = [[["start"]]]
for i = 1:length(inp)
    next_gen = []
    for most_recent in paths[end]
        visited_smalls = filter(small, most_recent)
        current = most_recent[end]

        if current == "end"
            continue
        end
        for cave in connections[current]
            if cave ∈ visited_smalls
                continue
            end
            push!(next_gen, push!(copy(most_recent), cave))
        end
    end
    push!(paths, next_gen)
end

all_paths_from_start = vcat(paths...)
all_paths = filter(p -> p[end] == "end", all_paths_from_start)

length(all_paths)

##

contains_duplicates(x) = length(unique(x)) < length(x)

paths = [[["start"]]]
for i = 1:100
    next_gen = []
    for most_recent in paths[end]
        visited_smalls = filter(small, most_recent)
        current = most_recent[end]

        if current == "end"
            continue
        end
        for cave in connections[current]
            if (cave ∈ visited_smalls && contains_duplicates(visited_smalls)) || cave == "start"
                continue
            end
            push!(next_gen, push!(copy(most_recent), cave))
        end
    end
    push!(paths, next_gen)
end

all_paths_from_start = vcat(paths...)
all_paths = filter(p -> p[end] == "end", all_paths_from_start)

length(all_paths)