;;; c-rcp.el --- C configuration
;;; Code:

(use-package c-mode
  :hook (c-mode . eglot-ensure)
  :custom
  (comment-start "//")
  (comment-end "")
  :config
  (rainbow-identifiers-mode 0)
  (rainbow-delimiters-mode 1)
  (hs-minor-mode 1)
  )

(use-package c++-mode
  :hook (c++-mode . eglot-ensure))

(use-package objc-mode
  :hook (objc-mode . eglot-ensure))

(provide 'c-rcp)
;;; Commentary:
;; emacs c config
;; Local Variables:
;; End:
;;; c-rcp.el ends here
