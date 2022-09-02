Table = {"test"}
for i=1,5 do
Table = {tostring(Table)..math.random(1, 10)}
end
local ee = 5
table.insert(Table, math.random(1, 10))
print(table)