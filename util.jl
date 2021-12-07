function getinput(day)
    open("inputs/$day.txt") do file
        read(file, String)
    end
end

int(s::AbstractString) = parse(Int, s)
int(x) = convert(Int, x)

spliton(pattern) = x -> split(x, pattern)

±(x, a) = [x + a, x - a]
