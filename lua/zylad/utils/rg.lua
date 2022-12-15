local M = {}

local function split_with_colon(str)
  local r = {}
  local i = 1
  local p = 1
  while true do
    local s = str:find(':', p, true)
    if not s then
      r[i] = str:sub(p)
      break
    end
    r[i] = str:sub(p, s - 1)
    p = s + 1
    i = i + 1
  end
  return r
end

M.rg = function(pattern)
    local handle = io.popen("rg --vimgrep " ..pattern)
    local result = handle:read("*a")
    handle:close()
    local lines = {}
    local a = {}

    for s in result:gmatch("[^\r\n]+") do
        local swc = split_with_colon(s)
        table.insert(lines, {filename=swc[1], lnum=swc[2], col=swc[3], text=swc[4]})
    end

    vim.fn.setqflist(lines)
end

return M
