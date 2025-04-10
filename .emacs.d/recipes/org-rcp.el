;;; org-rcp.el --- Org configuration
;;; Code:

(use-package org
  :ensure t
  :mode ("\\.org\\'" . org-mode)
  :custom
  (org-directory "~/org")
  (org-support-shift-select t)
  (org-todo-keywords '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))
  (org-todo-keyword-faces
   '(("TODO" . org-warning)
     ("IN-PROGRESS" . org-priority)
     ("WAITING"     . org-formula)
     ("DONE"        . org-done)))
  :bind
  (:map org-mode-map
	("C-c a" . org-agenda))
  )


(provide 'org-rcp)
;;; Commentary:
;; emacs org config
;; Local Variables:
;; End:
;;; org-rcp.el ends here
