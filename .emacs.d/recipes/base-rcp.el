;;; base-rcp.el --- Emacs default configuration
;;; Code:
(eval-when-compile (require 'use-package))

(use-package emacs
  :demand t
  :custom
  (initial-scratch-message "")
  :config
  (defalias 'yes-or-no-p     'y-or-n-p)
  :bind
  ("M-<down>"       . scroll-up-line)
  ("M-<up>"         . scroll-down-line)
  ("C-c C-<left>"   . shrink-window-horizontally)
  ("C-c C-<right>"  . enlarge-window-horizontally)
  ("C-c C-<down>"   . shrink-window)
  ("C-c C-<up>"     . enlarge-window)
  ("<Copy>"         . kill-ring-save)
  ("<Paste>"        . clipboard-yank)
  ("C-s"            . mc/isearch-forward)
  ("M-%"            . mc/query-replace)
  :hook
  (after-save . executable-make-buffer-file-executable-if-script-p) ;; Make shebang (#!) file executable when saved
  (kill-emacs . mc/quicksave-session)
  (kill-emacs . live-server-kill)
  )

(use-package display-line-numbers
  :demand t
  :custom
  (display-line-numbers-type t)
  :config
  (global-display-line-numbers-mode t)
  )

(use-package fringe
  :demand t
  :config
  (fringe-mode '(8 . 1))
  )

(use-package prog-mode
  :hook
  (prog-mode . mc/highlight-todos)
  )

(use-package rainbow-delimiters
  :demand t
  :config
  (rainbow-delimiters-mode t)
  )

(provide 'base-rcp)
;;; Commentary:
;; Local Variables:
;; End:
;; Configuration for base Emacs without packages
;;; base-rcp.el ends here
