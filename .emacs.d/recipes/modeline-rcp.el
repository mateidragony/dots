;; -*- lexical-binding: t -*-
;;; modeline-rcp.el --- emacs modeline configuration 
;; Big thanks to https://occasionallycogent.com/custom_emacs_modeline/index.html
;;; Code:


;; Keep track of selected window, so we can render the modeline differently
(defvar mc/line-selected-window (frame-selected-window))
(defun mc/line-set-selected-window (&rest _args)
  (when (not (minibuffer-window-active-p (frame-selected-window)))
    (setq mc/line-selected-window (frame-selected-window))
    (force-mode-line-update)))
(defun mc/line-unset-selected-window ()
  (setq mc/line-selected-window nil)
  (force-mode-line-update))

(add-hook 'window-configuration-change-hook #'mc/line-set-selected-window)
(add-hook 'focus-in-hook #'mc/line-set-selected-window)
(add-hook 'focus-out-hook #'mc/line-unset-selected-window)
(advice-add 'handle-switch-frame :after #'mc/line-set-selected-window)
(advice-add 'select-window :after #'mc/line-set-selected-window)

(defun mc/line-selected-window-active-p ()
  (eq mc/line-selected-window (selected-window)))

(defun mc/major-mode-icon-emoji ()
  (cl-case major-mode
    (`asm-mode                "💾")
    (`c-mode                  "🌊")
    (`conf-mode               "⚙️")
    (`conf-colon-mode         "⚙️")
    (`conf-desktop-mode       "⚙️")
    (`conf-javaprop-mode      "⚙️")
    (`conf-ppd-mode           "⚙️")
    (`conf-space-mode         "⚙️")
    (`conf-toml-mode          "⚙️")
    (`conf-unix-mode          "⚙️")
    (`conf-windows-mode       "⚙️")
    (`conf-xdefaults-mode     "⚙️")
    (`coq-mode                "🐔")
    (`css-mode                "💃")
    (`c++-mode                "🌊")
    (`deduce-mode             "🦛")
    (`doc-view-mode           "📄")
    (`emacs-lisp-mode         "🐃")
    (`eshell-mode             "🐢")
    (`gitconfig-mode          "🌳")
    (`gitignore-mode          "🌳")
    (`haskell-mode            "👦")
    (`html-mode               "🌐")
    (`java-mode               "☕")
    (`js-mode                 "☕")
    (`json-mode               "🚧")
    (`latex-mode              "📜")
    (`makefile-mode           "Ⓜ️")
    (`makefile-automake-mode  "Ⓜ️")
    (`makefile-bsdmake-mode   "Ⓜ️")
    (`makefile-imake-mode     "Ⓜ️")
    (`makefile-makepp-mode    "Ⓜ️")
    (`makefile-gmake-mode     "Ⓜ️")
    (`markdown-mode           "📉")
    (`mhtml-mode              "🌐")
    (`objc-mode               "🌊")
    (`org-mode                "🦄")
    (`python-mode             "🐍")
    (`racket-mode             "🎾")
    (`sh-mode                 "🐢")
    (`shell-mode              "🐢")
    (t                        "📄")))

(defun mc/major-mode-icon ()
  (cl-case major-mode
    (`asm-mode                " ")
    (`c-mode                  " ")
    (`conf-mode               " ")
    (`conf-colon-mode         " ")
    (`conf-desktop-mode       " ")
    (`conf-javaprop-mode      " ")
    (`conf-ppd-mode           " ")
    (`conf-space-mode         " ")
    (`conf-toml-mode          " ")
    (`conf-unix-mode          " ")
    (`conf-windows-mode       " ")
    (`conf-xdefaults-mode     " ")
    (`coq-mode                " ")
    (`css-mode                " ")
    (`c++-mode                " ")
    (`deduce-mode             " ")
    (`doc-view-mode           "󰈙 ")
    (`emacs-lisp-mode         " ")
    (`eshell-mode             " ")
    (`gitconfig-mode          "󰊢 ")
    (`gitignore-mode          "󰊢 ")
    (`haskell-mode            " ")
    (`html-mode               " ")
    (`java-mode               " ")
    (`js-mode                 " ")
    (`json-mode               " ")
    (`latex-mode              " ")
    (`makefile-mode           " ")
    (`makefile-automake-mode  " ")
    (`makefile-bsdmake-mode   " ")
    (`makefile-imake-mode     " ")
    (`makefile-makepp-mode    " ")
    (`makefile-gmake-mode     " ")
    (`markdown-mode           " ")
    (`mhtml-mode              " ")
    (`objc-mode               " ")
    (`org-mode                " ")
    (`python-mode             " ")
    (`racket-mode             "󰶠 ")
    (`sh-mode                 " ")
    (`shell-mode              " ")
    (t                        "󰦨 ")))

(defun mc/major-mode-name ()
  (cl-case major-mode
    (`c-mode                  "c")
    (`cpp-mode                "c++")
    (`emacs-lisp-mode         "elisp")
    (`html-mode               "html")
    (`java-mode               "java")
    (`js-mode                 "js")
    (`makefile-mode           "make")
    (`makefile-automake-mode  "make")
    (`makefile-bsdmake-mode   "make")
    (`makefile-imake-mode     "make")
    (`makefile-makepp-mode    "make")
    (`makefile-gmake-mode     "make")
    (`mhtml-mode              "html")
    (t                        (downcase mode-name))))

(defface modeline-highlighted-insert '((t (:foreground "#f2f2f2" :background "#7522d3" :weight bold)))
  "Face used for editing mode")

(defface modeline-highlighted-modified '((t (:foreground "#f2f2f2" :background "#9c52f2" :weight bold)))
  "Face used for editing mode (its always insert mode :D)")

(defface modeline-highlighted-ro '((t (:foreground "#f2f2f2" :background "#e45649" :weight bold)))
  "Face used for editing mode (its always insert mode :D)")

(defface modeline-lighter-bg '((t (:background "#f4cb89")))
  "Lighter background for modeline")

(defface modeline-buffer-name '((t (:weight bold)))
  "Face used for modeline buffer name")

;; percentage in file

(defun mode-line-left ()
  (list
   ;; insert or read-only
   (cond
    (buffer-read-only    (propertize " READ ONLY " 'face 'modeline-highlighted-ro))
    ((buffer-modified-p) (propertize " *INSERT* " 'face 'modeline-highlighted-modified))
    (t                   (propertize " INSERT "  'face 'modeline-highlighted-insert)))
   ;; git version control
   (when-let (vc vc-mode)
     (list 
      (propertize (concat "  "(substring vc 5) " ")
                  'face 'modeline-lighter-bg)))
   ;; buffer name
   (propertize " %b" 'face 'modeline-buffer-name
               'help-echo (buffer-file-name))
   ;; file size
   " (%I) "
   ))

(defun mode-line-right ()
  (list
   ;; encoding
   " %Z |"
   ;; the current major mode
   (concat " " (mc/major-mode-icon-emoji) " " (mc/major-mode-name) "  ")
   ;; line column
   (propertize " %p " 'face 'modeline-lighter-bg)
   (cond
    (buffer-read-only    (propertize "  %l:%c  " 'face 'modeline-highlighted-ro))
    ((buffer-modified-p) (propertize "  %l:%c  " 'face 'modeline-highlighted-modified))
    (t                   (propertize "  %l:%c  "  'face 'modeline-highlighted-insert)))
   ))

(defun mode-line-middle-space ()
  (let ((r-length (- (length (format-mode-line (mode-line-right))) 0)))
    (propertize " "
		'display `((space :align-to (- right ,r-length))))
    ))

;; mode line config
(setq-default mode-line-format
              (list
               '(:eval (mode-line-left))
	       '(:eval (mode-line-middle-space))
	       '(:eval (mode-line-right))))

(provide 'modeline-rcp)
;;; Commentary:
;; emacs modeline config
;; Local Variables:
;; End:
;;; modeline-rcp.el ends here
