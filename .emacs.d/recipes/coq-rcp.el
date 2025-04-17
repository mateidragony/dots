;;; coq-rcp.el --- Coq configuration
;;; Code:

(use-package company-coq
  :ensure t
  )

(use-package coq
  :hook
  (coq-mode-hook . coq-start)
  :bind
  (:map coq-mode-map
		("M-<down>"      . scroll-up-line)
		("M-<up>"        . scroll-down-line)
		("C-c C-<right>" . proof-assert-next-command-interactive))
  :custom
  (proof-splash-enable nil)
  (coq-compile-before-require t)
  )

(global-prettify-symbols-mode 1)
(add-hook 'coq-mode-hook #'company-coq-mode)

(provide 'coq-rcp)
;;; Commentary:
;; emacs coq config
;; Local Variables:
;; End:
;;; coq-rcp.el ends here
