;;; tex-rcp.el --- Tex configuration
;;; Code:

(use-package auctex
  :defer t)

(use-package pdf-tools
  :defer t
  :config
  (pdf-tools-install)
  )

(setq TeX-output-dir "out")

(use-package tex
  :hook
  ((LaTeX-mode . company-mode))
  :custom
  (TeX-PDF-mode t)
  (TeX-auto-save t)
  (TeX-parse-self t)
  (TeX-view-program-selection '((output-pdf "PDF Tools")))
  (TeX-source-correlate-start-server t)
  (TeX-command-extra-options (concat "-output-directory=" TeX-output-dir))
  (TeX-view-file (concat TeX-output-dir "/" (file-name-sans-extension (TeX-master-file)) ".pdf"))
  :config
  (setq-default TeX-master nil)
  )

(use-package company-auctex
  :ensure t
  :after (company tex)
  :config
  (company-auctex-init))

(setq doc-view-continuous t)

(add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)
(add-hook 'after-save-hook
		  (lambda ()
			(when (equal major-mode 'LaTeX-mode)
			  (TeX-command "LaTeX" 'TeX-master-file))))

(provide 'tex-rcp)
;;; Commentary:
;; emacs tex config
;; Local Variables:
;; End:
;;; tex-rcp.el ends here
