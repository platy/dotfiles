
function prompt_get_git_branch() {
  ref="$(git symbolic-ref HEAD 2> /dev/null)"
  if [[ "$ref" != "" ]]; then
    echo "${ref/refs\/heads\//}"
  else
    echo "(no branch)"
  fi
}

function prompt_get_git_progress() {
  # Detect in-progress actions (e.g. merge, rebase)
  # https://github.com/git/git/blob/v1.9-rc2/wt-status.c#L1199-L1241
  git_dir="$(git rev-parse --git-dir)"

  # git merge
  if [[ -f "$git_dir/MERGE_HEAD" ]]; then
    echo " [merge]"
  elif [[ -d "$git_dir/rebase-apply" ]]; then
    # git am
    if [[ -f "$git_dir/rebase-apply/applying" ]]; then
      echo " [am]"
    # git rebase
    else
      echo " [rebase]"
    fi
  elif [[ -d "$git_dir/rebase-merge" ]]; then
    # git rebase --interactive/--merge
    echo " [rebase]"
  elif [[ -f "$git_dir/CHERRY_PICK_HEAD" ]]; then
    # git cherry-pick
    echo " [cherry-pick]"
  fi
  if [[ -f "$git_dir/BISECT_LOG" ]]; then
    # git bisect
    echo " [bisect]"
  fi
  if [[ -f "$git_dir/REVERT_HEAD" ]]; then
    # git revert --no-commit
    echo " [revert]"
  fi
}

prompt_is_branch1_behind_branch2 () {
  # $ git log origin/master..master -1
  # commit 4a633f715caf26f6e9495198f89bba20f3402a32
  # Author: Todd Wolfson <todd@twolfson.com>
  # Date:   Sun Jul 7 22:12:17 2013 -0700
  #
  #     Unsynced commit

  # Find the first log (if any) that is in branch1 but not branch2
  first_log="$(git log $1..$2 -1 2> /dev/null)"

  # Exit with 0 if there is a first log, 1 if there is not
  [[ -n "$first_log" ]]
}

prompt_branch_exists () {
  # List remote branches           | # Find our branch and exit with 0 or 1 if found/not found
  git branch --remote 2> /dev/null | grep --quiet "$1"
}

prompt_parse_git_ahead () {
  # Grab the local and remote branch
  branch="$(prompt_get_git_branch)"
  remote="$(git config --get "branch.${branch}.remote" || echo -n "origin")"
  remote_branch="$remote/$branch"

  # $ git log origin/master..master
  # commit 4a633f715caf26f6e9495198f89bba20f3402a32
  # Author: Todd Wolfson <todd@twolfson.com>
  # Date:   Sun Jul 7 22:12:17 2013 -0700
  #
  #     Unsynced commit

  # If the remote branch is behind the local branch
  # or it has not been merged into origin (remote branch doesn't exist)
  if (prompt_is_branch1_behind_branch2 "$remote_branch" "$branch" ||
      ! prompt_branch_exists "$remote_branch"); then
    # echo our character
    echo 1
  fi
}

prompt_parse_git_behind () {
  # Grab the branch
  branch="$(prompt_get_git_branch)"
  remote="$(git config --get "branch.${branch}.remote" || echo -n "origin")"
  remote_branch="$remote/$branch"

  # $ git log master..origin/master
  # commit 4a633f715caf26f6e9495198f89bba20f3402a32
  # Author: Todd Wolfson <todd@twolfson.com>
  # Date:   Sun Jul 7 22:12:17 2013 -0700
  #
  #     Unsynced commit

  # If the local branch is behind the remote branch
  if prompt_is_branch1_behind_branch2 "$branch" "$remote_branch"; then
    # echo our character
    echo 1
  fi
}

function prompt_parse_git_dirty() {
  # If the git status has *any* changes (e.g. dirty), echo our character
  if [[ -n "$(git status --porcelain 2> /dev/null)" ]]; then
    echo 1
  fi
}

# Set up symbols
prompt_synced_symbol=""
prompt_dirty_synced_symbol="*"
prompt_unpushed_symbol="△"
prompt_dirty_unpushed_symbol="▲"
prompt_unpulled_symbol="▽"
prompt_dirty_unpulled_symbol="▼"
prompt_unpushed_unpulled_symbol="⬡"
prompt_dirty_unpushed_unpulled_symbol="⬢"

function prompt_get_git_status() {
  # Grab the git dirty and git behind
  dirty_branch="$(prompt_parse_git_dirty)"
  branch_ahead="$(prompt_parse_git_ahead)"
  branch_behind="$(prompt_parse_git_behind)"

  # Iterate through all the cases and if it matches, then echo
  if [[ "$dirty_branch" == 1 && "$branch_ahead" == 1 && "$branch_behind" == 1 ]]; then
    echo "$prompt_dirty_unpushed_unpulled_symbol"
  elif [[ "$branch_ahead" == 1 && "$branch_behind" == 1 ]]; then
    echo "$prompt_unpushed_unpulled_symbol"
  elif [[ "$dirty_branch" == 1 && "$branch_ahead" == 1 ]]; then
    echo "$prompt_dirty_unpushed_symbol"
  elif [[ "$branch_ahead" == 1 ]]; then
    echo "$prompt_unpushed_symbol"
  elif [[ "$dirty_branch" == 1 && "$branch_behind" == 1 ]]; then
    echo "$prompt_dirty_unpulled_symbol"
  elif [[ "$branch_behind" == 1 ]]; then
    echo "$prompt_unpulled_symbol"
  elif [[ "$dirty_branch" == 1 ]]; then
    echo "$prompt_dirty_synced_symbol"
  else # clean
    echo "$prompt_synced_symbol"
  fi
}

prompt_git () {
  if git rev-parse 2> /dev/null; then
    echo "#$(tput setaf 3)$(prompt_get_git_branch)$(prompt_get_git_status)$(tput setaf 1)$(prompt_get_git_progress)$(tput sgr0)"
  fi
}

prompt_machine () {
  if [[ -v SSH_CONNECTION ]]
  then
    echo "$(tput setaf 4)%n$(tput sgr0)@$(tput setaf 6)%m$(tput sgr0)"
  fi
}

prompt_k8_context() {
  echo $(kubectl config current-context 2> /dev/null)
}

setopt prompt_subst

prompt='$(prompt_machine):$(tput setaf 2)$(tput bold)%~$(tput sgr0)$(prompt_git)
$(echo -n $DOCKER_MACHINE_NAME $DOCKER_HOST $(prompt_k8_context) )%{%(?..$(tput setaf 1))%} %% %{$(tput sgr0)%}'
