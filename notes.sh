notes() {
  local NOTES_ROOT=~/Developer/notes

  local year month_name month_display week_num dir week_file

  year=$(date +%Y)
  month_display=$(date +%B)
  month_name=$(echo "$month_display" | tr '[:upper:]' '[:lower:]')
  week_num=$(( ($(date +%-d) - 1) / 7 + 1 ))
  
  dir="${NOTES_ROOT}/${year}/${month_name}"
  week_file="${dir}/week-${week_num}.md"

  mkdir -p "$dir"
  if [[ ! -f "$week_file" ]]; then
    sed "s/{{WEEK_OF}}/Week ${week_num} of ${month_display} ${year}/" "${NOTES_ROOT}/template.md" > "$week_file"
    echo "Created ${week_file#"$NOTES_ROOT/"}"
  fi

  cd "$dir" || return 1

  case "${1:-}" in
    vim|edit)
      vim "$week_file"
      ;;
    cat)
      cat "$week_file"
      ;;
  esac
}
