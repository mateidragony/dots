;;; prog-rcp.el --- Prog configuration
;;; Code:

(use-package prog-mode
  :bind (("C-x <down>"   . hs-hide-block)
	 ("C-x <up>"     . hs-show-block)
	 ("C-x C-<down>" . hs-hide-all)
	 ("C-x C-<up>"   . hs-show-all))
  :config
  (hs-minor-mode 1)
  )

(provide 'prog-rcp)
;;; Commentary:
;; emacs prog config
;; Local Variables:
;; End:
;;; prog-rcp.el ends here
