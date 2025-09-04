;;; org-rcp.el --- Org configuration
;;; Code:

(use-package org
  :ensure t
  :mode ("\\.org\\'" . org-mode)
  :bind
  (("C-c a"  . org-agenda)
   ("C-c l"  . org-store-link)
   ("C-c c"  . org-capture)
   (:map org-mode-map)
   ("C-<up>"   . org-metaup)
   ("C-<down>" . org-metadown)
   ("M-<down>" . scroll-up-line)
   ("M-<up>"   . scroll-down-line)
   )
  :custom
  (org-directory                 "~/Org")
  (org-log-done                  'time)
  (org-return-follows-link       t)
  (org-support-shift-select      t)
  (org-startup-indented          t)

  (org-tag-alist
   '(("classes" . nil)
	 ("home"    . nil)
	 ("ta"      . nil)
	 ("deduce"  . nil)
	 ("ids"     . nil)
	 ("fun"     . nil)
	 ("config"  . nil)
	 (:startgroup . nil)
	 ("q370" . nil)
	 ("b557" . nil)
	 ("e315" . nil)
	 ("m403" . nil)
	 (:endgroup . nil)
	 (:startgroup . nil)
	 ("c343" . nil)
	 ("p436" . nil)
	 (:endgroup . nil)
	 ))
  (org-tag-faces
   '(("classes"   . (:foreground "#bf70ba"))   ;; pink
	 ("home"      . (:foreground "#c48a58"))   ;; orange
	 ("ta"        . (:foreground "#7078bf"))   ;; dark blue
	 ("deduce"    . (:foreground "#559b5b"))   ;; green
	 ("ids"       . (:foreground "#bf7070"))   ;; red
	 ("fun"       . (:foreground "#57938f"))   ;; light blue
	 ("config"    . (:foreground "#9e70bf")))) ;; purple

  (org-priority-highest          ?A)
  (org-priority-lowest           ?D)
  (org-priority-default          ?C)
  (org-priority-faces
   '((?A . (:foreground "#9b0a12" :weight bold ))   ;; red
     (?B . (:foreground "#c9431e" :weight bold))    ;; orange
     (?C . (:foreground "#088d17" :weight bold))    ;; green 
	 (?D . (:foreground "#0076c5" :weight bold))))  ;; blue

  (org-todo-keywords
   '((sequence "TODO(t)" "PLANNING(p)" "IN-PROGRESS(i@/!)" "BLOCKED(b@)" "WAITING(w@!)" "|" "DONE(d!)" "WONT-DO(x@/!)")))
  (org-todo-keyword-faces
   '(("TODO"        . (:inherit 'org-todo-keyword-todo))
	 ("PLANNING"    . (:inherit 'org-todo-keyword-planning))
     ("IN-PROGRESS" . (:inherit 'org-todo-keyword-in-progress))
     ("BLOCKED"     . (:inherit 'org-todo-keyword-blocked))
	 ("WAITING"     . (:inherit 'org-todo-keyword-waiting))
     ("DONE"        . (:inherit 'org-todo-keyword-done))
	 ("WONT-DO"     . (:inherit 'org-todo-keyword-wont-do))))
  
  (org-capture-templates
   '(("g" "General To-Do"
      entry (file+headline "~/Org/todos.org" "General Tasks")
      "* TODO [#C] %?\n:Created: %U\n "
      :empty-lines 1)
	 ))

  (org-agenda-todo-keyword-format "%-12s")
  (org-agenda-deadline-leaders '("Due today" "Due in %d days" ""))
  (org-agenda-scheduled-leaders '("For today" "%d days from now"))
  (org-agenda-prefix-format   
   '((agenda . "  %-16s %?-14t ")
     (timeline . "% s")
     (todo . " %i %s %e ")
     (tags . " %i %e ")
     (search . " %i %e ")
	 ))
  (org-agenda-custom-commands
   '(("a" "Agenda daily view"
      ((agenda "" ((org-agenda-span 'day)))))
	 ("o" "Overview of day agenda and tasks"
      ((agenda "" ((org-agenda-span 'day)))
	   (todo "")))))
  
  )

(use-package org-fancy-priorities
  :ensure t
  :hook
  (org-mode . org-fancy-priorities-mode)
  :custom
  (org-fancy-priorities-list '((?A . " ‼  ")
							   (?B . " 󰜷  ")
							   (?C . " 󰜮  ")
							   (?D . " 󰅟  "))))


(use-package org-super-agenda
  :ensure t
  :custom
  (org-super-agenda-final-group-separator "")
  (org-super-agenda-header-separator "")
  (org-super-agenda-groups
   '((:name "Today " 
            :time-grid t 
            :todo "TODAY")
     (:name "Important "
            :priority>= "B")
	 (:name "Classes"
			:order 2
			:tag "classes")
	 (:name "TA"
			:order 3
			:tag "ta")
	 (:name "Blocked tasks "
			:todo "BLOCKED" :order 8)
     (:name "Less important "
			:priority "C"
            :order 4)
	 (:name "Blue sky "
			:priority "D"
			:order 10)
     )))

(org-super-agenda-mode 1)


(provide 'org-rcp)
;;; Commentary:
;; emacs org config
;; Local Variables:
;; End:
;;; org-rcp.el ends here
