local utils = require('llawn.utils.cmd')

local nmap_leader = utils.nmap_leader
local edit_config_file = utils.edit_config_file
local explore_quickfix = utils.explore_quickfix

-- Basic keymaps
nmap_leader('w', vim.cmd.w, "Save Current Buffer")

-- c is for 'Cmd'
nmap_leader('cm', utils.copy_messages   , 'Copy messages')
nmap_leader('cl', utils.toggle_listchars, 'Toggle Listchars')

-- e is for 'Explore' and 'Edit'
nmap_leader('eg', edit_config_file('config/globals.lua')   , 'Globals config')
nmap_leader('ei', '<Cmd>edit $MYVIMRC<CR>'                 , 'init.lua')
nmap_leader('eI', edit_config_file('config/init.lua')      , 'Personal entry point')
nmap_leader('ek', edit_config_file('config/keymaps.lua')   , 'Keymaps config')
nmap_leader('em', edit_config_file('plugins/mini/init.lua'), 'MINI config')
nmap_leader('eo', edit_config_file('config/options.lua')   , 'Options config')
nmap_leader('ep', edit_config_file('config/pack.lua')      , 'Pack config')
nmap_leader('eP', edit_config_file('plugins/init.lua')     , 'Plugins config')
nmap_leader('eq', explore_quickfix                         , 'Quickfix')

-- g is for 'Git'
local git_log_cmd = [[Git log --pretty=format:\%h\ \%as\ │\ \%s --topo-order]]
local git_log_buf_cmd = git_log_cmd .. ' --follow -- %'

nmap_leader('ga', '<Cmd>Git diff --cached<CR>'        , 'Added diff')
nmap_leader('gA', '<Cmd>Git diff --cached -- %<CR>'   , 'Added diff buffer')
nmap_leader('gc', '<Cmd>Git commit<CR>'               , 'Commit')
nmap_leader('gC', '<Cmd>Git commit --amend<CR>'       , 'Commit amend')
nmap_leader('gd', '<Cmd>Git diff<CR>'                 , 'Diff')
nmap_leader('gD', '<Cmd>Git diff -- %<CR>'            , 'Diff buffer')
nmap_leader('gh', '<Cmd>Git add %<CR>'                , 'Add buffer')
nmap_leader('gl', '<Cmd>' .. git_log_cmd .. '<CR>'    , 'Log')
nmap_leader('gL', '<Cmd>' .. git_log_buf_cmd .. '<CR>', 'Log buffer')

-- l is for 'Language'
nmap_leader('la', '<Cmd>lua vim.lsp.buf.code_action()<CR>'    , 'Actions')
nmap_leader('ld', '<Cmd>lua vim.diagnostic.open_float()<CR>'  , 'Diagnostic popup')
nmap_leader('li', '<Cmd>lua vim.lsp.buf.implementation()<CR>' , 'Implementation')
nmap_leader('lh', '<Cmd>lua vim.lsp.buf.hover()<CR>'          , 'Hover')
nmap_leader('lr', '<Cmd>lua vim.lsp.buf.rename()<CR>'         , 'Rename')
nmap_leader('lR', '<Cmd>lua vim.lsp.buf.references()<CR>'     , 'References')
nmap_leader('ls', '<Cmd>lua vim.lsp.buf.definition()<CR>'     , 'Source definition')
nmap_leader('lt', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', 'Type definition')

-- t is for 'Terminal'
nmap_leader('tT', '<Cmd>horizontal term<CR>', 'Terminal (horizontal)')
nmap_leader('tt', '<Cmd>vertical term<CR>'  , 'Terminal (vertical)')
