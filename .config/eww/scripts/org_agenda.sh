#!/bin/bash

deadlineTasks=$(emacs --batch -l ~/.emacs.d/early-init.el \
				--eval "(setq org-agenda-span 'day
	  		 		org-agenda-todo-keyword-format \"%-12s\"
  					org-agenda-deadline-leaders    '(\"Due today\" \"Due in %d days\" \"\")
  					org-agenda-scheduled-leaders   '(\"For today\" \"%d days from now\")
  					org-agenda-prefix-format       '((agenda . \"  %-16s %?-14t \")
												     (timeline . \"% s\")
													 (todo . \" %i %s %e\")
													 (tags . \" %i %e \")
													 (search . \" %i %e \"))
					org-todo-keywords '((sequence \"TODO(t)\" \"PLANNING(p)\" \"IN-PROGRESS(i@/!)\" \"BLOCKED(b@)\" \"WAITING(w@!)\" \"|\" \"DONE(d!)\" \"WONT-DO(x@/!)\"))
					org-agenda-custom-commands '((\"A\" \"Agenda asdads\"
											   	   agenda \"\"
												   ((org-agenda-entry-types '(:deadline)))
												   )))"\
                 --eval "(org-batch-agenda \"A\")" \
				 --kill
	   )

allTasks=$(emacs --batch -l ~/.emacs.d/early-init.el \
				--eval "(setq org-agenda-span 'day
	  		 		org-agenda-todo-keyword-format \"%-12s\"
  					org-agenda-deadline-leaders    '(\"Due today\" \"Due in %d days\" \"\")
  					org-agenda-scheduled-leaders   '(\"For today\" \"%d days from now\")
  					org-agenda-prefix-format       '((agenda . \"  %-16s %?-14t \")
												     (timeline . \"% s\")
													 (todo . \" %i %s %e\")
													 (tags . \" %i %e \")
													 (search . \" %i %e \"))
					org-todo-keywords '((sequence \"TODO(t)\" \"PLANNING(p)\" \"IN-PROGRESS(i@/!)\" \"BLOCKED(b@)\" \"WAITING(w@!)\" \"|\" \"DONE(d!)\" \"WONT-DO(x@/!)\")))" \
                 --eval "(org-batch-agenda \"t\")" \
				 --kill
		)

allTasks=$(echo "$allTasks" | grep -E "^\s*(TODO|PLANNING|IN-PROGRESS|BLOCKED|WAITING)")
deadlineTasks=$(echo "$deadlineTasks" | grep -E "^\s*Due" | sed -E 's/[0-9]{1,2}:[0-9]{2}\.+\s+//')

map_status() {
	class="$1"
	case "$1" in
		"TODO") class="todo" ;;
		"PLANNING") class="planning" ;;
		"IN-PROGRESS") class="progress" ;; 
		"BLOCKED") class="blocked" ;; 
		"WAITING") class="waiting" ;;
		"DONE") class="done" ;;
		"WONT-DO") class="wont" ;;
	esac
	echo "[\"$1\", \"$class\"]"
}

map_priority() {
	case "$1" in
		A) echo "[\"‼\", \"urgent\"]" ;;
		B) echo "[\"󰜷\", \"high\"]" ;;
		C) echo "[\"󰜮\", \"low\"]" ;;
		D) echo "[\"󰅟\", \"bluesky\"]" ;;
		*) echo "[\"$1\", \"$1\"]" ;;
	esac
}


declare -A seen
echo "["
first=1
cnt=0
while IFS= read -r line; do
    # skip empty lines
    [ -z "$line" ] && continue

	deadline=$(echo "$line" | sed -E 's/^\s*(Due today|Due in [0-9]+ days)?.*/\1/')
    status=$(echo "$line" | sed -E 's/^\s*(Due today|Due in [0-9]+ days)?\s*([A-Z-]+).*/\2/')
	priority=$(echo "$line" | sed -E 's/^\s*(Due today|Due in [0-9]+ days)?\s*[A-Z-]+[ \t]+\[#([A-Z])\].*/\2/')
	title=$(echo "$line" | sed -E 's/^\s*(Due today|Due in [0-9]+ days)?\s*[A-Z-]+[ \t]+\[#[A-Z]\][ \t]+(.*)[ \t]+.*(:.*:)/\2/' | xargs)
	tags=$(echo "$line" | sed -E 's/.* (:.*:)$/\1/')

	if [[ -z "${seen[$title]}" ]] && [[ cnt -le 10 ]]; then
		if [ $first -eq 0 ]; then
			echo ","
		fi
		first=0

		printf '  {"status": %s, "priority": %s, "title": "%s", "tags": "%s", "deadline": "%s"}' \
			   "$(map_status $status)" "$(map_priority $priority)" "$title" "$tags" "$deadline"
		seen[$title]=1
		cnt=$((cnt+1))
	fi
	
done <<< "$deadlineTasks"$'\n'"$allTasks"
echo
echo "]"
