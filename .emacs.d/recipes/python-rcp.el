;;; python-rcp.el --- Python configuration
;;; Code:

(use-package python
  :ensure t
  :hook (python-mode . lsp-mode)
  :custom
  (python-indent-offset 2))

(provide 'python-rcp)
;;; Commentary:
;; emacs python config
;; Local Variables:
;; End:
;;; python-rcp.el ends here

