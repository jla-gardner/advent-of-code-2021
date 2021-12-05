function getinput(day)
    open("inputs/$day.txt") do file
        read(file, String)
    end
end

int(s) = parse(Int, s)