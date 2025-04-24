;;; custom-functions.el --- File for custom code and functions
;;; Code:

;;;###autoload
(defun mc-load-session (&optional file)  
  (setq file (expand-file-name (or file (mc-session-file))))
  (message "Attempting to load %s" file)
  (cond ((not (file-readable-p file))
         (message "No session file at %S to read from" file))
        ((require 'persp-mode nil t)
         (unless persp-mode
           (persp-mode +1))
         (let ((allowed (persp-list-persp-names-in-file file)))
           (cl-loop for name being the hash-keys of *persp-hash*
                    unless (member name allowed)
                    do (persp-kill name))
           (persp-load-state-from-file file)))
        ((error "No session backend to load session with"))))

;;;###autoload
(defun mc-session-file (&optional name)
  (cond ((require 'persp-mode nil t)
         (expand-file-name (or name persp-auto-save-fname) persp-save-dir))
        ((error "No session backend available"))))

;;;###autoload
(defun mc-save-session (&optional file)
  (setq file (expand-file-name (or file (mc-session-file))))
  (cond ((require 'persp-mode nil t)
         (unless persp-mode (persp-mode +1))
         (setq persp-auto-save-opt 0)
         (persp-save-state-to-file file))
        ((error "No session backend to save session with"))))

;;;###autoload
(defun mc/quicksave-session ()
  "TODO"
  (interactive)
  (message "Saving session")
  (mc-save-session)
  (message "Saving session...DONE"))

;;;###autoload
(defun mc/quickload-session (force)
  (interactive "P")
  (if (or force
          (yes-or-no-p "This will wipe your current session, do you want to continue? "))
      (progn (message "Restoring session...")
             (mc-load-session)
             (message "Session restored. Welcome back."))
    (message "Session not restored.")))

;;;###autoload
(defun mc/highlight-todos ()
  "Add custom highlighting for specific words."
  (font-lock-add-keywords nil '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t))))

;;;###autoload
(defun mc/open-config ()
  "Open init.el"
  (interactive)
  (find-file (expand-file-name "init.el" user-emacs-directory)))

;;;###autoload
(defun mc/open-scratch ()
  "Open init.el"
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*")))

;;;###autoload
(defun mc/display-benchmark-h (&optional return-p)
  "Display a benchmark including number of packages loaded.

If RETURN-P, return the message as a string instead of displaying it."
  (funcall (if return-p #'format #'message)
           "Emacs initialized and loaded %d packages in %.03fs"
           (- (length load-path) (length (get 'load-path 'initial-value)))
           mc/emacs-init-time))

;;;###autoload
(defun mc/isearch-forward ()
  "Do isearch. If region is active, search for the text in region."
  (interactive)
  (if (use-region-p)
      (let ((search-text (buffer-substring-no-properties (region-beginning) (region-end))))
	(goto-char (region-beginning))
        (deactivate-mark)
        (isearch-mode t)
        (isearch-yank-string search-text))
    (isearch-forward)))

;;;###autoload
(defun mc/query-replace ()
  "Do `anzu-query-replace-at-cursor` without regex"
  (interactive)
  (call-interactively #'anzu-query-replace))


;;;###autoload
(defun mc/close-shell ()
  "Find the window with the *shell* buffer and close it if it exists"
  (interactive)
  (when-let ((shell-buffer (get-buffer "*shell*")))
	(dolist (win (get-buffer-window-list shell-buffer nil t))
      (when (window-live-p win)
        (delete-window win)))))

;;;###autoload
(defun mc/open-shell ()
  "If the *shell* buffer exists, display it. Otherwise, create it"
  (interactive)
  (let ((shell-buffer (get-buffer "*shell*")))
	(cond
	 (shell-buffer
	  (display-buffer shell-buffer)
	  (select-window (get-buffer-window shell-buffer t)))
	 (t
	  (display-buffer (get-buffer-create "*shell*"))
	  (select-window (get-buffer-window (get-buffer "*shell*") t))
	  (shell)))))

;;;###autoload
(defun mc/toggle-shell ()
  "Toggle the *shell* buffer to be open or closed"
  (interactive)
  (let ((shell-buffer (get-buffer "*shell*")))
	(cond
	 ((and shell-buffer (get-buffer-window shell-buffer t))
	  (mc/close-shell))
	 (t (mc/open-shell)))))


(provide 'custom-functions)
;;; Commentary:
;;
;;; custom-functions.el ends here


