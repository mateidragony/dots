;;; server-rcp.el --- Emacs live server functions
;;; Code:

(require 'cl-lib)

(defvar live-server-alist nil
  "Alist of live server ports to pid")

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
  (let ((root (lsp-workspace-root)))
	(if (not root)
		(message "Impossible to create live server outside of lsp mode!")
	  (let* ((name (file-name-nondirectory root))
			 (pid nil)
			 (port nil))
		(cond
		 ((assoc name live-server-alist) (message (format "Live server already active for %s!" name)))
		 (t (progn
			  (with-current-buffer (get-buffer-create "*live-server*")
				(erase-buffer))
			  (let ((proc (make-process
						   :name "live-server"
						   :buffer "*live-server*"
						   :command (list "browser-sync" root "--no-ui" "--watch")
						   :noquery t
						   :stderr nil)))
				(setq pid (process-id proc))
				(sleep-for 0 10)
				(while (not port)
				  (setq port (live-server-ready-p))
				  (sleep-for 0 10))
				(push (list name (list pid port)) live-server-alist)
				(message "Live server started for %s at port: %s" name port)))))))))

;;;###autoload
(defun live-server-kill ()
  "Kill emacs live server"
  (interactive)
  (if (not live-server-alist)
	  (message "No active live server!")
	(let* ((default (if (lsp-workspace-root)
						(file-name-nondirectory (lsp-workspace-root))
					  (car (car live-server-alist))))
		   (name (completing-read
				  (format "Enter the server name (default %s): " default)
				  (mapcar #'car live-server-alist)
				  nil
				  t
				  nil
				  nil
				  default)
				 ))
	  (progn
		(call-process-shell-command (format "kill %s" (car (car (cdr (assoc name live-server-alist))))))
		(setq live-server-alist
			  (cl-delete name live-server-alist :key #'car :test #'equal))
		(message (format "Live server successfully killed for %s" default))))))

;;;###autoload
(defun live-server-killall ()
  "Kill all emacs live servers"
  (interactive)
  (mapcar (lambda (x)
			(call-process-shell-command (format "kill %s" (car (car (cdr x))))))
		  live-server-alist))

(provide 'server-rcp)
;;; Commentary:
;; emacs live server
;; Local Variables:
;; End:
;;; server-rcp.el ends here
