;;; dired-rcp.el --- Dired configuration
;;; Code:

(use-package nerd-icons :defer t)
(use-package nerd-icons-dired
  :commands (nerd-icons-dired-mode))

(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :commands (dired-sidebar-toggle-sidebar)
  :init
  (add-hook 'dired-sidebar-mode-hook
	    (display-line-numbers-mode 0)
            (lambda ()
              (unless (file-remote-p default-directory)
                (auto-revert-mode))))

  :custom
  (dired-sidebar-use-term-integration t)
  (dired-sidebar-use-custom-font t)
  (dired-sidebar-subtree-line-prefix "__")
  (dired-sidebar-theme 'vscode)
  (dired-sidebar-width 20)
  (dired-sidebar-icon-scale 0)
  :config
  (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
  (push 'rotate-windows dired-sidebar-toggle-hidden-commands)
  )

(provide 'dired-rcp)
;;; Commentary:
;; emacs dired config
;; Local Variables:
;; End:
;;; dired-rcp.el ends here
