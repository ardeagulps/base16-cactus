local has_statusline, statusline = pcall(require, "mini.statusline")
if not has_statusline or vim.g.cactusbuddy_statusline_enabled == false then
  return
end

local palette = require('palette')

local highlights = {
  -- Mode
  MiniStatuslineModeCommand = { fg = palette.base06, bg = palette.base01, bold = true },
  MiniStatuslineModeInsert  = { fg = palette.base0C, bg = palette.base01, bold = true },
  MiniStatuslineModeNormal  = { fg = palette.base07, bg = palette.base01, bold = true },
  MiniStatuslineModeOther   = { fg = palette.base0D, bg = palette.base01, bold = true },
  MiniStatuslineModeReplace = { fg = palette.base08, bg = palette.base01, bold = true },
  MiniStatuslineModeVisual  = { fg = palette.base0E, bg = palette.base01, bold = true },

  -- Diagnostics
  MiniStatuslineDiagnosticError   = { fg = palette.base08, bg = palette.base01 },
  MiniStatuslineDiagnosticHint    = { fg = palette.base05, bg = palette.base01 },
  MiniStatuslineDiagnosticInfo    = { fg = palette.base06, bg = palette.base01 },
  MiniStatuslineDiagnosticWarning = { fg = palette.base09, bg = palette.base01 },

  -- General
  MiniStatuslineFilename = { fg = palette.base07, bg = palette.base01 },
  MiniStatuslineFileinfo = { fg = palette.base06, bg = palette.base01 },
  MiniStatuslineInactive = { fg = palette.base04, bg = palette.base01 },
}

for group, opts in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, opts)
end

local function section_paste()
  return vim.o.paste and 'PASTE' or ''
end

local function section_git()
  local branch = vim.b.gitsigns_head or (vim.b.minidiff_summary and vim.b.minidiff_summary.source and vim.b.minidiff_summary.source.name)
  if not branch or branch == '' then return '' end
  return ' ' .. branch .. ' '
end

local function section_fileinfo()
  local filetype = vim.bo.filetype
  if filetype == '' then
    filetype = 'NO FT'
  end

  local has_lsp = false
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    if client.initialized then
      has_lsp = true
      break
    end
  end
  local plugin_flag = has_lsp and '+' or ''

  local format = vim.bo.fileformat
  local format_warn = format ~= 'unix' and ' [' .. format .. ']' or ''

  return string.format('%s%s%s', filetype, plugin_flag, format_warn)
end

local function section_percentage()
  local current_line = vim.fn.line('.')
  local total_lines = vim.fn.line('$')
  if current_line == 1 then
    return 'Top'
  elseif current_line == total_lines then
    return 'Bot'
  else
    return string.format('%2d%%%%', math.floor(current_line / total_lines * 100))
  end
end

-- Custom section_filename to display path
statusline.section_filename = function(args)
  if vim.bo.buftype == 'terminal' then
    return '%t'
  elseif statusline.is_truncated(args.trunc_width) then
    return '%f'
  else
    return '%F'
  end
end

-- Custom section_modified to display modified/readonly flags
statusline.section_modified = function(args)
  return '%{%&modified ? " [+]" : ""%}%{%&readonly ? " [RO]" : ""%}'
end

statusline.section_diagnostics = function(args)
  if statusline.is_truncated(args and args.trunc_width) then return '' end
  local err_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warn_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  local other_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
                    + #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })

  local parts = {}
  if err_count > 0 then
    table.insert(parts, string.format("%%#MiniStatuslineDiagnosticError# %d", err_count))
  end
  if warn_count > 0 then
    table.insert(parts, string.format("%%#MiniStatuslineDiagnosticWarning# %d", warn_count))
  end
  if other_count > 0 then
    table.insert(parts, string.format("%%#MiniStatuslineDiagnosticInfo# %d", other_count))
  end

  if #parts == 0 then return '' end
  return table.concat(parts, '  ')
end

statusline.setup({
  use_icons = false,
  content = {
    active = function()
      if vim.bo.filetype == 'TelescopePrompt' then
        return ' '
      end

      local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
      local paste = section_paste()
      local git = section_git()
      local filename = statusline.section_filename({ trunc_width = 140 })
      local modified = statusline.section_modified({ trunc_width = 140 })
      local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })
      local fileinfo = section_fileinfo()
      local percentage = section_percentage()

      return statusline.combine_groups({
        { hl = mode_hl,                  strings = { mode:upper() } },
        { hl = 'MiniStatuslineFilename', strings = { paste } },
        ' ',
        { hl = 'MiniStatuslineFilename', strings = { filename } },
        ' ',
        { hl = 'MiniStatuslineFilename', strings = { modified } },
        diagnostics,
        '%=',
        { hl = 'MiniStatuslineFileinfo', strings = { git } },
        ' ',
        { hl = 'MiniStatuslineFileinfo', strings = { fileinfo:upper() } },
        '  ',
        { hl = 'MiniStatuslineFileinfo', strings = { percentage } },
      })
    end,
    inactive = function()
      return statusline.combine_groups({
        { hl = 'MiniStatuslineInactive', strings = { '%t' } },
      })
    end,
  },
})
