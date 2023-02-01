local M = {}

M.git_colors = {
    GitAdd = "#A1C281",
    GitChange = "#74ADEA",
    GitDelete = "#FE747A",
}
M.lsp_signs = {     
		-- Error = "",
		Error = "",
    Warn = "",
    Info = "ﬤ",
    Hint = "", 
	}
-- ●  ﴞ  ◍
M.cmp_kinds = {
		String = "",
		Number = "",
		Boolean = "◩",
		Array = "",
		Object = "",
		Key = "",
		Null = "ﳠ",
		Namespace = "",
		TypeParameter = "",
    Text = "  ",
		Method = "  ",
		Function = "  ",
		Constructor = "  ",
		Field = " ﴲ ",
		Variable = "  ",
		Class = "  ",
		Interface = "  ",
		Module = " ﰪ ",
		Property = " 襁 ",
		Unit = "  ",
		Value = "  ",
		Enum = " 練 ",
		Keyword = "  ",
		Snippet = "  ",
		Color = "  ",
		File = "  ",
		Reference = "  ",
		Folder = "  ",
		EnumMember = "  ",
		Constant = " ﲀ ",
		Struct = " ﬌ ",
		Event = "  ",
		Operator = "  ",
    Copilot = "  ",
}


M.powerline = {
  circle = {
    left = "",
    right = "",
  },
  arrow = {
    left = "",
    right = "",
  },
  triangle = {
    left = "",
    right = "",
  },
  none = {
    left = "",
    right = "",
  },
}

M.signs = {
  Error = "",
  Warn = "",
  Info = "ﬤ",
  Hint = "",
  GitAdded = "",
  GitModified = "",
  GitRemoved = "",
  Running = "",
  PassCheck = "",
  CheckAlt = " ",
  Forbidden = "",
  FolderClosed = "",
  FolderOpen = "",
  FolderEmpty = "",
  LightBulb = "",
  Config = "",
  Branch = "",
  Code = " ",
  Package = " ",
  Keyboard = " ",
  File = " ",
  Vim = " ",
  QuestionMark = " ",
  Loading = " ",
  Cmd = " ",
  Event = " ",
  Init = " ",
  Collapsed = "",
  Expanded = "",
}

M.colors = {
  bg = "#2e3440",
  fg = "#ECEFF4",
  red = "#bf616a",
  orange = "#d08770",
  yellow = "#ebcb8b",
  blue = "#5e81ac",
  green = "#a3be8c",
  cyan = "#88c0d0",
  magenta = "#b48ead",
  pink = "#FFA19F",
  grey1 = "#f8fafc",
  grey2 = "#f0f1f4",
  grey3 = "#eaecf0",
  grey4 = "#d9dce3",
  grey5 = "#c4c9d4",
  grey6 = "#b5bcc9",
  grey7 = "#929cb0",
  grey8 = "#8e99ae",
  grey9 = "#74819a",
  grey10 = "#616d85",
  grey11 = "#464f62",
  grey12 = "#3a4150",
  grey13 = "#333a47",
  grey14 = "#242932",
  grey15 = "#1e222a",
  grey16 = "#1c1f26",
  grey17 = "#0f1115",
  grey18 = "#0d0e11",
  grey19 = "#020203",
}

M.lsp_servers = {
    -- "clangd",
    "tsserver",
    -- "pyright",
    -- "sumneko_lua",
    -- "eslint",
    -- "bashls",
    -- "yamlls",
    "jsonls",
    "cssls",
    -- "taplo",
    "html",
    -- "graphql",
    -- "tailwindcss",
		"volar",
    -- "jdtls",
}

M.diagnostics_active = true

function M.on_attach(on_attach)
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local buffer = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            on_attach(client, buffer)
        end,
    })
end

function M.warn(msg, notify_opts)
    vim.notify(msg, vim.log.levels.WARN, notify_opts)
end

function M.error(msg, notify_opts)
    vim.notify(msg, vim.log.levels.ERROR, notify_opts)
end

function M.info(msg, notify_opts)
    vim.notify(msg, vim.log.levels.INFO, notify_opts)
end

---@param silent boolean?
---@param values? {[1]:any, [2]:any}
function M.toggle(option, silent, values)
    if values then
        if vim.opt_local[option]:get() == values[1] then
            vim.opt_local[option] = values[2]
        else
            vim.opt_local[option] = values[1]
        end
    end
    vim.opt_local[option] = not vim.opt_local[option]:get()

end

function M.join(...)
    return table.concat(vim.tbl_flatten({ ... }), "/")
end

return M




	-- kind = {
	-- 	Class = "ﴯ",
	-- 	Color = "",
	-- 	Constant = "",
	-- 	Constructor = "",
	-- 	Enum = "",
	-- 	EnumMember = "",
	-- 	Event = "",
	-- 	Field = "",
	-- 	File = "",
	-- 	Folder = "",
	-- 	Function = "",
	-- 	Interface = "",
	-- 	Keyword = "",
	-- 	Method = "",
	-- 	Module = "",
	-- 	Namespace = "",
	-- 	Number = "",
	-- 	Operator = "",
	-- 	Package = "",
	-- 	Property = "ﰠ",
	-- 	Reference = "",
	-- 	Snippet = "",
	-- 	Struct = "",
	-- 	Text = "",
	-- 	TypeParameter = "",
	-- 	Unit = "",
	-- 	Value = "",
	-- 	Variable = "",
	-- 	-- ccls-specific icons.
	-- 	TypeAlias = "",
	-- 	Parameter = "",
	-- 	StaticMethod = "",
	-- 	Macro = "",
	-- },
	-- type = {
	-- 	Array = "",
	-- 	Boolean = "",
	-- 	Null = "ﳠ",
	-- 	Number = "",
	-- 	Object = "",
	-- 	String = "",
	-- },
	-- documents = {
	-- 	Default = "",
	-- 	File = "",
	-- 	Files = "",
	-- 	FileTree = "פּ",
	-- 	Symlink = "",
	-- },
	-- git = {
	-- 	Add = "",
	-- 	Branch = "",
	-- 	Diff = "",
	-- 	Git = "",
	-- 	Ignore = "",
	-- 	Mod = "M",
	-- 	Mod_alt = "",
	-- 	Remove = "",
	-- 	Rename = "",
	-- 	Repo = "",
	-- 	Unmerged = "שׂ",
	-- 	Untracked = "ﲉ",
	-- 	Unstaged = "",
	-- 	Staged = "",
	-- 	Conflict = "",
	-- },
	-- ui = {
	-- 	ArrowClosed = "",
	-- 	ArrowOpen = "",
	-- 	BigCircle = "",
	-- 	BigUnfilledCircle = "",
	-- 	BookMark = "",
	-- 	Bug = "",
	-- 	Calendar = "",
	-- 	Check = "",
	-- 	ChevronRight = "",
	-- 	Circle = "",
	-- 	Close = "",
	-- 	Close_alt = "",
	-- 	CloudDownload = "",
	-- 	Comment = "",
	-- 	CodeAction = "",
	-- 	Dashboard = "",
	-- 	Emoji = "",
	-- 	EmptyFolder = "",
	-- 	EmptyFolderOpen = "",
	-- 	File = "",
	-- 	Fire = "",
	-- 	Folder = "",
	-- 	FolderOpen = "",
	-- 	Gear = "",
	-- 	History = "",
	-- 	Indicator = "",
	-- 	Left = "",
	-- 	List = "",
	-- 	SymlinkFolder = "",
	-- 	Lock = "",
	-- 	Modified = "✥",
	-- 	Modified_alt = "",
	-- 	NewFile = "",
	-- 	Note = "",
	-- 	Package = "",
	-- 	Pencil = "",
	-- 	Perf = "",
	-- 	Project = "",
	-- 	Right = "",
	-- 	Search = "",
	-- 	Separator = "",
	-- 	DoubleSeparator = "",
	-- 	SignIn = "",
	-- 	SignOut = "",
	-- 	Sort = "",
	-- 	Spell = "暈",
	-- 	Symlink = "",
	-- 	Table = "",
	-- 	Telescope = "",
	-- },
	-- diagnostics = {
	-- 	Error = "",
	-- 	Warning = "",
	-- 	Information = "",
	-- 	Question = "",
	-- 	Hint = "",
	-- 	-- Holo version
	-- 	Error_alt = "",
	-- 	Warning_alt = "",
	-- 	Information_alt = "",
	-- 	Question_alt = "",
	-- 	Hint_alt = "",
	-- },
	-- misc = {
	-- 	Campass = "",
	-- 	Code = "",
	-- 	EscapeST = "✺",
	-- 	Gavel = "",
	-- 	Glass = "",
	-- 	PyEnv = "",
	-- 	Squirrel = "",
	-- 	Tag = "",
	-- 	Tree = "",
	-- 	Watch = "",
	-- 	Lego = "",
	-- 	Vbar = "│",
	-- 	Add = "+",
	-- 	Added = "",
	-- 	Ghost = "",
	-- 	ManUp = "",
	-- },
	-- cmp = {
	-- 	Copilot = "",
	-- 	Copilot_alt = "",
	-- 	nvim_lsp = "",
	-- 	nvim_lua = "",
	-- 	path = "",
	-- 	buffer = " ",
	-- 	spell = "暈",
	-- 	luasnip = "",
	-- 	treesitter = "",
	-- },
	-- dap = {
	-- 	Breakpoint = "",
	-- 	BreakpointCondition = "ﳁ",
	-- 	BreakpointRejected = "",
	-- 	LogPoint = "",
	-- 	Pause = "",
	-- 	Play = "",
	-- 	RunLast = "↻",
	-- 	StepBack = "",
	-- 	StepInto = "",
	-- 	StepOut = "",
	-- 	StepOver = "",
	-- 	Stopped = "",
	-- 	Terminate = "ﱢ",
	-- },

