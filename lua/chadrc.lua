-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "ashes",
  statusline = {
    modules = {
      file = function()
        local default_sep_icons = {
          default = { left = "", right = " " },
          round = { left = "", right = "" },
          block = { left = "█", right = "█" },
          arrow = { left = "", right = "" },
        }
        local config = require "nvconfig"
        local sep_style = config.ui.statusline.theme

        local separators = (type(sep_style) == "table" and sep_style) or default_sep_icons[sep_style]

        local sep_r = separators["right"]
        local icon = " 󰈚 "
        local name = vim.fn.expand("%:.")

        if name ~= "Empty " then
          local devicons_present, devicons = pcall(require, "nvim-web-devicons")

          if devicons_present then
            local ft_icon = devicons.get_icon(name)
            icon = (ft_icon ~= nil and " " .. ft_icon) or ""
          end

          name = " " .. name .. " "
        end

        return "%#StText# " .. icon .. name .. "%#St_file_sep#" .. sep_r
      end,
    }
  }

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

return M
