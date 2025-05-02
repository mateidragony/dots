;;; js-rcp.el --- Js configuration
;;; Code:

(use-package js
  :ensure t
  :hook ((js-mode . lsp-mode)
		 (js-mode . hs-minor-mode))
  )

(use-package typescript-mode
  :ensure t
  :hook ((typescript-mode . lsp-mode)
		 (typescript-mode . hs-minor-mode))
  )

(provide 'js-rcp)
;;; Commentary:
;; emacs js config
;; Local Variables:
;; End:
;;; js-rcp.el ends here
