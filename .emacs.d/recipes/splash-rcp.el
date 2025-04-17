;; -*- lexical-binding: t -*-
;;; splash-rcp.el --- An alternative splash screen 
;;; Code:
(require 'cl-lib)
(require 'nerd-icons)

(setq ss-functions (list #'ss-emacs-0 #'ss-emacs-1 #'ss-emacs-2))
(defvar ss-ascii (nth (random (length ss-functions)) ss-functions))

(defface dashboard-menu-title '((t (:inherit font-lock-keyword-face)))
  "Face used for splash screen dashboard")

(defface dashboard-menu-desc '((t (:inherit font-lock-constant-face)))
  "Face used for the key description of menu widgets on the dashboard")

(defface dashboard-menu-desc '((t (:inherit font-lock-constant-face)))
  "Face used for the key description of menu widgets on the dashboard")

(defface dashboard-loaded '((t (:inherit font-lock-comment-face)))
  "Face used for the loaded packages benchmark")

(defface doom-dashboard-footer '((t (:inherit font-lock-keyword-face)))
  "Face used for the footer on the dashboard")

(defface dashboard-footer-icon '((t (:inherit font-lock-string-face)))
  "Face used for the icon of the footer on the dashboard")


(defvar dashboard-menu-sections
  '(("Open scratch buffer"
     :icon (nerd-icons-sucicon "nf-seti-default" :face 'dashboard-menu-title)
     :action mc/open-scratch
     :key "C-c s")
    ("Reload last session"
     :icon (nerd-icons-octicon "nf-oct-history" :face 'dashboard-menu-title)
     :action mc/quickload-session
     :key "C-c r")
    ("Open org-agenda"
     :icon (nerd-icons-octicon "nf-oct-calendar" :face 'dashboard-menu-title)
     :when (fboundp 'org-agenda)
     :action org-agenda
     :key "C-c a")
    ("Open project"
     :icon (nerd-icons-octicon "nf-oct-briefcase" :face 'dashboard-menu-title)
     :action projectile-switch-project
     :key "C-c o")
    ("Jump to bookmark"
     :icon (nerd-icons-octicon "nf-oct-bookmark" :face 'dashboard-menu-title)
     :action bookmark-jump
     :key "C-c b")
    ("Open private configuration"
     :icon (nerd-icons-octicon "nf-oct-tools" :face 'dashboard-menu-title)
     :action mc/open-config
     :key "C-c f")
    ("Open documentation"
     :icon (nerd-icons-octicon "nf-oct-book" :face 'dashboard-menu-title)
     :action info
     :key "C-c d")))

(defun splash-screen-center (window-width element-width)
  "Insert spaces to center element in window"
  (insert-char ?\s (round (- (/ window-width 2) (/ element-width 2)))))

(defun render-dashboard-ascii-widget ()
  (insert-char ?\n 5)
  (insert (propertize "ㅤ ▄▀▀█▄▄▄▄  ▄▀▀▄ ▄▀▄  ▄▀▀█▄   ▄▀▄▄▄▄   ▄▀▀▀▀▄ ㅤ"  'face 'bold)) (center-line) (insert "\n")
  (insert (propertize "ㅤ▐  ▄▀   ▐ █  █ ▀  █ ▐ ▄▀ ▀▄ █ █    ▌ █ █   ▐ ㅤ"  'face 'bold)) (center-line) (insert "\n")
  (insert (propertize "ㅤ  █▄▄▄▄▄  ▐  █    █   █▄▄▄█ ▐ █         ▀▄   ㅤ"  'face 'bold)) (center-line) (insert "\n")
  (insert (propertize "ㅤ  █    ▌    █    █   ▄▀   █   █      ▀▄   █  ㅤ"  'face 'bold)) (center-line) (insert "\n")
  (insert (propertize "ㅤ ▄▀▄▄▄▄   ▄▀   ▄▀   █   ▄▀   ▄▀▄▄▄▄▀  █▀▀▀   ㅤ"  'face 'bold)) (center-line) (insert "\n")
  (insert (propertize "ㅤ █    ▐   █    █    ▐   ▐   █     ▐   ▐      ㅤ"  'face 'bold)) (center-line) (insert "\n")
  (insert (propertize "ㅤ ▐        ▐    ▐            ▐                ㅤ"  'face 'bold)) (center-line) (insert "\n"))

(defun render-dashboard-menu-widget (window-width)
  (dolist (section dashboard-menu-sections)
    (cl-destructuring-bind (label &key icon action when face key) section
      (when (and (fboundp action)
                 (or (null when)
                     (eval when t)))
		(let* ((icon (if (stringp icon) icon (eval icon t)))
			   (interactive-action `(lambda (_) (call-interactively  #',action)))
			   (section-str
				(format
				 (format "%s%%-10s" (if icon "%3s  " "%3s"))
				 (with-temp-buffer
				   (insert-text-button
					label
					'action interactive-action
					'face (or face 'dashboard-menu-title)
					'follow-link t
					'help-echo (format "%s (%s)" label
									   (propertize (symbol-name action) 'face 'dashboard-menu-desc)))
				   (format "%-37s" (buffer-string)))
				 (propertize key 'face 'dashboard-menu-desc))))
		  (local-set-key (kbd key) (lambda () (interactive) (call-interactively action)))
		  (splash-screen-center window-width (- (length section-str) 1))
		  (insert icon "  " section-str "\n\n"))))))

(defun render-dashboard-loaded-widget (window-width)
  (let ((benchmark-str (mc/display-benchmark-h 'return)))
    (splash-screen-center window-width (length benchmark-str))
    (insert
     (propertize
      benchmark-str
      'face 'dashboard-loaded)
     "\n")))

(defun render-dashboard-footer-widget (window-width)
  (splash-screen-center window-width 3)
  (insert
   (with-temp-buffer
     (insert-text-button
      (format " %s  "
			  (or (nerd-icons-codicon "nf-cod-octoface" :face 'dashboard-footer-icon :height 1.3 :v-adjust -0.15)
				  (propertize "github" 'face 'dashboard-footer)))
      'action (lambda (_) (browse-url "https://github.com/mateidragony"))
      'follow-link t
      'help-echo "Open mateidragony github page")
     (buffer-string))
   "\n"))

(defun render-splash-screen (splash-buffer)
  (interactive)
  (let* ((window-height     (- (window-body-height nil) 1))
         (window-width      (window-body-width nil))
		 (emacs-img         (create-image "~/Pictures/emacs.png" 'png nil :scale 0.5)))
    (with-current-buffer splash-buffer
      ;; Buffer local settings
      (read-only-mode 0)
      (if (one-window-p)
          (setq mode-line-format nil))
      (setq cursor-type nil)
      (setq vertical-scroll-bar nil)
      (setq horizontal-scroll-bar nil) 
      (setq fill-column window-width)
      (face-remap-add-relative 'button :underline nil)
      
      ;; draw content
      (erase-buffer)
      (insert-char ?\n (round (/ window-height 7)))
      ;; emacs logo
      (if (display-graphic-p)
		  (progn
			(splash-screen-center window-width (car (image-size emacs-img)))
			(insert-image emacs-img  "Emacs logo"))
		(render-dashboard-ascii-widget))
      ;; dashboard menu widget
      (insert-char ?\n 2)
      (render-dashboard-menu-widget window-width)
      ;; dashboard loaded widget
      (insert-char ?\n 2)
      (render-dashboard-loaded-widget window-width)
      ;; dashboard footer widget
      (insert-char ?\n 1)
      (render-dashboard-footer-widget window-width)
      
      (goto-char 0)
      (read-only-mode t)
      )))

(defun init-splash-screen ()
  "Emacs splash screen"
  (let ((splash-buffer (get-buffer-create "*splash*")))
    (render-splash-screen splash-buffer)
    ;; (run-with-idle-timer 0 nil (lambda() (message nil)))
    (when (equal (buffer-name) "*scratch*")
      (switch-to-buffer splash-buffer))))

(defun resize-splash-screen (&optional _)
  (when (get-buffer "*splash*")
    (render-splash-screen "*splash*")))

;; Install hook after frame parameters have been applied and only if
;; no option on the command line
(if (and (not (member "-no-splash"  command-line-args))
         (not (member "--file"      command-line-args))
         (not (member "--insert"    command-line-args))
         (not (member "--find-file" command-line-args))
         (not inhibit-startup-screen))
    (progn
      (add-hook 'window-setup-hook 'init-splash-screen)
      (setq inhibit-startup-screen  t 
            inhibit-startup-message t
            inhibit-startup-echo-area-message t)))

(defun display-startup-echo-area-message ()
  (message nil))

(add-hook 'window-configuration-change-hook #'resize-splash-screen)
(add-hook 'window-size-change-functions #'resize-splash-screen)


(provide 'splash-rcp)
;;; splash-rcp.el ends here
