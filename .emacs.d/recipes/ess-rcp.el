;;; ess-rcp.el --- R/ESS configuration
;;; Code:

(require 'ess)

(use-package ess
  :ensure t)

(with-eval-after-load 'ess-r-mode
  (define-key inferior-ess-r-mode-map (kbd "C-l") #'mc/clear-buffer))

(provide 'ess-rcp)
;;; Commentary:
;; emacs r/ess config
;; Local Variables:
;; End:
;;; ess-rcp.el ends here
