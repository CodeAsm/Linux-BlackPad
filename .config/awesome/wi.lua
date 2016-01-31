-----------------------
-- AwesomeWM widgets --
--    version 3.5    --
--   <tdy@gmx.com>   --
-----------------------

local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local vicious = require("vicious")
local naughty = require("naughty")

graphwidth  = 120
graphheight = 20
pctwidth    = 40
netwidth    = 50
mpdwidth    = 365

-- {{{ Spacers
space = wibox.widget.textbox()
space:set_text(" ")

comma = wibox.widget.textbox()
comma:set_markup(",")

--pipe = wibox.widget.textbox()
--pipe:set_markup("<span color='" .. beautiful.bg_em .. "'>|</span>")

tab = wibox.widget.textbox()
tab:set_text("         ")

volspace = wibox.widget.textbox()
volspace:set_text(" ")
-- }}}

-- {{{ Processor
-- Cache
vicious.cache(vicious.widgets.cpu)
vicious.cache(vicious.widgets.cpuinf)



-- Core 0 graph
cpugraph0 = awful.widget.graph()
cpugraph0:set_width(graphwidth):set_height(graphheight)
cpugraph0:set_border_color(nil)
cpugraph0:set_border_color(beautiful.bg_widget)
cpugraph0:set_background_color(beautiful.bg_widget)
cpugraph0:set_color({
  type = "linear",
  from = { 0, graphheight },
  to = { 0, 0 },
  stops = {
    { 0, beautiful.fg_widget },
    { 0.25, beautiful.fg_center_widget },
    { 1, beautiful.fg_end_widget } } })
vicious.register(cpugraph0, vicious.widgets.cpu, "$2")

-- Core 0 %
cpupct0 = wibox.widget.textbox()
cpupct0.fit =
  function(box, w, h)
    local w, h = wibox.widget.textbox.fit(box, w, h)
    return math.max(pctwidth, w), h
  end
vicious.register(cpupct0, vicious.widgets.cpu, "$2%", 2)

-- Core 1 graph
cpugraph1 = awful.widget.graph()
cpugraph1:set_width(graphwidth):set_height(graphheight)
cpugraph1:set_border_color(nil)
cpugraph1:set_border_color(beautiful.bg_widget)
cpugraph1:set_background_color(beautiful.bg_widget)
cpugraph1:set_color({
  type = "linear",
  from = { 0, graphheight },
  to = { 0, 0 },
  stops = {
    { 0, beautiful.fg_widget },
    { 0.25, beautiful.fg_center_widget },
    { 1, beautiful.fg_end_widget }
  }})
vicious.register(cpugraph1, vicious.widgets.cpu, "$3")

-- Core 1 %
cpupct1 = wibox.widget.textbox()
cpupct1.fit =
  function(box, w, h)
    local w, h = wibox.widget.textbox.fit(box, w, h)
    return math.max(pctwidth, w), h
  end
vicious.register(cpupct1, vicious.widgets.cpu, "$3%", 2)

-- Core 2 graph
cpugraph2 = awful.widget.graph()
cpugraph2:set_width(graphwidth):set_height(graphheight)
cpugraph2:set_border_color(nil)
cpugraph2:set_border_color(beautiful.bg_widget)
cpugraph2:set_background_color(beautiful.bg_widget)
cpugraph2:set_color({
  type = "linear",
  from = { 0, graphheight },
  to = { 0, 0 },
  stops = {
    { 0, beautiful.fg_widget },
    { 0.25, beautiful.fg_center_widget },
    { 1, beautiful.fg_end_widget } } })
vicious.register(cpugraph2, vicious.widgets.cpu, "$4")

-- Core 2 %
cpupct2 = wibox.widget.textbox()
cpupct2.fit =
  function(box, w, h)
    local w, h = wibox.widget.textbox.fit(box, w, h)
    return math.max(pctwidth, w), h
  end
vicious.register(cpupct2, vicious.widgets.cpu, "$4%", 2)
-- }}}

-- {{{ Memory
-- Cache
vicious.cache(vicious.widgets.mem)


-- RAM bar
membar = awful.widget.progressbar()
membar:set_vertical(false):set_width(graphwidth):set_height(graphheight)
membar:set_ticks(false):set_ticks_size(2)
membar:set_border_color(nil)
membar:set_background_color(beautiful.bg_widget)
membar:set_color({
  type = "linear",
  from = { 0, 0 },
  to = { graphwidth, 0 },
  stops = {
    { 0, beautiful.fg_widget },
    { 0.25, beautiful.fg_center_widget },
    { 1, beautiful.fg_end_widget } } })
vicious.register(membar, vicious.widgets.mem, "$1", 13)

-- RAM %
mempct = wibox.widget.textbox()
mempct.width = pctwidth
vicious.register(mempct, vicious.widgets.mem, "$1%", 5)

-- {{{ Filesystem
-- Cache
vicious.cache(vicious.widgets.fs)


-- Root bar
rootfsbar = awful.widget.progressbar()
rootfsbar:set_vertical(false):set_width(graphwidth):set_height(graphheight)
rootfsbar:set_ticks(false):set_ticks_size(2)
rootfsbar:set_border_color(nil)
rootfsbar:set_background_color(beautiful.bg_widget)
rootfsbar:set_color({
  type = "linear",
  from = { 0, 0 },
  to = { graphwidth, 0 },
  stops = {
    { 0, beautiful.fg_widget },
    { 0.25, beautiful.fg_center_widget },
    { 1, beautiful.fg_end_widget } } })
vicious.register(rootfsbar, vicious.widgets.fs, "${/ used_p}", 97)

-- Root %
rootfspct = wibox.widget.textbox()
rootfspct.width = pctwidth
vicious.register(rootfspct, vicious.widgets.fs, "${/ used_p}%", 97)
-- }}}

-- {{{ Network
-- Cache
vicious.cache(vicious.widgets.net)

-- TX graph
txgraph = awful.widget.graph()
txgraph:set_width(graphwidth):set_height(graphheight)
txgraph:set_border_color(nil)
txgraph:set_background_color(beautiful.bg_widget)
txgraph:set_color({
  type = "linear",
  from = { 0, graphheight },
  to = { 0, 0 },
  stops = {
    { 0, beautiful.fg_widget },
    { 0.25, beautiful.fg_center_widget },
    { 1, beautiful.fg_end_widget } } })
vicious.register(txgraph, vicious.widgets.net, "${eth0 up_kb}")


-- TX speed
txwidget = wibox.widget.textbox()
txwidget.fit =
  function(box, w, h)
    local w, h = wibox.widget.textbox.fit(box, w, h)
    return math.max(netwidth, w), h
  end
vicious.register(txwidget, vicious.widgets.net, "${eth0 up_kb}", 2)

-- RX graph
rxgraph = awful.widget.graph()
rxgraph:set_width(graphwidth):set_height(graphheight)
rxgraph:set_border_color(nil)
rxgraph:set_background_color(beautiful.bg_widget)
rxgraph:set_color({
  type = "linear",
  from = { 0, graphheight },
  to = { 0, 0 },
  stops = {
    { 0, beautiful.fg_widget },
    { 0.25, beautiful.fg_center_widget },
    { 1, beautiful.fg_end_widget } } })
vicious.register(rxgraph, vicious.widgets.net, "${eth0 down_kb}")

-- RX speed
rxwidget = wibox.widget.textbox()
rxwidget.fit =
  function(box, w, h)
    local w, h = wibox.widget.textbox.fit(box, w, h)
    return math.max(netwidth, w), h
  end
vicious.register(rxwidget, vicious.widgets.net, "${eth0 down_kb}", 2)
-- }}}


-- {{{ Pacman
-- Icon
pacicon = wibox.widget.imagebox()
pacicon:set_image(beautiful.widget_pac)

-- Upgrades
pacwidget = wibox.widget.textbox()
vicious.register(pacwidget, vicious.widgets.pkg,
  function(widget, args)
    if args[1] > 0 then
      pacicon:set_image(beautiful.widget_pacnew)
    else
      pacicon:set_image(beautiful.widget_pac)
    end

    return args[1]
  end, 1801, "Arch S") -- Arch S for ignorepkg

-- Buttons
function popup_pac()
  local pac_updates = ""
  local f = io.popen("pacman -Sup --dbpath /tmp/pacsync")
  if f then
    pac_updates = f:read("*a"):match(".*/(.*)-.*\n$")
  end
  f:close()

  if not pac_updates then pac_updates = "System is up to date" end

  naughty.notify { text = pac_updates }
end
pacwidget:buttons(awful.util.table.join(awful.button({ }, 1, popup_pac)))
pacicon:buttons(pacwidget:buttons())
-- }}}

-- {{{ Pianobar
-- Icon
mpdicon = wibox.widget.imagebox()
mpdicon:set_image(beautiful.widget_mpd)



-- {{{ Volume
-- Cache
vicious.cache(vicious.widgets.volume)

-- Icon
volicon = wibox.widget.imagebox()
volicon:set_image(beautiful.widget_vol)

-- Volume %
volpct = wibox.widget.textbox()
vicious.register(volpct, vicious.widgets.volume, "$1%", nil, "Master")

-- Buttons
volicon:buttons(awful.util.table.join(
  awful.button({ }, 1,
    function() awful.util.spawn("amixer -q set Master toggle", false) end),
  awful.button({ }, 4,
    function() awful.util.spawn("amixer -q set Master 3+% unmute", false) end),
  awful.button({ }, 5,
    function() awful.util.spawn("amixer -q set Master 3-% unmute", false) end)))
volpct:buttons(volicon:buttons())
volspace:buttons(volicon:buttons())
-- }}}

-- {{{ Battery
-- Battery attributes
local bat_state  = ""
local bat_charge = 0
local bat_time   = 0
local blink      = true

-- Icon
baticon = wibox.widget.imagebox()
baticon:set_image(beautiful.widget_batfull)

-- Charge %
batpct = wibox.widget.textbox()
vicious.register(batpct, vicious.widgets.bat,
  function(widget, args)
    bat_state  = args[1]
    bat_charge = args[2]
    bat_time   = args[3]

    if args[1] == "-" then
      if bat_charge > 70 then
        baticon:set_image(beautiful.widget_batfull)
      elseif bat_charge > 30 then
        baticon:set_image(beautiful.widget_batmed)
      elseif bat_charge > 10 then
        baticon:set_image(beautiful.widget_batlow)
      else
        baticon:set_image(beautiful.widget_batempty)
      end
    else
      baticon:set_image(beautiful.widget_ac)
      if args[1] == "+" then
        blink = not blink
        if blink then
          baticon:set_image(beautiful.widget_acblink)
        end
      end
    end

    return args[2] .. "%"
  end, nil, "BAT0")

-- Buttons
function popup_bat()
  local state = ""
  if bat_state == "↯" then
    state = "Full"
  elseif bat_state == "↯" then
    state = "Charged"
  elseif bat_state == "+" then
    state = "Charging"
  elseif bat_state == "-" then
    state = "Discharging"
  elseif bat_state == "⌁" then
    state = "Not charging"
  else
    state = "Unknown"
  end

  naughty.notify { text = "Charge : " .. bat_charge .. "%\nState  : " .. state ..
    " (" .. bat_time .. ")", timeout = 5, hover_timeout = 0.5 }
end
batpct:buttons(awful.util.table.join(awful.button({ }, 1, popup_bat)))
baticon:buttons(batpct:buttons())
-- }}}
