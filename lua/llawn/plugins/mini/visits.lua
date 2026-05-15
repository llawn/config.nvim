-- MiniVisits module to track and reuse file system visits
local visits = require("mini.visits")
local pick = require("mini.pick")
local extra = require("mini.extra")
local utils = require("llawn.utils.cmd")

-- Setup MiniVisits
visits.setup()

-- Helper Functions ===========================================================

-- Cycle through labeled files
local function cycle_labeled(direction)
  local paths = visits.list_paths(nil, { filter = 'core', sort = function(p) return p end })
  if #paths == 0 then return print("No files in Core visits") end

  local curr_path = vim.fn.expand('%:p')
  local curr_idx
  for i, path in ipairs(paths) do
    if vim.fn.fnamemodify(path, ':p') == curr_path then
      curr_idx = i
      break
    end
  end

  local new_idx = curr_idx and ((curr_idx + direction - 1) % #paths + 1) or 1
  vim.cmd('edit ' .. paths[new_idx])
  print(string.format("Visits: [%d/%d] %s", new_idx, #paths, vim.fn.fnamemodify(paths[new_idx], ':t')))
end

-- Remove a single path from picker & visits
local function remove_path_from_picker(path, filter)
  if filter == "core" then
    visits.remove_label("core", path)
  elseif type(filter) == "string" then
    visits.remove_label(filter, path)
  else
    visits.remove_path(path)
  end
  print("Removed: " .. vim.fn.fnamemodify(path, ":t"))
end

-- Remove all paths from picker & visits
local function remove_all_paths_from_picker(paths, filter)
  for _, path in ipairs(paths) do
    remove_path_from_picker(path, filter)
  end
  print("Cleared all visits for filter: " .. (filter or "none"))
end

-- Picker Factory =============================================================

local function make_visit_picker(cwd, desc, sort_fn, filter)
  return function()
    local items = visits.list_paths(cwd, { filter = filter, sort = sort_fn })
    if #items == 0 then return print("No visits found") end

    local remove_cur = function()
      local matches = pick.get_picker_matches()
      if not matches or not matches.current then return end
      local path = type(matches.current) == "table" and matches.current.path or matches.current
      remove_path_from_picker(path, filter)

      local picker_items = pick.get_picker_items()
      for i, item in ipairs(picker_items) do
        if (type(item) == "table" and item.path or item) == path then
          table.remove(picker_items, i)
          break
        end
      end
      pick.set_picker_items(picker_items)
    end

    local remove_all = function()
      local picker_items = pick.get_picker_items()
      local paths = {}
      for _, item in ipairs(picker_items) do
        table.insert(paths, type(item) == "table" and item.path or item)
      end
      remove_all_paths_from_picker(paths, filter)
      pick.stop()
    end

    local picker_mappings = {
      remove = { char = "<C-d>", func = remove_cur },
      remove_all = { char = "<C-k>", func = remove_all },
    }

    extra.pickers.visit_paths(
      { cwd = cwd, filter = filter, sort = sort_fn },
      { source = { name = desc }, mappings = picker_mappings }
    )
  end
end

-- Sort Functions =============================================================

local sort_cycle = function(paths) return paths end
local sort_frecent = visits.gen_sort.default()

-- Label & Visit Helpers ======================================================

local function view_all_labels()
  local labels = visits.list_labels('', '')
  if #labels == 0 then return print("No labels found") end

  vim.ui.select(labels, { prompt = "Select label to view visits" }, function(choice)
    if choice then make_visit_picker(nil, "Visits: " .. choice, nil, choice)() end
  end)
end

local function clear_label_visits()
  local labels = visits.list_labels('', '')
  if #labels == 0 then return print("No labels found") end

  vim.ui.select(labels, { prompt = "Select label to clear all visits" }, function(choice)
    if not choice then return end
    local paths = visits.list_paths(nil, { filter = choice })
    remove_all_paths_from_picker(paths, choice)
  end)
end

local function clear_all_visits()
  vim.ui.select({ "Yes", "No" }, { prompt = "Remove ALL visits and labels? (This cannot be undone)" }, function(choice)
    if choice == "Yes" then
      visits.reset_index()
      print("All visits and labels cleared")
    end
  end)
end

-- Key Mappings ===============================================================

local nmap_leader = utils.nmap_leader

nmap_leader('va', view_all_labels, 'View all labels')
nmap_leader('vC', make_visit_picker('',  'Core visits (all)', sort_cycle, 'core'), 'Core visits (all)')
nmap_leader('vc', make_visit_picker(nil, 'Core visits (cwd)', sort_cycle, 'core'), 'Core visits (cwd)')
nmap_leader('vl', visits.add_label, 'Add label')
nmap_leader('vL', visits.remove_label, 'Remove label')
nmap_leader('vn', function() cycle_labeled(1) end,  'Core visit Next')
nmap_leader('vp', function() cycle_labeled(-1) end, 'Core visit Prev')
nmap_leader('vR', make_visit_picker('',  'Core visits (all, robust)',  sort_frecent, 'core'), 'Core visits (all, robust)')
nmap_leader('vr', make_visit_picker(nil, 'Core visits (cwd, robust)',  sort_frecent, 'core'), 'Core visits (cwd, robust)')
nmap_leader('vv', function() visits.add_label("core") end, 'Add "core" label')
nmap_leader('vV', function() visits.remove_label("core") end, 'Remove "core" label')
nmap_leader('vx', clear_label_visits, 'Clear all visits for label')
nmap_leader('vX', clear_all_visits, 'Clear ALL visits and labels')
