;;; projectile-rcp.el --- Projectile configuration
;;; Code:

(use-package projectile
  :ensure t
  :bind (("C-c p" . projectile-command-map))
  :custom
  (projectile-project-search-path '("~/Documents/projects/"))
  )

(projectile-mode 1)

(provide 'projectile-rcp)
;;; Commentary:
;; emacs projectile config
;; Local Variables:
;; End:
;;; projectile-rcp.el ends here
