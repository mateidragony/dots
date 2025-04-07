;;; dired-rcp.el --- Dired configuration
;;; Code:

(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :init
  (add-hook 'dired-sidebar-mode-hook
            (lambda ()
	      (display-line-numbers-mode 0)
              (unless (file-remote-p default-directory)
                (auto-revert-mode))))
  :config
  (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
  (push 'rotate-windows dired-sidebar-toggle-hidden-commands)
  (setq dired-sidebar-use-term-integration t)
  (setq dired-sidebar-use-custom-font 0)
  (setq dired-sidebar-width 25)
  )

(provide 'dired-rcp)
;;; Commentary:
;; emacs dired config
;; Local Variables:
;; End:
;;; dired-rcp.el ends here
