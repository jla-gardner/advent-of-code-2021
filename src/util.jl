import Base

function getinput(day)
    open("inputs/$day.txt") do file
        read(file, String)
    end
end

int(s::AbstractString) = parse(Int, s)
int(x::Number) = convert(Int, x)

spliton(pattern) = x -> split(x, pattern)

±(x, a) = [x + a, x - a]

Base.replace(old_new::Pair...) = x -> replace(x, old_new...)
Base.sort(s::AbstractString) = s |> collect |> sort |> join

struct DefaultDict
    _dict
    _fn
end

defaultdict(fn) = DefaultDict(Dict(), fn)

function Base.getindex(d::DefaultDict, key)
    if key ∉ keys(d._dict)
        d._dict[key] = d._fn()
    end
    return d._dict[key]
end

function Base.setindex!(d::DefaultDict, key, value)
    d._dict[key] = value
end
