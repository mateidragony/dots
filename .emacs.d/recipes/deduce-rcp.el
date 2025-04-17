;;; deduce-rcp.el --- Deduce configuration
;;; Code:

(require 'lsp-mode)

(use-package deduce-mode
  :init
  (setq deduce-path "~/Projects/deduce-stuff/deduce/deduce.py")
  :mode ("\\.pf\\'" "\\.thm\\'")
  )

(require 'lsp-mode)

(add-to-list 'lsp-language-id-configuration '(deduce-mode . "deduce"))
(lsp-register-client
 (make-lsp-client
  :new-connection (lsp-stdio-connection '("python" "/home/mateidragony/Projects/deduce-stuff/deduce-lsp/bundled/tool/lsp_runner.py"))
  :activation-fn (lsp-activate-on "deduce")
  :server-id 'deduce-lsp
  :completion-in-comments? t))

(provide 'deduce-rcp)
;;; Commentary:
;; emacs deduce config
;; Local Variables:
;; End:
;;; deduce-rcp.el ends here
