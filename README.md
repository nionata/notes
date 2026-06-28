# Notes

## Directory Structure

```
notes/
  YYYY/
    month/        # lowercase full month name (may, june, october, ...)
      week-N.md   # N = week number within the month (1–5), based on day-of-month
  template.md     # weekly template — edit this to change the weekly structure
  README.md       # this file
  notes.sh        # shell function — source this or add to .zshrc
```

## Weekly Files

- One `.md` file per calendar week
- Week number = `ceil(day / 7)`: days 1–7 → week-1, 8–14 → week-2, etc.
- Created automatically from `template.md` on first access

## Template

`template.md` is the source of truth for the weekly file structure. Edit it
freely — new weeks will pick up whatever is currently in the template. Existing
week files are never modified automatically.

## The `notes` Function

Defined in `notes.sh`. Must be sourced (not executed) so it can `cd`.

```zsh
source ~/Developer/notes/notes.sh

# Suggested aliases in .zshrc:
alias n='notes'       # cd to today's week dir
alias nv='notes vim'  # cd + open this week's file in vim
```

### Usage

```bash
notes           — cd to YYYY/month/, create week-N.md from template if needed
notes vim|edit  — cd + open week file in vim
```
