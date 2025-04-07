;;; coq-rcp.el --- Coq configuration
;;; Code:

(use-package coq
  :bind
  ("M-<down>" . scroll-up-line)
  ("M-<up>"   . scroll-down-line)
  :hook
  (coq-mode-hook . coq-start)
  :custom
  (proof-splash-enable nil)
  (coq-compile-before-require t)
  )

(provide 'coq-rcp)
;;; Commentary:
;; emacs coq config
;; Local Variables:
;; End:
;;; coq-rcp.el ends here
