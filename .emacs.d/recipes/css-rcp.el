;;; css-rcp.el --- Css configuration
;;; Code:

(use-package css
  :mode ("\\.rasi\\'" . css-mode)
  :hook ((css-mode . lsp-mode))
  )

(provide 'css-rcp)
;;; Commentary:
;; emacs css config
;; Local Variables:
;; End:
;;; css-rcp.el ends here
