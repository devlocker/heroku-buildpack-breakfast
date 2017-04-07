info() {
  #echo "`date +\"%M:%S\"`  $*"
  echo "       $*"
}

indent() {
  while read LINE; do
    echo "       $LINE" || true
  done
}

head() {
  echo ""
  echo "-----> $*"
}

file_contents() {
  if test -f $1; then
    echo "$(cat $1)"
  else
    echo ""
  fi
}

load_config() {
  info "Loading config..."

  local custom_config_file="${build_dir}/breakfast_static_buildpack.config"

  # Source for default versions file from buildpack first
  source "${build_pack_dir}/breakfast_static_buildpack.config"

  if [ -f $custom_config_file ]; then
    source $custom_config_file
  else
    info "WARNING: breakfast_static_buildpack.config wasn't found in the app"
    info "Using default config from breakfast static buildpack"
  fi

  breakfast_dir=$build_dir/$breakfast_relative_path

  info "Will use the following versions:"
  info "* Node ${node_version}"
  info "Will export the following config vars:"
  info "* Config vars ${config_vars_to_export[*]}"
}

export_env_dir() {
  whitelist_regex=${2:-''}
  blacklist_regex=${3:-'^(PATH|GIT_DIR|CPATH|CPPATH|LD_PRELOAD|LIBRARY_PATH)$'}
  if [ -d "$env_dir" ]; then
    for e in $(ls $env_dir); do
      echo "$e" | grep -E "$whitelist_regex" | grep -qvE "$blacklist_regex" &&
      export "$e=$(cat $env_dir/$e)"
      :
    done
  fi
}
