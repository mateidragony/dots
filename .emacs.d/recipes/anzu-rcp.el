;;; anzu-rcp.el --- Anzu configuration
;;; Code:

(use-package anzu
  :ensure t
  :custom
  (anzu-cons-mode-line-p nil)
  )

(global-set-key [remap query-replace] 'anzu-query-replace)
(global-set-key [remap isearch-query-replace] 'anzu-isearch-query-replace)
(global-anzu-mode 1)

(provide 'anzu-rcp)
;;; Commentary:
;; emacs anzu config
;; Local Variables:
;; End:
;;; anzu-rcp.el ends here
