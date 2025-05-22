;;; sidebar-rcp.el --- Sidebar configuration
;;; Code:

(use-package sidebar
  :ensure t
  ;; :hook
  ;; ((sidebar-buffers-mode . visual-line-mode))
  :bind
  (("C-x C-b" . 'sidebar-buffers-open)
   ("C-x C-n" . 'sidebar-open)
   :map sidebar-mode-map
   ("<ESC>"      . 'sidebar-up-directory)
   ("RET"        . 'sidebar-open-line-expand-or-close-dir)
   ("<return>"   . 'sidebar-open-line-expand-or-close-dir)
   ("C-<return>" . 'sidebar-open-line)
   ("<left>"     . 'sidebar-open-line-expand-or-close-dir)
   ("<right>"    . 'sidebar-open-line-expand-or-close-dir)
   )
  :custom
  (sidebar-status-on-file nil)
  (sidebar-status-on-directory 'never)
  (sidebar-filename-colored t)
  (sidebar-icon-dir-closed 'fa_folder)
  (sidebar-icon-dir-opened 'fa_folder_open)
  (sidebar-icon-header-end '(myicons_0002 1))
  (sidebar-icons-modeline '(myicons_0002 myicons_0004 0))
  (sidebar-width 30)
  )

(provide 'sidebar-rcp)
;;; Commentary:
;; emacs sidebar config
;; Local Variables:
;; End:
;;; sidebar-rcp.el ends here
