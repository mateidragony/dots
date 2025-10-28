;;; org-cmd-rcp.el --- Org mode commands anywhere in linux
;;; Code:

(defcustom mc/org-capture-frame-name "**Capture**"
  "Customize dedicated frame name to launch `org-capture' in."
  :type 'string)

(defcustom mc/org-agenda-frame-name "**Agenda**"
  "Customize dedicated frame name to launch `org-agenda' in."
  :type 'string)


(defun mc/org-capture-frame (template)
  "Invoke `org-capture' in a dedicated Emacs frame.

     This function is designed to be called from a shell script using `emacsclient'.
     If the dedicated frame already exists, we will use it, otherwise we will create a
     new frame.

     Finally, the dedicated frame will be deleted up after `org-capture' finalizes."
  (interactive '(nil))

  (if (not (equal mc/org-capture-frame-name (frame-parameter nil 'name)))
      (make-frame '((name . tomas/org-capture-frame-name))))

  (select-frame-by-name mc/org-capture-frame-name)
  (delete-other-windows)

  (defun org-capture-after-finalize-clean-up ()
    "Clean up after `org-capture' finalizes.

    We delete the dedicated frame and removing advice."
    (advice-remove 'org-capture-place-template 'delete-other-windows)
    (remove-hook 'org-capture-after-finalize-hook 'org-capture-after-finalize-clean-up)

    (select-frame-by-name mc/org-capture-frame-name)
    (delete-frame nil t))

  (add-hook 'org-capture-after-finalize-hook 'org-capture-after-finalize-clean-up)
  (advice-add #'org-capture-place-template :after 'delete-other-windows)

  (org-capture nil template))

(defun mc/org-agenda-frame (command)
  "Invoke `org-agenda' in a dedicated Emacs frame.

   This function is designed to be called from a shell script using `emacsclient'.
   If the dedicated frame already exists, we will use it, otherwise we will create a
   new frame.

   Finally, the dedicated frame will be deleted up after `org-agenda' finalizes."
  (interactive '(nil))

  (if (not (equal mc/org-agenda-frame-name (frame-parameter nil 'name)))
      (make-frame '((name . mc/org-agenda-frame-name))))

  (select-frame-by-name mc/org-agenda-frame-name)
  (delete-other-windows)

  (defun org-agenda-quit--clean-up ()
    "Close the frame after `org-agenda-quit'."
    (advice-remove 'org-agenda 'delete-other-windows)
    (advice-remove 'org-agenda-quit 'org-agenda-quit--clean-up)
    (advice-remove 'org-agenda-Quit 'org-agenda-quit--clean-up)

    (select-frame-by-name mc/org-agenda-frame-name)
    (delete-frame nil t))

  (advice-add 'org-agenda-quit :after #'org-agenda-quit--clean-up)
  (advice-add 'org-agenda-Quit :after #'org-agenda-quit--clean-up)
  (advice-add 'org-agenda :after #'delete-other-windows)

  (org-agenda nil command))

(provide 'org-cmd-rcp)

;;; Commentary:
;; emacs org command config
;; Local Variables:
;; End:
;;; org-cmd-rcp.el ends here

