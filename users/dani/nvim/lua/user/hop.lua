-- Use better keys for the bépo keyboard layout and set
-- a balanced distribution of terminal / sequence keys
local status_ok, hop = pcall(require, 'hop')
if not status_ok then
  return
end

hop.setup { keys = 'etovxqpdygfblzhckisuran' }
