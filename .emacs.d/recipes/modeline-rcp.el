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
	(`LaTeX-mode              "📜")
    (`makefile-mode           "Ⓜ️")
    (`makefile-automake-mode  "Ⓜ️")
    (`makefile-bsdmake-mode   "Ⓜ️")
    (`makefile-imake-mode     "Ⓜ️")
    (`makefile-makepp-mode    "Ⓜ️")
    (`makefile-gmake-mode     "Ⓜ️")
    (`markdown-mode           "👇")
    (`mhtml-mode              "🌐")
    (`objc-mode               "🌊")
    (`org-mode                "🦄")
    (`python-mode             "🐍")
    (`racket-mode             "🎾")
    (`sh-mode                 "🐢")
    (`shell-mode              "🐢")
    (`web-mode                "🌐")
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
	(`LaTeX-mode              " ")
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
    (`web-mode                " ")
    (t                        "󰦨 ")))

(defun mc/major-mode-name ()
  (cl-case major-mode
    (`c-mode                  "c")
	(`conf-mode               "conifg")
    (`conf-colon-mode         "conifg")
    (`conf-desktop-mode       "conifg")
    (`conf-javaprop-mode      "conifg")
    (`conf-ppd-mode           "conifg")
    (`conf-space-mode         "conifg")
    (`conf-toml-mode          "conifg")
    (`conf-unix-mode          "conifg")
    (`conf-windows-mode       "conifg")
    (`conf-xdefaults-mode     "conifg")
    (`cpp-mode                "c++")
    (`emacs-lisp-mode         "elisp")
    (`html-mode               "html")
    (`java-mode               "java")
    (`js-mode                 "js")
	(`latex-mode              "latex")
	(`LaTeX-mode              "latex")
    (`makefile-mode           "make")
    (`makefile-automake-mode  "make")
    (`makefile-bsdmake-mode   "make")
    (`makefile-imake-mode     "make")
    (`makefile-makepp-mode    "make")
    (`makefile-gmake-mode     "make")
    (`mhtml-mode              "html")
    (t                        (downcase mode-name))))


(defun mc/make-clickable (str command &optional help-echo)
  "Make STR clickable, running COMMAND on mouse-1."
  (let ((map (make-sparse-keymap)))
    (define-key map [mode-line mouse-1] command)
    (propertize str
                'local-map map
                'mouse-face 'mode-line-highlight
                'help-echo (or help-echo (symbol-name command)))))


(defun mode-line-left ()
  (list
   ;; insert or read-only
   (cond
    (buffer-read-only (propertize " READ ONLY " 'face (if (mc/line-selected-window-active-p)
														  'mode-line-active-ro
														'mode-line-inactive-ro)))
    ((buffer-modified-p) (propertize " *INSERT* " 'face (if (mc/line-selected-window-active-p)
															'mode-line-active-modified
														  'mode-line-inactive-modified)))
    (t (propertize " INSERT "  'face (if (mc/line-selected-window-active-p)
										 'mode-line-active-insert
									   'mode-line-inactive-insert))))
   ;; git version control
   (when-let (vc vc-mode)
     (list 
      (propertize (concat "  "(substring vc 5) " ")
                  'face 'mode-line-lighter-bg)))
   ;; buffer name
   (propertize " %b" 'face 'bold
               'help-echo (buffer-file-name))
   ;; file size
   " | %I"
   ;; anzu number of search matches
   (let ((anzu-line (format-mode-line anzu--mode-line-format)))
     (if (> (length anzu-line) 0)
		 (concat " | " anzu-line)
       ""))
   ))

(defun mode-line-right ()
  (list
   ;; live server
   (let ((root (project-root (project-current nil))))
	 (if root
		 (let* ((name (file-name-nondirectory
					   (directory-file-name
						(file-name-directory (expand-file-name root)))))
				(server (assoc name live-server-alist)))
		   (if server
			   (mc/make-clickable
				(concat "󰀂 port: " (car (cdr (car (cdr server)))) " | ")
				'live-server-kill
				"mouse-1: stop live server")
			 (mc/make-clickable
			  (concat "󰯡 server off | ")
			  'live-server-start
			  "mouse-1: start live server")))
	   ""))
   
   ;; the current major mode
   (concat (mc/major-mode-icon-emoji) " " (mc/major-mode-name) "  ")
   ;; line column
   (propertize " %p " 'face 'mode-line-lighter-bg)
   (cond

    (buffer-read-only (propertize "  %l:%c  " 'face (if (mc/line-selected-window-active-p)
														'mode-line-active-ro
													  'mode-line-inactive)))
    ((buffer-modified-p) (propertize "  %l:%c  " 'face (if (mc/line-selected-window-active-p)
														   'mode-line-active-modified
														 'mode-line-inactive)))
    (t (propertize "  %l:%c  "  'face (if (mc/line-selected-window-active-p)
										  'mode-line-active-insert
										'mode-line-inactive))))
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
