;;; server-rcp.el --- Emacs live server functions
;;; Code:

(defvar live-server-port nil
  "Port number of active live server")
(defvar live-server-pid nil
  "Process id of active live server")


(defun live-server-ready-p ()
  "Return the port number from the 'Local' browser-sync line in the output buffer."
  (with-current-buffer "*live-server*"
	(let ((content (buffer-string)))
	  (when (string-match "Local:.*?localhost:\\([0-9]+\\)\n" content)
		(substring content (match-beginning 1) (match-end 1))))))

;;;###autoload
(defun live-server-start ()
  "Start live server in current directory"
  (interactive)
  (if live-server-pid
	  (message "Live server already active!")
	(progn
	  (with-current-buffer (get-buffer-create "*live-server*")
		(erase-buffer))
	  (let ((proc (make-process
				   :name "live-server"
				   :buffer "*live-server*"
				   :command '("browser-sync" "start" "--server" "--no-ui"
							  "--no-open" "--watch")
				   :noquery t
				   :stderr nil)))
		(setq live-server-pid (process-id proc))
		(sleep-for 0 10)
		(while (not live-server-port)
		  (setq live-server-port (live-server-ready-p))
		  (sleep-for 0 10))
		(message live-server-port)
		(message "Live server started at port: %s" live-server-port)
		(browse-url (format "http://localhost:%s/%s" live-server-port (file-name-nondirectory (buffer-file-name))))))))


;;;###autoload
(defun live-server-kill ()
  "Kill emacs live server"
  (interactive)
  (if live-server-pid
	  (progn
		(call-process-shell-command (format "kill %s" live-server-pid))
		(message "Live server successfully killed"))
	(message "No active live server!"))
  (setq live-server-port nil)
  (setq live-server-pid nil))

(provide 'server-rcp)
;;; Commentary:
;; emacs live server
;; Local Variables:
;; End:
;;; server-rcp.el ends here
