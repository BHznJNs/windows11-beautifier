local en_monthes_abbr_table = {
    "Jan.",
    "Feb.",
    "Mar.",
    "Apr.",
    "May.",
    "Jun.",
    "Jul.",
    "Aug.",
    "Sept.",
    "Oct.",
    "Nov.",
    "Dec.",
}

local en_monthes_table = {
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
}

local function translator(input, seg)
    if (input == "date" or input == "riqi") then
        local date_y = os.date("%Y") --取年
        local date_m = os.date("%m") --取月
        local date_d = os.date("%d") --取日

        local result_date_1 = os.date("%Y年%m月%d日")
        local result_date_2 = os.date("%m月%d日")
        local result_date_3 = os.date("%Y/%m/%d")
        local result_date_4 = os.date("%Y-%m-%d")
        yield(Candidate("date", seg.start, seg._end, result_date_1, " "))
        yield(Candidate("date", seg.start, seg._end, result_date_2, " "))
        yield(Candidate("date", seg.start, seg._end, result_date_3, " "))
        yield(Candidate("date", seg.start, seg._end, result_date_4, " "))

        --- --- --- --- --- ---

        local date_m1=en_monthes_abbr_table[tonumber(date_m)]
        local date_m2=en_monthes_table[tonumber(date_m)]
        local symbol = ""
        
        if date_d=="0" then 
            symbol="st" 
        elseif date_d=="1" then
            symbol="nd" 
        elseif date_d=="2" then
            symbol="rd" 
        else
            symbol="th"
        end
        local result_date_5=date_m1.." "..date_d..symbol..", "..date_y
        local result_date_6=date_m2.." "..date_d..symbol..", "..date_y
        yield(Candidate("date", seg.start, seg._end, result_date_5, " "))
        yield(Candidate("date", seg.start, seg._end, result_date_6, " "))
    end
end
return translator
