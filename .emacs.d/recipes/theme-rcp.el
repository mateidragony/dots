;;; theme-rcp.el --- Emacs theme configuration
;;; Code:

(use-package autothemer
  :ensure t)

(setq theme 'colorful-sepia)
(load-theme theme t)

(use-package spacious-padding
  :ensure t
  :custom
  (setq spacious-padding-widths
      '( :internal-border-width 1
         :header-line-width 1
         :mode-line-width 0
         :tab-width 1
         :right-divider-width 1
         :scroll-bar-width 0
         :fringe-width 1)))

(spacious-padding-mode 0)

(setq window-divider-default-places 'right-only)
(setq window-divider-default-right-width 6)
(setq window-divider-default-bottom-width 6)
(window-divider-mode 1)

(provide 'theme-rcp)
;;; Commentary:
;; Local Variables:
;; End:
;; Configuration for Emacs theme
;;; theme-rcp.el ends here
