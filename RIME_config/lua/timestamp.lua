local function translator(input, seg)
    if (input == "timestamp" or input == "shijianchuo") then
        yield(Candidate("time", seg.start, seg._end, os.time(), " "))
    end
end
return translator
