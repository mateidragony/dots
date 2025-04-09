;;; server-rcp.el --- Emacs live server functions
;;; Code:

(defvar live-server-port nil)

;;;###autoload
(defun live-server-start ()
  "Start live server in current directory"
  (interactive)
  (call-process-shell-command
   "browser-sync start --server --no-ui --port 12345 --no-open --watch > .live-server-output &"
   nil 0)
  (let ((url ""))
    (while (eq 0 (length url))
      (setq url (shell-command-to-string "awk '/Local:/ {print $2}' .live-server-output")))
    (setq url (string-trim url))
    (call-process-shell-command "rm .live-server-output" nil 0)
    (message (format "Live server started at %s" url))
    (browse-url (format "%s/%s" url (file-name-nondirectory (buffer-file-name))))
    (setq live-server-port
	  (if (string-match ":[0-9]+$" url)
	      (substring url (1+ (match-beginning 0)))
	    nil))
    ))


;;;###autoload
(defun live-server-kill ()
  "Kill emacs live server"
  (interactive)
  (message (if (eq 0 (call-process-shell-command "pkill -f \"node /usr/bin/browser-sync\"" nil nil))
	       "Live server successfully killed"
	     "Something went wrong..."))
  (setq live-server-port nil))

(provide 'server-rcp)
;;; Commentary:
;; emacs live server
;; Local Variables:
;; End:
;;; server-rcp.el ends here
