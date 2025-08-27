;;; early-init.el --- Pre init config
;;; Code:

;; Increase the GC threshold for faster startup
;; The default is 800 kilobytes.  Measured in bytes.
;; Set garbage collection threshold to 1GB.
(setq gc-cons-threshold (if (display-graphic-p) (* 1024 1024 512) (* 1024 1024 128))
      gc-cons-percentage 0.8)

;; startup speed optimization.
(setq file-name-handler-alist nil)

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 1024 1024 8)
                  gc-cons-percentage 0.1
                  file-name-handler-alist file-name-handler-alist)))

(add-function :after after-focus-change-function
	      (lambda ()
		(unless (frame-focus-state)
		  (garbage-collect))))

;; Default locations is in system cache directory.
(setq-default mc/emacs-config-directory (file-name-directory load-file-name)
	      custom-file               (expand-file-name "custom.el" user-emacs-directory))

(load custom-file :noerror)

(add-to-list 'exec-path "~/.cabal/bin/")
(add-to-list 'custom-theme-load-path (expand-file-name "themes/"  mc/emacs-config-directory))
(add-to-list 'load-path (expand-file-name "themes/"  mc/emacs-config-directory))
(add-to-list 'load-path (expand-file-name "recipes/" mc/emacs-config-directory))
(add-to-list 'load-path (expand-file-name "load/"  mc/emacs-config-directory))
(add-to-list 'load-path "~/.local/share/icons-in-terminal/")
(add-to-list 'load-path (expand-file-name "~/.emacs.d/emacs-livedown"))

(let ((default-directory "~/.emacs.d/load/")) (normal-top-level-add-subdirs-to-load-path))

(let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" ""
						   (shell-command-to-string "/bin/zsh --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator)))

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda --emacs-mode locate")))

(setq-default  auto-window-vscroll                   nil
     	       byte-compile-warnings                 '(not obsolete lexical)
	           frame-inhibit-implied-resize          t
	           frame-resize-pixelwise                t  ;; Default frame configuration: full screen
    	       inhibit-x-resources                   t
    	       package-enable-at-startup             t
    	       process-adaptive-read-buffering       nil ;; speadup emacs
			   site-run-file                         nil
			   warning-suppress-log-types            '((comp) (bytecomp)))

(setq      x-select-enable-clipboard             t
           custom-safe-themes                    t
           make-backup-files                     nil
	       completion-ignore-case                t
	       read-file-name-completion-ignore-case t
	       read-buffer-completion-ignore-case    t
	       bookmark-save-flag                    t
	       mode-line-format                      nil
	       suggest-key-bindings                  nil
	       tab-width                             4)


(modify-all-frames-parameters '((width                    . 100)
                                (height                   . 100)
								(background-color         . "#F4D39A")  ;; change if theme changes
                                (alpha-background         . 100)
								(cursor-color             . "#51afef")
                                (font                     . "JetBrainsMono Nerd Font-12")
                                (fullscreen               . maximized)
                                (inhibit-double-buffering . t)
                                (internal-border-width    . 1)
                                (ns-appearance            . light)
                                (tool-bar-lines           . 0)
                                (vertical-scroll-bars     . nil)))


(set-window-scroll-bars (minibuffer-window) nil nil)
(set-default-coding-systems 'utf-8) ;; Set default coding system (especially for Windows)

(blink-cursor-mode                  t)
(column-number-mode                 t)
(global-font-lock-mode              t)
(electric-pair-mode                 t)
(recentf-mode                       t)
(menu-bar-mode                      -1)
(tool-bar-mode                      -1)
(global-prettify-symbols-mode       -1)

(defvar mc/emacs-init-time nil
  "The time it took, in seconds (as a float), for Emacs to start up.")

;; Make the initial buffer load faster by setting its mode to fundamental-mode
(setq initial-major-mode 'fundamental-mode)

;;; Commentary:
;; Local Variables:
;; End:
;;; early-init.el ends here
