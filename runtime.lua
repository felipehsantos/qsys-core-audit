
rapidjson = require("rapidjson")

qsysVersion                 =Controls["Q-SYSVersion"]
qscPlatform                 =Controls.Platform
designName                  =Controls.DesignName
designCode                  =Controls.DesignCode
downloadTimestamp           =Controls.TimeStampDownload
lastBootTimeStamp           =Controls.LastBoot
refreshnet                  =Controls.RefreshNetworkInfo
networkInterfaceA           =Controls.Network_LAN_A[1]
networkIPA                  =Controls.Network_LAN_A[2]
networkMACA                 =Controls.Network_LAN_A[3]
networkInterfaceB           =Controls.Network_LAN_B[1]
networkIPB                  =Controls.Network_LAN_B[2]
networkMACB                 =Controls.Network_LAN_B[3]

designStatus                =Design.GetStatus()


function fnFileExist(filename,directory)
temp = dir.get(directory)
  for i,v in ipairs(temp) do
   if(v.name == filename) then
    return true
  end
  end
  return false
end

function qtyInterface()

networkInterfaces           =Network.Interfaces()

local qty
  for key,value in pairs(networkInterfaces) do
  qty=key    
  end
  print("Found "..qty.." Interface(s)")
  return qty
end 

function fnShowNetwork()
networkInterfaces           =Network.Interfaces()
  networkInterfaceA.String    =networkInterfaces[1]["Interface"]
  networkIPA.String           =networkInterfaces[1]["Address"]
  networkMACA.String          =networkInterfaces[1]["MACAddress"]
  if qtyInterface()>1 then
    networkInterfaceB.String    =networkInterfaces[2]["Interface"]
    networkIPB.String           =networkInterfaces[2]["Address"]
    networkMACB.String          =networkInterfaces[2]["MACAddress"]
  else
    networkInterfaceB.String    ="**"
    networkIPB.String           ="**"
    networkMACB.String          ="**"
  end
  print("Network Info Update")
end

function fnShowFirstData()
  qscPlatform.String          =designStatus.Platform
  designName.String           =designStatus.DesignName
  designCode.String           =designStatus.DesignCode
  downloadTimestamp.String    =os.date()
end

function fnShowOldData()
  qscPlatform.String          =oldData.Platform
  designName.String           =oldData.DesignName
  designCode.String           =oldData.DesignCode
  downloadTimestamp.String    =oldData.downloadTimestamp
end


function fnCreateFile(filename,directory)
  local firstData=designStatus
  local f = assert(io.open((directory..filename), "w"))
  firstData.downloadTimestamp=os.date()
  f:write(rapidjson.encode(firstData,{ pretty=true}))
  f:close()
end

function fnCompareId(newId,oldId)
  if newId == oldId then
  print("dbg-> It's the same design!!")
  fnShowOldData()  
  else
  fnShowFirstData()
  fnCreateFile("audit.json","design/")
  print("dbg-> It's a new design!")
  end
end

function fnReadFile(filename,directory)
  file=directory..filename
  local f = assert(io.open(file, "r"))
  oldData= rapidjson.decode(f:read("*all"))
  f:close()
end

function fnInitialize()
  if fnFileExist("audit.json","design/") then --check if a file was created
  print("dbg-> Reading File...")
  fnReadFile("audit.json","design/")
  fnCompareId(designStatus.DesignCode,oldData.DesignCode)
  else
  print("dbg-> Creating File...")
  fnCreateFile("audit.json","design/")
  fnShowFirstData()
  print("dbg-> OK, It's a new Design\n First Plugin Execution!")

  end
fnShowNetwork()
end

refreshnet.EventHandler = function ()
  fnShowNetwork()
end

fnInitialize()
lastBootTimeStamp.String = os.date()
qsysVersion.String          =System.Version
