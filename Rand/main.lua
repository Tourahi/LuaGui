local ui = require("tek.ui");
local app = ui.Application:new();


local randomize = function(n)
  math.randomseed(os.time());
  return math.random(n);
end
-- Window
local win = ui.Window:new {
  Title = "Randomizer",
  Orientation = "vertical",
  HideOnEscape = true -- close after Esc
};

-- Widgets

local output = ui.Text:new {
  Legent = "Output",
  Id = "output",
  Height = "free", -- takes full Height
  Style = "font: :100"
};


-- label
local lbl = ui.Text:new {
  Width = "40";
  Text = "Max :"
};

-- Text input for the max number to be generated
local txtInpt = ui.Input:new {
  Id = "inpt",
  Width = "40",
  MaxLength = 1,
  Style = "margin-left: 10",
};

-- Button
local btn = ui.Button:new { Text = "Rand", Style = "font: ui-small; halign = right" };
function btn:onClick()
  ui.Button.onClick(self);
  local ipt =  tonumber(self:getById("inpt"):getText());
  local out  = self:getById("output");
  if type(ipt) == "number" then
    local res = randomize(ipt);
    out:setValue("Text", res);
  else
    out:setValue("Text", "Only Nums");
  end

end

-- Input Group
local inptGroup = ui.Group:new {
  Children = {
    lbl,
    txtInpt,
    btn
  }
};



win:addMember(output);
win:addMember(inptGroup);


app:addMember(win);
app:run();
