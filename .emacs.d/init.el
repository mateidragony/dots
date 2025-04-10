;;; init.el --- Main init
;;; Code:

(eval-when-compile
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
  (add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t)
  (add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
  (setq gnutls-algorithm-priority  "NORMAL:-VERS-TLS1.3" ;; bug fix for gnu
        package-enable-at-startup  nil
        package-archive-priorities '(("melpa"        . 200)
                                     ("elpa"         . 100)
                                     ("org"          . 75)
                                     ("nongnu"       . 65)
                                     ("gnu"          . 50)))  ;; Higher values are searched first.

  (require 'use-package)
  (put 'use-package 'lisp-indent-function 1)

  (use-package use-package-core
    :custom
    (use-package-minimum-reported-time 0.005)
    (use-package-enable-imenu-support t)))

(require 'custom-functions)

(require 'anzu-rcp)
(require 'base-rcp)
(require 'c-rcp)
(require 'company-rcp)
(require 'coq-rcp)
(require 'css-rcp)
(require 'deduce-rcp)
(require 'dired-rcp)
(require 'js-rcp)
(require 'json-rcp)
(require 'modeline-rcp)
(require 'org-rcp)
(require 'projectile-rcp)
(require 'racket-rcp)
(require 'server-rcp)
(require 'shell-rcp)
(require 'splash-rcp)
(require 'theme-rcp)
(require 'web-rcp)

(setq mc/emacs-init-time (float-time (time-subtract (current-time) before-init-time)))

;;; Commentary:
;; Main init file
;; Local Variables:
;; End:
;;; init.el ends here
(put 'upcase-region 'disabled nil)
