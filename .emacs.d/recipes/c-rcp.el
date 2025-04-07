;;; c-rcp.el --- C configuration
;;; Code:

(use-package irony
  :hook (irony-mode . irony-cdb-autosetup-compile-options)
  )

(use-package c-mode
  :bind (("C-x <down>"   . hs-hide-block)
	 ("C-x <up>"     . hs-show-block)
	 ("C-x C-<down>" . hs-hide-all)
	 ("C-x C-<up>"   . hs-show-all))
  :hook
  ((c-mode . irony-mode)
   (c-mode . company-mode))
  :custom
  (comment-start "//")
  (comment-end "")
  :config
  (rainbow-identifiers-mode 0)
  (rainbow-delimiters-mode 1)
  (hs-minor-mode 1)
  )

(use-package c++-mode
  :hook
  ((c++-mode . irony-mode)
   (c++-mode . company-mode)))

(use-package objc-mode
  :hook
  ((objc-mode . irony-mode)
   (objc-mode . company-mode)))

(provide 'c-rcp)
;;; Commentary:
;; emacs c config
;; Local Variables:
;; End:
;;; c-rcp.el ends here
