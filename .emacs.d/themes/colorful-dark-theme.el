(require 'autothemer)

(setq default-frame-alist
      (append
       '((background-color . "#221f35")
         (foreground-color . "#e1cdf4")
         (cursor-color     . "#e1cdf4"))
       default-frame-alist))

(defface mode-line-active-insert       '((t)) "Mode-line active editing face")
(defface mode-line-active-modified     '((t)) "Mode-line active editing modified face")
(defface mode-line-active-ro           '((t)) "Mode-line active read-only face")
(defface mode-line-inactive            '((t)) "Mode-line inactive face")
(defface mode-line-lighter-bg          '((t)) "Mode-line lighter face")

(defface org-todo-keyword              '((t)) "General org todo keyword")
(defface org-todo-keyword-todo         '((t)) "General org todo keyword")
(defface org-todo-keyword-planning     '((t)) "General org todo keyword")
(defface org-todo-keyword-in-progress  '((t)) "General org todo keyword")
(defface org-todo-keyword-blocked      '((t)) "General org todo keyword")
(defface org-todo-keyword-waiting      '((t)) "General org todo keyword")
(defface org-todo-keyword-done         '((t)) "General org todo keyword")
(defface org-todo-keyword-wont-do      '((t)) "General org todo keyword")

(autothemer-deftheme
 colorful-dark "Colorful dark theme for emacs"

 ((((class color) (min-colors #xFFFFFF)))

  ;; color palette
  (cd-black        "#11111b")
  (cd-white        "#e1cdf4")
  (cd-lt-lt-gray   "#a6adc8")
  (cd-lt-gray      "#9399b2")
  (cd-gray         "#7f849c")
  (cd-dk-gray      "#45475a")
  (cd-lt-pink      "#ef92e0")
  (cd-pink         "#e261cd")
  (cd-lt-blue      "#c0dded")
  (cd-blue         "#3aa2e8")
  (cd-dk-blue      "#132f6b")
  (cd-lt-purple    "#c69fea")
  (cd-purple       "#b479f7")
  (cd-dk-purple    "#8632e5")
  (cd-dk-dk-purple "#6910ce")
  (cd-lt-green     "#acdb99")
  (cd-green        "#23c436")
  (cd-lt-red       "#fca1a4")
  (cd-red          "#e45649")
  (cd-dk-red       "#a80d15")
  (cd-orange       "#dd9135")
  (cd-dk-orange    "#ba4025")
  (cd-brown        "#846744")
  (cd-teal         "#3dc4ce")
  (cd-dk-teal      "#0198a3")
  (cd-lt-cyan      "#4ae0db")
  (cd-cyan         "#00c1bc")
  (cd-dk-cyan      "#099e99")
  (cd-yellow       "#e5cb22")
  (cd-dk-yellow    "#b6bc00")
  
  (cd-bg           "#221f35")
  (cd-lt-lt-bg     "#45475a")
  (cd-lt-bg        "#313244")
  (cd-dk-bg        "#181825")
  (cd-dk-dk-bg     "#11111b")
  (cd-selection    "#5e1d58")
  (cd-selection-2  "#613270")
  (cd-comment      "#7f849c")

  (cd-variable-1   "#99d6ff")
  (cd-variable-2   "#fab9f5")
  (cd-variable-3   "#f5e98c")
  (cd-variable-4   "#f7d8a8")
  (cd-variable-5   "#9dedb3")
  (cd-variable-6   "#f7a8b5")
  )
 
 ;; Customize faces
 ((cursor                             (:background cd-white))
  (default                            (:foreground cd-white :background cd-bg))
  (error                              (:foreground cd-red :weight 'bold))
  (header-line                        (:background cd-dk-bg))
  (help-key-binding                   (:foreground cd-white :background cd-lt-lt-bg :box t))
  (highlight                          (:inherit 'region))  
  (line-number                        (:foreground cd-gray))
  (match                              (:inherit 'region))
  (minibuffer-prompt                  (:foreground cd-blue :weight 'bold))
  (region                             (:background cd-selection))
  (secondary-selection                (:background cd-selection-2))
  (shadow                             (:foreground cd-comment))
  (show-paren-match                   (:inherit 'region :foreground cd-pink :weight 'bold))
  (success                            (:foreground cd-green))
  (tooltip                            (:inherit 'variable-pitch :foreground cd-black :background cd-white))
  (warning                            (:foreground cd-orange :weight 'bold))
  
  ;; agda
  (agda2-highlight-datatype-face                  (:inherit 'font-lock-type-face))
  (agda2-highlight-field-face                     (:inherit 'font-lock-variable-name-face))
  (agda2-highlight-function-face                  (:inherit 'font-lock-function-name-face))
  (agda2-highlight-inductive-constructor-face     (:inherit 'font-lock-function-name-face))
  (agda2-highlight-keyword-face                   (:inherit 'font-lock-keyword-face))
  (agda2-highlight-module-face                    (:inherit 'font-lock-type-face))
  (agda2-highlight-number-face                    (:inherit 'font-lock-constant-face))
  (agda2-highlight-postulate-face                 (:inherit 'font-lock-keyword-face))
  (agda2-highlight-primitive-face                 (:inherit 'font-lock-constant-face))
  (agda2-highlight-primitive-type-face            (:inherit 'font-lock-type-face))

  (font-lock-string-face              (:foreground cd-green))
  (font-lock-keyword-face             (:foreground cd-purple))
  (font-lock-comment-face             (:foreground cd-comment :slant 'italic))
  (font-lock-comment-delimiter-face   (:foreground cd-comment :slant 'italic))
  (font-lock-function-name-face       (:foreground cd-pink :weight 'bold))
  (font-lock-constant-face            (:foreground cd-orange))
  (font-lock-variable-name-face       (:foreground cd-blue :weight 'bold))
  (font-lock-builtin-face             (:foreground cd-purple))
  (font-lock-warning-face             (:foreground cd-red :weight 'bold))
  (font-lock-type-face                (:foreground cd-purple))

  
  ;; ansi
  (ansi-color-black                               (:foreground cd-black :background cd-black))
  (ansi-color-blue                                (:foreground cd-blue :background cd-blue))
  (ansi-color-cyan                                (:foreground cd-cyan :background cd-cyan))
  (ansi-color-green                               (:foreground cd-green :background cd-green))
  (ansi-color-magenta                             (:foreground cd-pink :background cd-pink))
  (ansi-color-red                                 (:foreground cd-red :background cd-red))
  (ansi-color-white                               (:foreground cd-white :background cd-white))
  (ansi-color-yellow                              (:foreground cd-yellow :background cd-yellow))
  
  ;; anzu
  (anzu-mode-line                     (:foreground cd-pink :weight 'bold))
  (anzu-mode-line-no-match            (:inherit 'anzu-mode-line))
  (anzu-replace-highlight             (:inherit 'isearch))
  (anzu-replace-to                    (:inherit 'font-lock-comment-face))

  ;; company
  (company-template-field                         (:inherit 'region))
  (company-preview                                (:background cd-lt-lt-bg))
  (company-preview-common                         (:foreground cd-blue))
  (company-preview-search                         (:foreground cd-blue))
  (company-tooltip                                (:background cd-lt-lt-bg))
  (company-tooltip-annotation                     (:foreground cd-orange))
  (company-tooltip-annotation-selection           (:foreground cd-orange))
  (company-tooltip-common                         (:foreground cd-blue))
  (company-tooltip-common-selection               (:foreground cd-blue))
  (company-tooltip-mouse                          (:background cd-lt-blue))
  (company-tooltip-quick-access-selection         (:foreground cd-orange)) 
  (company-tooltip-quick-access-selection         (:foreground cd-orange))
  (company-tooltip-scrollbar-thumb                (:background cd-dk-dk-bg))
  (company-tooltip-scrollbar-track                (:background cd-dk-bg))
  (company-tooltip-search                         (:inherit 'region))
  (company-tooltip-search-selection               (:inherit 'region))
  (company-tooltip-selection                      (:inherit 'region))
  (completions-highlight                          (:foreground cd-black :background cd-blue))
  (completions-common-part                        (:foreground cd-blue))

  ;; coq
  (coq-solve-tacticd-face                         (:foreground cd-red))
  (coq-cheat-face                                 (:background cd-dk-orange))
  (company-coq-features/code-folding-bullet-face  (:underline nil))

  ;; custom
  (custom-button                      (:foreground cd-white :background cd-lt-lt-bg :box (:line-width 2 :color cd-lt-gray :style 'released-button)))
  (custom-button-mouse                (:inherit 'custom-button :background cd-dk-dk-bg))
  (custom-button-pressed              (:inherit 'custom-button :background cd-dk-bg :box (:line-width 2 :color cd-lt-gray :style 'pressed-button)))
  (custom-changed                     (:foreground cd-black :background cd-blue))
  (custom-modified                    (:inherit 'custom-changed))
  (custom-themed                      (:inherit 'custom-changed))
  (custom-face-tag                    (:foreground cd-blue))
  (custom-group-tag                   (:inherit 'variable-pitch :height 1.2 :foreground cd-blue :weight 'bold))
  (custom-group-tag-1                 (:inherit 'custom-group-tag :foreground cd-red))
  (custom-invalid                     (:foreground cd-black :background cd-red))
  (custom-variable-obsolete           (:foreground cd-blue))
  (custom-variable-tag                (:foreground cd-blue :weight 'bold))
  
  ;; eww
  (eww-form-checkbox                  (:inherit 'custom-button))
  (eww-form-file                      (:inherit 'custom-button-mouse))
  (eww-form-select                    (:inherit 'eww-form-checkbox))
  (eww-form-submit                    (:inherit 'eww-form-file))
  (eww-form-text                      (:foreground cd-white :background cd-dk-bg :box t))
  (eww-form-textarea                  (:inherit 'eww-form-text))
  (eww-invalid-certificate            (:foreground cd-red :weight 'bold))
  (eww-valid-certificate              (:foreground cd-green :weight 'bold))
  
  ;; flymake
  (flymake-warning                    (:underline (:color cd-orange :style 'wave)))
  
  ;; Font lock
  (font-lock-string-face              (:foreground cd-green))
  (font-lock-keyword-face             (:foreground cd-blue))
  (font-lock-comment-face             (:foreground cd-comment :slant 'italic))
  (font-lock-comment-delimiter-face   (:foreground cd-comment :slant 'italic))
  (font-lock-function-name-face       (:foreground cd-purple :weight 'bold))
  (font-lock-constant-face            (:foreground cd-pink))
  (font-lock-variable-name-face       (:foreground cd-pink :weight 'bold))
  (font-lock-builtin-face             (:foreground cd-blue))
  (font-lock-warning-face             (:foreground cd-red :weight 'bold))
  (font-lock-type-face                (:foreground cd-purple))

  ;; git merge
  (smerge-base                        (:background cd-dk-bg))
  (smerge-markers                     (:background cd-dk-dk-bg))
  (smerge-upper                       (:background cd-lt-cyan))
  (smerge-lower                       (:background cd-lt-purple))
  (smerge-refined-changed             (:foreground cd-white))
  (smerge-refined-added               (:background cd-lt-green))
  (smerge-refined-removed             (:background cd-lt-red))

  ;; isearch
  (isearch                            (:foreground cd-white :background cd-selection-2))
  (isearch-fail                       (:foreground cd-white :background cd-dk-red))
  (isearch-group-1                    (:inherit 'isearch))
  (isearch-group-2                    (:inherit 'isearch))
  (lazy-highlight                     (:background cd-dk-gray))

  ;; latex
  (font-latex-math-face               (:foreground cd-green))
  (font-latex-bold-face               (:foreground cd-dk-teal :inherit 'bold))
  (font-latex-italic-face             (:foreground cd-dk-teal :inherit 'italic))
  (font-latex-sectioning-5-face       (:foreground cd-pink :weight 'bold :inherit 'variable-pitch))
  
  ;; lsp ui
  (lsp-ui-doc-background              (:inherit 'default))
  (lsp-ui-doc-header                  (:background cd-blue :foreground cd-black))
  (lsp-ui-peek-filename               (:foreground cd-red))
  (lsp-ui-peek-footer                 (:background cd-dk-dk-bg))
  (lsp-ui-peek-header                 (:inherit 'lsp-ui-peek-footer))
  (lsp-ui-peek-highlight              (:background cd-yellow :box (:color cd-lt-red)))
  (lsp-ui-peek-list                   (:background cd-dk-bg))
  (lsp-ui-peek-peek                   (:inherit 'lsp-ui-peek-list))
  (lsp-ui-peek-selection              (:background cd-selection))
  (lsp-ui-sideline-code-action        (:foreground cd-orange))
  (lsp-ui-sideline-symbol             (:foreground cd-gray :box (:color cd-gray)))
  (lv-separator                       (:background cd-gray))
  
  ;; markdown
  (markdown-header-face-1             (:foreground cd-purple))
  (markdown-header-face-2             (:foreground cd-blue))
  (markdown-header-face-3             (:foreground cd-green))
  (markdown-header-face-4             (:foreground cd-red))
  (markdown-header-face-5             (:foreground cd-pink))
  (markdown-link-face                 (:inherit 'link))
  (markdown-highlighting-face         (:inherit 'secondary-selection :weight 'bold))

  ;; modeline
  (mode-line                          (:background cd-dk-dk-bg))
  (mode-line-active                   (:inherit 'mode-line))
  (mode-line-inactive                 (:inherit 'mode-line))
  (mode-line-highlight                (:inherit 'mode-line))

  ;; links
  (link                               (:foreground cd-dk-cyan :underline t))
  (button                             (:inherit 'link))
  (browse-url-button                  (:inherit 'link))
  (info-xref                          (:inherit 'link))
  (info-header-xref                   (:inherit 'link))
  (shr-link                           (:inherit 'link))
  (package-name                       (:inherit 'link))
  
  ;; lsp
  (lsp-face-highlight-read            (:background cd-lt-blue))
  (lsp-installation-buffer-face       (:foreground cd-green))

  ;; nerd icons
  (nerd-icons-lorange                 (:foreground cd-orange))
  (nerd-icons-yellow                  (:foreground cd-yellow))

  ;; org
  (org-agenda-structure               (:foreground cd-white :weight 'bold))
  (org-agenda-date                    (:foreground cd-blue :weight 'bold))
  (org-agenda-date-today              (:inherit 'org-agenda-date :foreground cd-purple))
  (org-agenda-date-weekend            (:inherit 'org-agenda-date :weight 'normal :foreground cd-blue))
  (org-agenda-current-time            (:foreground cd-pink))
  (org-agenda-clocking                (:background cd-yellow))
  (org-agenda-calendar-event          (:foreground cd-white))
  (org-date-selected                  (:background cd-red :foreground cd-black :weight 'bold))
  (org-mode-line-clock-overrun        (:background cd-red))
  (org-tag                            (:inherit 'font-lock-comment-face))
  (org-time-grid                      (:foreground cd-comment))
  (org-super-agenda-header            (:weight 'bold))
  (org-scheduled-today                (:inherit 'org-imminent-deadline))
  (org-imminent-deadline              (:foreground cd-red))
  (org-upcoming-deadline              (:foreground cd-white))
  (org-upcoming-distant-deadline      (:foreground cd-white))

  (org-todo-keyword                   (:inherit 'bold))
  (org-todo-keyword-todo              (:inherit 'org-todo-keyword :foreground cd-red))
  (org-todo-keyword-planning          (:inherit 'org-todo-keyword :foreground cd-pink))
  (org-todo-keyword-in-progress       (:inherit 'org-todo-keyword :foreground cd-blue))
  (org-todo-keyword-blocked           (:inherit 'org-todo-keyword :foreground cd-dk-red))
  (org-todo-keyword-waiting           (:inherit 'org-todo-keyword :foreground cd-purple))
  (org-todo-keyword-done              (:inherit 'org-todo-keyword :foreground cd-green))
  (org-todo-keyword-wont-do           (:inherit 'org-todo-keyword :foreground cd-gray))
  
  ;; prog-mode
  (compilation-info                   (:foreground cd-green))

  ;; proof
  (proof-queue-face                   (:inherit 'region))
  (proof-locked-face                  (:inherit 'lazy-highlight :underline nil))
  (proof-tacticd-name-face            (:foreground cd-orange :underline nil))

  ;; racket
  (racket-reader-quoted-symbol-face   (:foreground cd-green))
  
  ;; Rainbow delimiters
  (rainbow-delimiters-depth-1-face    (:foreground cd-pink))
  (rainbow-delimiters-depth-2-face    (:foreground cd-blue))
  (rainbow-delimiters-depth-3-face    (:foreground cd-purple))
  (rainbow-delimiters-depth-4-face    (:foreground cd-teal))
  (rainbow-delimiters-depth-5-face    (:foreground cd-red))
  (rainbow-delimiters-depth-6-face    (:inherit 'rainbow-delimiters-depth-1-face))
  (rainbow-delimiters-depth-7-face    (:inherit 'rainbow-delimiters-depth-2-face))
  (rainbow-delimiters-depth-8-face    (:inherit 'rainbow-delimiters-depth-3-face))
  (rainbow-delimiters-depth-9-face    (:inherit 'rainbow-delimiters-depth-4-face))

  ;; Rainbow identifiers
  (rainbow-identifiers-identifier-1   (:foreground cd-variable-1))
  (rainbow-identifiers-identifier-2   (:foreground cd-variable-2))
  (rainbow-identifiers-identifier-3   (:foreground cd-variable-3))
  (rainbow-identifiers-identifier-4   (:foreground cd-variable-4))
  (rainbow-identifiers-identifier-5   (:foreground cd-variable-5))
  (rainbow-identifiers-identifier-6   (:foreground cd-variable-6))
  (rainbow-identifiers-identifier-7   (:inherit 'rainbow-identifiers-identifier-1))
  (rainbow-identifiers-identifier-8   (:inherit 'rainbow-identifiers-identifier-2))
  (rainbow-identifiers-identifier-9   (:inherit 'rainbow-identifiers-identifier-3))
  (rainbow-identifiers-identifier-10  (:inherit 'rainbow-identifiers-identifier-4))
  (rainbow-identifiers-identifier-11  (:inherit 'rainbow-identifiers-identifier-5))
  (rainbow-identifiers-identifier-12  (:inherit 'rainbow-identifiers-identifier-6))
  (rainbow-identifiers-identifier-13  (:inherit 'rainbow-identifiers-identifier-1))
  (rainbow-identifiers-identifier-14  (:inherit 'rainbow-identifiers-identifier-2))
  (rainbow-identifiers-identifier-15  (:inherit 'rainbow-identifiers-identifier-3))

  ;; sh
  (sh-heredoc                         (:foreground cd-orange))
  (sh-quoted-exec                     (:foreground cd-purple))

  ;; shr
  (shr-mark                           (:inherit 'secondary-selection :weight 'bold))
  (shr-selected-link                  (:inherit 'shr-mark))

  ;; sidebar
  (sidebar-added                      (:foreground cd-green))
  (sidebar-branch                     (:inherit 'sidebar-primary-color))
  (sidebar-buffers-headers-face       (:foreground cd-purple :height 1.4))
  (sidebar-changed                    (:foreground cd-orange))
  (sidebar-dir                        (:foreground cd-white :weight 'bold))
  (sidebar-empty-face                 (:foreground cd-white))
  (sidebar-file                       (:foreground cd-white))
  (sidebar-header-line                (:inherit 'sidebar-primary-color))
  (sidebar-icon-branch                (:inherit 'sidebar-primary-color))
  (sidebar-icon-header-directory      (:inherit 'sidebar-primary-color))
  (sidebar-icon-header-project        (:inherit 'sidebar-primary-color))
  (sidebar-icon-remote-branch         (:inherit 'sidebar-primary-color))
  (sidebar-ignored-dir                (:inherit 'font-lock-comment-face))
  (sidebar-ignored-file               (:inherit 'sidebar-ignored-dir))
  (sidebar-match                      (:foreground cd-green))
  (sidebar-not-updated                (:foreground cd-orange))
  (sidebar-powerline                  (:background cd-selection))
  (sidebar-primary-color              (:foreground cd-black :background cd-blue))
  (sidebar-remote-branch              (:inherit 'sidebar-primary-color))
  (sidebar-renamed                    (:inherit 'sidebar-changed))
  (sidebar-select-header              (:inherit 'sidebar-primary-color))
  (sidebar-select-line                (:inherit 'sidebar-primary-color))
  (sidebar-suffix-path-header         (:foreground cd-lt-lt-gray))
  (sidebar-untracked                  (:foreground cd-green))
  (sidebar-updated                    (:foreground cd-green))
    
  ;; tab bar
  (tab-bar                            (:inherit 'variable-pitch :foreground cd-white :background cd-lt-lt-bg))
  (tab-line                           (:inherit 'tab-bar :underline t))
  
  ;; toolbar
  (tool-bar                           (:foreground cd-white :background cd-lt-lt-bg :box (:line-width 2 :color cd-dk-bg :style 'released-button)))
  
  ;; web
  (web-mode-doctype-face              (:inherit 'font-lock-comment-face))
  (web-mode-html-tag-face             (:foreground cd-pink))
  (web-mode-html-attr-name-face       (:foreground cd-orange))

  ;; widget
  (widget-field                       (:foreground cd-white :background cd-lt-lt-bg :box (:color cd-lt-gray)))
  (widget-single-line-field           (:inherit 'widget-field))

  ;; window dividers
  (window-divider                     (:foreground cd-dk-bg :background cd-white))
  (window-divider-first-pixel         (:inherit 'window-divider))
  (window-divider-last-pixel          (:inherit 'window-divider))

  (mode-line-active-insert            (:foreground cd-white :background cd-dk-dk-purple :weight 'bold :box (:line-width 1 :color cd-dk-dk-purple)))
  (mode-line-active-modified          (:inherit 'mode-line-active-insert :background cd-dk-purple :box (:line-width 1 :color cd-dk-purple)))
  (mode-line-active-ro                (:inherit 'mode-line-active-insert :background cd-dk-orange :box (:line-width 1 :color cd-dk-orange)))
  (mode-line-inactive                 (:foreground cd-white :background cd-dk-dk-bg :weight 'bold :box (:line-width 1 :color cd-dk-dk-bg)))
  (mode-line-lighter-bg               (:background cd-lt-bg))
  ))

(provide-theme 'colorful-dark)

