;;; custom-functions.el --- File for custom code and functions
;;; Code:

;;;###autoload
(defun mc/highlight-todos ()
  "Add custom highlighting for specific words."
  (font-lock-add-keywords nil '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t))))

(provide 'custom-functions)
;;; Commentary:
;;
;;; functions_my.el ends here


