function git_ps1_info {
# exit if we are not in a git repo
git rev-parse --git-dir > /dev/null 2>&1 || return

# assign the branch to a BRANCH variable
local BRANCH="$(git symbolic-ref HEAD 2> /dev/null)"
#local BRANCH="$(git status -bsuno --porcelain 2>&1 | head -n 1 | fgrep '...' | sed -e 's/\.\.\..*$//g' | sed -e 's/## //g')"
local BRANCH="${BRANCH#refs/heads/}"

# if not on a named branch, show commit hash
if [ ${#BRANCH} -eq 0 ]; then
  local BRANCH="$(git log -1 --pretty="%h")"
fi

# assign merge parents to BRANCH if we are on a merge commit
local MERGE_BRANCH=$(git log -1 --pretty="%p")
[ ${#MERGE_BRANCH} -gt 7 ] && local BRANCH="${BRANCH}\e[m < ${MERGE_BRANCH}"

# show pending changes in red (does not include untracked files)
git diff --quiet 2>/dev/null >&2
local DIFF=$?
git diff --cached --quiet 2>/dev/null >&2
local DIFFC=$?
if [ ${DIFF} -eq 1 -o ${DIFFC} -eq 1 ]
then
  local COLOR="\e[31m"
else
  local COLOR="\e[m"
fi

printf "\e[33m(${COLOR}${BRANCH}\e[33m)\e[m"
}
