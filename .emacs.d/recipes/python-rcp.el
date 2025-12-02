;;; python-rcp.el --- Python configuration
;;; Code:

(use-package python
  :ensure t
  :hook ((python-mode . eglot-ensure))
  :custom
  (python-indent-offset 4))

(provide 'python-rcp)
;;; Commentary:
;; emacs python config
;; Local Variables:
;; End:
;;; python-rcp.el ends here

