local cn_weekday_names = {
    "星期日",
    "星期一",
    "星期二",
    "星期三",
    "星期四",
    "星期五",
    "星期六",
}
local en_weekday_names = {
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
}
local en_weekday_abbr_names = {
    "Sun.",
    "Mon.",
    "Tues.",
    "Wed.",
    "Thur.",
    "Fri.",
    "Sat.",
}

local function translator(input, seg)
    if (input == "week" or input == "xingqiji") then
        local day_w = tonumber(os.date("%w")) + 1
        local day_w1 = cn_weekday_names[day_w]
        local day_w2 = en_weekday_abbr_names[day_w]
        local day_w3 = en_weekday_names[day_w]

        yield(Candidate("date", seg.start, seg._end, day_w1, " "))
        yield(Candidate("date", seg.start, seg._end, day_w2, " "))
        yield(Candidate("date", seg.start, seg._end, day_w3, " "))
    end
end
return translator
