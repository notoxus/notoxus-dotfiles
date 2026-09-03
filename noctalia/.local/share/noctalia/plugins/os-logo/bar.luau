-- Read the host OS once when Noctalia loads the widget. There is no polling.
local LOGOS = {
  arch = { glyph = "", color = "#1793D1" },
  debian = { glyph = "", color = "#A80030" },
  fedora = { glyph = "", color = "#51A2DA" },
  kali = { glyph = "", color = "#557C94" },
  manjaro = { glyph = "", color = "#35BF5C" },
  nixos = { glyph = "", color = "#7EBAE4" },
  opensuse = { glyph = "", color = "#73BA25" },
  ubuntu = { glyph = "", color = "#E95420" },
  void = { glyph = "", color = "#478061" },
}

local FALLBACK = { glyph = "", color = "on_surface" }

local function unquote(value)
  local first = value:sub(1, 1)
  local last = value:sub(-1)
  if #value >= 2 and ((first == '"' and last == '"') or (first == "'" and last == "'")) then
    return value:sub(2, -2)
  end
  return value
end

local function readOsRelease()
  local fields = {}
  local contents = noctalia.readFile("/etc/os-release") or ""

  for line in contents:gmatch("[^\r\n]+") do
    local key, value = line:match("^([A-Z_]+)=(.*)$")
    if key and value then
      fields[key] = unquote(value)
    end
  end

  return fields
end

local function resolveLogo(fields)
  local id = (fields.ID or "linux"):lower()
  if LOGOS[id] then
    return LOGOS[id]
  end

  -- Arch derivatives such as CachyOS fall back to the Arch mark; other
  -- derivatives follow the first recognised entry in ID_LIKE.
  for parent in (fields.ID_LIKE or ""):lower():gmatch("%S+") do
    if LOGOS[parent] then
      return LOGOS[parent]
    end
  end

  return FALLBACK
end

local fields = readOsRelease()
local logo = resolveLogo(fields)
local osName = fields.PRETTY_NAME or fields.NAME or fields.ID or "Linux"

function update()
  barWidget.render(ui.row({ align = "center" }, {
    ui.label({
      text = logo.glyph,
      fontFamily = "JetBrainsMono Nerd Font Mono",
      fontSize = 18,
      fontWeight = "bold",
      baseline = "inkCentered",
      color = logo.color,
    }),
  }))
  barWidget.setTooltip(osName)
end
