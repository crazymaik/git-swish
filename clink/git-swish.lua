
local function git_local_branches_generator()
    local matches = {}
    for line in io.popen("git branch 2>nul"):lines() do
        local m = line:match("[%* ] (.+)$")
        if m then
            table.insert(matches, m)
        end
    end
    return matches
end

local parser = clink.arg.new_parser

git_local_branches = parser({git_local_branches_generator})

git_branch_parser = parser()
git_branch_parser:set_flags(
    "-d" .. git_local_branches,
    "-D" .. git_local_branches,
    "-r"
)

git_checkout_parser = parser()
git_checkout_parser:set_arguments(
    { git_local_branches_generator
    , "--"
    }
)
git_checkout_parser:set_flags(
    "-b" .. git_local_branches
)

git_parser = parser()
git_parser:set_arguments(
    { "branch" .. git_branch_parser
    , "checkout" .. git_checkout_parser
    }
)
git_parser:set_flags(
    "-C",
    "--help",
    "--version"
)

clink.arg.register_parser("git", git_parser)

clink.arg.register_parser("gbd", git_local_branches)
clink.arg.register_parser("gbD", git_local_branches)
clink.arg.register_parser("gco", git_checkout_parser)
clink.arg.register_parser("gcob", git_local_branches)
