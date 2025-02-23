local layout = {}
local graphics = {}
local CurrentPage = PageNames[props["page_index"].Value]
if CurrentPage == "Info" then  
--Only Text Block---------------------------------------------------
 table.insert(graphics,{
    Type = "GroupBox",
--Text = "Control",
    Fill = {200,200,200},
    StrokeWidth = 0,
    Position = {0,0},
    Size = {360,346}
  })
table.insert(graphics,{
    Type = "Text",
    Text = "Audit Core",
    Position = {12,8},
    Size = {157,41},
  Font="Roboto",
    FontSize = 25,
  FontStyle="Bold",
    HTextAlign = "Left"
  })
	table.insert(graphics,{
    Type = "Header",
    Text = "Design Info",
    Position = {12,52},
    Size = {330,14},
    FontSize = 12,
    HTextAlign = "Center"
  })
  table.insert(graphics,{
    Type = "Text",
    Text = "Q-SYS Version",
    Position = {12,83},
    Size = {128,16},
    FontSize = 11,
    HTextAlign = "Left"
  })
  table.insert(graphics,{
    Type = "Text",
    Text = "Platform",
    Position = {12,99},
    Size = {128,16},
    FontSize = 11,
    HTextAlign = "Left"
  })
  table.insert(graphics,{
    Type = "Text",
    Text = "Design Name",
    Position = {12,115},
    Size = {128,16},
    FontSize = 11,
    HTextAlign = "Left"
  })	
  table.insert(graphics,{
    Type = "Text",
    Text = "Design Code(ID)",
    Position = {12,131},
    Size = {128,16},
    FontSize = 11,
    HTextAlign = "Left"
  })			
  table.insert(graphics,{
    Type = "Text",
    Text = "Lastest Design Download",
    Position = {12,147},
    Size = {140,16},
    FontSize = 11,
    HTextAlign = "Left"
  })			
  table.insert(graphics,{
    Type = "Text",
    Text = "Lastest Core Boot",
    Position = {12,163},
    Size = {128,16},
    FontSize = 11,
    HTextAlign = "Left"
  })
  table.insert(graphics,{
    Type = "Header",
    Text = "Network",
    Position = {14,200},
    Size = {330,14},
    FontSize = 12,
    HTextAlign = "Center"
  })
  table.insert(graphics,{
    Type = "Text",
    Text = "IP",
    Position = {140,228},
    Size = {118,16},
    FontSize = 11,
    HTextAlign = "Center"
  })			
  table.insert(graphics,{
    Type = "Text",
    Text = "Mac Address",
    Position = {258,228},
    Size = {88,16},
    FontSize = 11,
    HTextAlign = "Center"
  })
  table.insert(graphics,{
  Type = "Text",
  Text = "Refresh Network Info",
  Position = {14,318},
  Size = {128,16},
  FontSize = 11,
  HTextAlign = "Left"
  })			
--Only Text Inputs---------------------------------------------------
layout["Q-SYSVersion"]={
  Position={140,83},
  Size={204,16},
  PrettyName="Qsys Version",
  Style="Text",
  IsReadOnly=true, 
  TextColor={0,0,0},
  TextBoxStyle="Meter Background",
  FontSize=9,
  HTextAlign="Left"
}
layout["Platform"]={
  Position={140,99},
  Size={204,16},
  PrettyName="Platform",
  Style="Text",
  IsReadOnly=true, 
  TextColor={0,0,0},
  TextBoxStyle="Meter Background",
  FontSize=9,
  HTextAlign="Left"
}
layout["DesignName"]={
  Position={140,115},
  Size={204,16},
  PrettyName="Design Name",
  Style="Text",
  IsReadOnly=true, 
  TextColor={0,0,0},
  TextBoxStyle="Meter Background",
  FontSize=9,
  HTextAlign="Left"
}
layout["DesignCode"]={
  Position={140,131},
  Size={204,16},
  PrettyName="Design Code",
  Style="Text",
  IsReadOnly=true, 
  TextColor={0,0,0},
  TextBoxStyle="Meter Background",
  FontSize=9,
  HTextAlign="Left"
}
layout["TimeStampDownload"]={
  Position={140,147},
  Size={204,16},
  PrettyName="Last Design Download",
  Style="Text",
  IsReadOnly=true, 
  TextColor={0,0,0},
  TextBoxStyle="Meter Background",
  FontSize=9,
  HTextAlign="Left"
}
layout["LastBoot"]={
  Position={140,163},
  Size={204,16},
  PrettyName="Last Core Boot",
  Style="Text",
  IsReadOnly=true, 
  TextColor={0,0,0},
  TextBoxStyle="Meter Background",
  FontSize=9,
  HTextAlign="Left"
}
layout["Network_LAN_A 1"]={
  Position={14,245},
  Size={126,16},
  PrettyName="Network A Name",
  Style="Text",
  IsReadOnly=true, 
  TextColor={0,0,0},
  TextBoxStyle="NoBackground",
  FontSize=11,
  HTextAlign="Left"
}
layout["Network_LAN_A 2"]={
  Position={142,244},
  Size={116,16},
  PrettyName="Network A IP",
  Style="Text",
  IsReadOnly=true, 
  TextColor={0,0,0},
  TextBoxStyle="Meter Background",
  FontSize=9,
  HTextAlign="Center"
}
layout["Network_LAN_A 3"]={
  Position={258,244},
  Size={88,16},
  PrettyName="Network A Macaddress",
  Style="Text",
  IsReadOnly=true, 
  TextColor={0,0,0},
  TextBoxStyle="Meter Background",
  FontSize=9,
  HTextAlign="Center"
}
layout["Network_LAN_B 1"]={
  Position={14,260},
  Size={126,16},
  PrettyName="Network B Name",
  Style="Text",
  IsReadOnly=true, 
  TextColor={0,0,0},
  TextBoxStyle="NoBackground",
  FontSize=11,
  HTextAlign="Left"
}
layout["Network_LAN_B 2"]={
  Position={142,260},
  Size={116,16},
  PrettyName="Network B IP",
  Style="Text",
  IsReadOnly=true, 
  TextColor={0,0,0},
  TextBoxStyle="Meter Background",
  FontSize=9,
  HTextAlign="Center"
}
layout["Network_LAN_B 3"]={
  Position={258,260},
  Size={88,16},
  PrettyName="Network B Macaddress",
  Style="Text",
  IsReadOnly=true, 
  TextColor={0,0,0},
  TextBoxStyle="Meter Background",
  FontSize=9,
  HTextAlign="Center"
}
layout["Network_AUX_A 1"]={
  Position={14,276},
  Size={126,16},
  PrettyName="Network Aux A Name",
  Style="Text",
  IsReadOnly=true, 
  TextColor={0,0,0},
  TextBoxStyle="NoBackground",
  FontSize=11,
  HTextAlign="Left"
}
layout["Network_AUX_A 2"]={
  Position={142,275},
  Size={116,16},
  PrettyName="Network Aux A IP",
  Style="Text",
  IsReadOnly=true, 
  TextColor={0,0,0},
  TextBoxStyle="Meter Background",
  FontSize=9,
  HTextAlign="Center"
}
layout["Network_AUX_A 3"]={
  Position={258,275},
  Size={88,16},
  PrettyName="Network Aux B Macaddress",
  Style="Text",
  IsReadOnly=true, 
  TextColor={0,0,0},
  TextBoxStyle="Meter Background",
  FontSize=9,
  HTextAlign="Center"
}
layout["Network_AUX_B 1"]={
  Position={14,291},
  Size={126,16},
  PrettyName="Network Aux B Name",
  Style="Text",
  IsReadOnly=true, 
  TextColor={0,0,0},
  TextBoxStyle="NoBackground",
  FontSize=11,
  HTextAlign="Left"
}
layout["Network_AUX_B 2"]={
  Position={142,291},
  Size={116,16},
  PrettyName="Network Aux B IP",
  Style="Text",
  IsReadOnly=true, 
  TextColor={0,0,0},
  TextBoxStyle="Meter Background",
  FontSize=9,
  HTextAlign="Center"
}
layout["Network_AUX_B 3"]={
  Position={258,291},
  Size={88,16},
  PrettyName="Network Aux B Macaddress",
  Style="Text",
  IsReadOnly=true, 
  TextColor={0,0,0},
  TextBoxStyle="Meter Background",
  FontSize=9,
  HTextAlign="Center"
}

--Only Buttons---------------------------------------------------
layout["RefreshNetworkInfo"] = {
  PrettyName = "Refresh Net Info",
  Style = "Button",
  --Legend ="RefreshNetworkInfo",
  Position = {142,318},
  Size = {36,16},
  --Color = {0,0,0}
}
elseif CurrentPage == "About" then
    table.insert(graphics,{
    Type = "GroupBox",
--Text = "Control",
    Fill = {200,200,200},
    StrokeWidth = 0,
    Position = {0,0},
    Size = {360,290}
  })
  table.insert(graphics,{
    Type = "Text",
    Text = "documentation on github",
    Position = {13,115},
    Size = {128,16},
    FontSize = 11,
  Font="Roboto",
  FontStyle="Regular",
    HTextAlign = "Left"
  })

  table.insert(graphics,{
    Type = "Text",
    Text = "https://github.com/felipehsantos",
    Position = {13,131},
    Size = {255,16},
    FontSize = 11,
  Font="Roboto",
  FontStyle="Regular",
    HTextAlign = "Left"
  })
end
