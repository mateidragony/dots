;;; js-rcp.el --- Js configuration
;;; Code:

(use-package js
  :ensure t
  :hook ((js-mode . eglot-ensure)
		 (js-mode . hs-minor-mode))
  )

(use-package typescript-mode
  :ensure t
  :hook ((typescript-mode . eglot-ensure)
		 (typescript-mode . hs-minor-mode))
  )

(provide 'js-rcp)
;;; Commentary:
;; emacs js config
;; Local Variables:
;; End:
;;; js-rcp.el ends here
