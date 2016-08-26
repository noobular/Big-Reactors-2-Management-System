--------------------------------------------------------------------------------------------
term.clear()
term.setCursorPos(1,1)
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
local m = peripheral.find("monitor") -- Monitor for Management (5 long 3 wide)
local r = peripheral.find("BigReactors-Reactor") -- Big Reactors, Reactor

if m then
	print("Monitor Connected!")
	print("")
	else
	print("No Monitor Connected!")
	print("")
end

if r then
	print("Reactor Connected!")
	print("")
	else
	print("No Reactor Connected!")
	print("")
end
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
os.setComputerLabel("Noob's Reactor ControllerMonitor")
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
r.setActive(true)
m.setTextScale(1)
m.clear()
term.clear()
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
term.setCursorPos(1,1)
term.setTextColor(colors.lime)
print("===================================================")
print("|      Big Reactor Monitor 2   [By: Noobular]     |")
print("|                                                 |")
print("|                Monitor Cleared.                 |")
print("|                                                 |")
print("|               Scripts up to date!               |")
print("|                                                 |")
print("|                  Ready to Use.                  |")
print("===================================================")
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
ExtraNumber = 1
i=1
ypos = 1
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
while ypos ~= 20 do
  m.setTextColor(colors.cyan)
    -- Y POSITION
  m.setCursorPos(1,ypos)
  m.write("|")
  m.setCursorPos(50,ypos)
  m.write("|")
    m.setCursorPos(27,ypos)
  m.write("|")
  ypos = ypos +1
end
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
while i ~= 51 do

  -- X POSITION
    m.setCursorPos(i,2)
    m.write("-")
    m.setCursorPos(i,19)
    m.write("-")
i = i + 1
end
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
function Title()
m.setCursorPos(7,1)
m.setTextColor(colors.cyan)
m.write("Big Reactor Monitor 2 [By: Noobular]")
m.setTextColor(colors.white)
end
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
function Bar(text,func,y)
m.setCursorPos(3,y+ExtraNumber)
m.setTextColor(colors.white)
m.write(text)
m.setTextColor(colors.lime)
m.write(func)
end
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
function Bar2(text,func,y)
m.setCursorPos(29,y+ ExtraNumber)
m.setTextColor(colors.white)
m.write(text)
m.setTextColor(colors.lime)
m.write(func)
end
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
function Bar3(text,func,y)
m.setCursorPos(3,y+ExtraNumber)
m.setTextColor(colors.white)
m.write(text)
m.setTextColor(colors.lime)
m.write(func)
m.write(" / ")
m.write(r.getFuelAmountMax())
end
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
while true do
-----------------------
  EStored = math.floor(r.getEnergyStored()/1000)
  Rodl = 15

  if r.getActive() then
    ActiveValue = "true "
  else
    ActiveValue = "false"
  end
  
  Title()
  --------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
  Bar("Currently Active: ",ActiveValue,2)
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
  Bar("Energy Stored: ",EStored,4)
  m.setCursorPos(23,4+ExtraNumber)
  m.write("k  ")
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
  Bar("Fuel: ",r.getFuelAmount().." / "..r.getFuelAmountMax(),6)
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
  Bar("Fuel Used/S: ",r.getFuelConsumedLastTick() * 20,8)
  m.setCursorPos(22,8+ExtraNumber)
  m.write("     ")
  m.setTextColor(colors.cyan)
  m.write("| ")
  m.setTextColor(colors.white)
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
  Bar("Fuel Used/T: ",r.getFuelConsumedLastTick(),10)
  m.setCursorPos(22,10+ExtraNumber)
  m.write("     ")
  m.setTextColor(colors.cyan)
  m.write("| ")
  m.setTextColor(colors.white)
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
  Bar("RF/S: ", math.floor(r.getEnergyProducedLastTick() * 20),12)
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
  Bar("RF/T: ", math.floor(r.getEnergyProducedLastTick()),14)
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
  Bar("Waste: ",r.getWasteAmount(),16)
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
  Bar2("Fuel Reactivity: ", r.getFuelReactivity(),2)
  m.setCursorPos(49,2+ExtraNumber)
  m.write("%")
  m.setTextColor(colors.cyan)
  m.write("|")
  m.setTextColor(colors.white)
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
  Bar2("Yellorium Rods: ",r.getNumberOfControlRods(),4)
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
  Bar2("Casing Temp: ", math.floor(r.getCasingTemperature()),6)
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
  Bar2("Fuel Temp: ", math.floor(r.getFuelTemperature()),8)
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
  Bar2("Cooled: ",r.isActivelyCooled(),10)
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
  Bar2("Rod Levels: ",r.getControlRodLevel(0),12)

--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
  m.setTextColor(colors.white)
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
  sleep(.1)
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------

if r.getEnergyStored()<=10000000 and r.getEnergyStored()>100 then
    r.setAllControlRodLevels(0+(math.floor(r.getEnergyStored()/100000)))
else
    r.setAllControlRodLevels(0)
end

end