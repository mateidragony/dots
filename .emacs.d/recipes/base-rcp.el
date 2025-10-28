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
  ("C-x C-1"        . delete-other-windows) ;; fat-finger
  ("C-x C-2"        . split-window-below)   ;; fat-finger
  ("C-x C-3"        . split-window-right)   ;; fat-finger
  ("C-x C-o"        . other-window)         ;; fat-finger
  ("<Copy>"         . kill-ring-save)
  ("<Paste>"        . clipboard-yank)
  ("C-s"            . mc/isearch-forward)
  ("M-%"            . mc/query-replace)
  ("C-`"            . mc/toggle-shell)
  ("C-x <left>"     . switch-to-prev-buffer)
  ("C-x <right>"    . switch-to-next-buffer)
  :hook
  (after-save . executable-make-buffer-file-executable-if-script-p) ;; Make shebang (#!) file executable when saved
  (kill-emacs . mc/quicksave-session)
  (kill-emacs . live-server-killall)
  )

(use-package window
  :demand t
  :custom
  (switch-to-prev-buffer-skip-regexp '("\\*")))

(use-package display-line-numbers
  :demand t
  :hook (prog-mode text-mode fundamental-mode)
  :custom
  (display-line-numbers-type t)
  )

(use-package fringe
  :demand t
  :config
  (fringe-mode '(8 . 1))
  )

(use-package nerd-icons
  :ensure t
  :demand t)

(use-package persp-mode
  :ensure t)

(use-package prog-mode
  :hook
  (prog-mode . mc/highlight-todos)
  )

(use-package rainbow-delimiters
  :ensure t
  :demand t
  :config
  (rainbow-delimiters-mode t)
  )

(use-package shell
  :config
  (setq comint-process-echoes t))

(provide 'base-rcp)
;;; Commentary:
;; Local Variables:
;; End:
;; Configuration for base Emacs without packages
;;; base-rcp.el ends here
