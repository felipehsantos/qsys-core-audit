rapidjson = require("rapidjson")

qsysVersion                 =Controls["Q-SYSVersion"]
qscPlatform                 =Controls.Platform
designName                  =Controls.DesignName
designCode                  =Controls.DesignCode
downloadTimestamp           =Controls.TimeStampDownload
lastBootTimeStamp           =Controls.LastBoot
refreshnet                  =Controls.RefreshNetworkInfo
showNetworkInfo             = {Controls.Network_LAN_A,
                               Controls.Network_LAN_B,
                               Controls.Network_AUX_A,
                               Controls.Network_AUX_B}
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

  function fnDisableNetworkInfo()
    for interfaces = 1, 4 do
        for properties = 1, 3 do
          showNetworkInfo[interfaces][properties].IsDisabled= true
        end
    end
  end

function fnShowNetwork()
  local networkProperties     ={"Interface","Address","MACAddress"}
  fnDisableNetworkInfo()
  for interfaces = 1, qtyInterface() do
    if interfaces<=4 then
      for properties = 1, 3, 1 do
        showNetworkInfo[interfaces][properties].IsDisabled= false
        showNetworkInfo[interfaces][properties].String =networkInterfaces[interfaces][networkProperties[properties]]
      end
    end
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
qsysVersion.String       =System.Version
