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
  (org-directory                 "~/org")
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
	 ("p515" . nil)
	 ("m405" . nil)
	 ("i365" . nil)
	 ("r211" . nil)
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
   '((sequence "TODO(t)" "PLANNING(p)" "IN-PROGRESS(i@/!)" "BLOCKED(b@)" "|" "DONE(d!)" "WONT-DO(w@/!)")))
  (org-todo-keyword-faces
   '(("TODO"        . (:foreground "#9b0a12" :weight bold))   ;; red
	 ("PLANNING"    . (:foreground "#a331bc" :weight bold))   ;; pink
     ("IN-PROGRESS" . (:foreground "#09629e" :weight bold))   ;; cyan
     ("BLOCKED"     . (:foreground "#6d070c" :weight bold))   ;; dark red
     ("DONE"        . (:foreground "#088d17" :weight bold))   ;; green
	 ("WONT-DO"     . (:foreground "#6d645e" :weight bold)))) ;; gray
  
  (org-capture-templates
   '(("g" "General To-Do"
      entry (file+headline "~/org/todos.org" "General Tasks")
      "* TODO [#C] %?\n:Created: %U\n "
      :empty-lines 1)
	 ))

  (org-agenda-todo-keyword-format "%-12s")
  (org-agenda-deadline-leaders '("Due today" "Due in %d days" ""))
  (org-agenda-scheduled-leaders '("" "S%3d: "))
  (org-agenda-prefix-format   
   '((agenda . " %-10:c  %-15s %?t ")
     (timeline . "% s")
     (todo . " %i %e ")
     (tags . " %i %e ")
     (search . " %i %e ")
	 ))
  )

(use-package org-fancy-priorities
  :ensure t
  :hook
  (org-mode . org-fancy-priorities-mode)
  :custom
  (org-fancy-priorities-list '((?A . "‼ ")
							   (?B . "󰜷 ")
							   (?C . "󰜮 ")
							   (?D . "󰅟 "))))



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
     ;; classes
     (:order-multi (2 (:name "Introduction to verification "
                             :and (:tag "classes" :tag "p515"))
					  (:name "Number theory "
                             :and (:tag "classes" :tag "m405"))
					  (:name "Javascript "
                             :and (:tag "classes" :tag "i365"))
					  (:name "Sports and rhetoric "
                             :and (:tag "classes" :tag "r211"))))
	 ;; ta
	 (:order-multi (3 (:name "Data structures (TA) "
                             :and (:tag "ta" :tag "c343"))
					  (:name "Operating systems (TA) "
                             :and (:tag "classes" :tag "p436"))))
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
