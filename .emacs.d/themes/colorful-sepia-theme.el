(require 'autothemer)

(setq default-frame-alist
      (append
       '((background-color . "#f4d39a")
         (foreground-color . "#4f4239")
         (cursor-color     . "#4f4239"))
       default-frame-alist))

(autothemer-deftheme
 colorful-sepia "Colorful sepia theme for emacs"

 ((((class color) (min-colors #xFFFFFF)))

  ;; color palette
  (cs-black        "#4f4239")
  (cs-white        "#f2f2f2")
  (cs-lt-gray      "#9b938d")
  (cs-gray         "#6d645e")
  (cs-dk-gray      "#586668")
  (cs-pink         "#cb27b0")
  (cs-lt-blue      "#c0dded")
  (cs-blue         "#0076c5")
  (cs-lt-lt-purple "#d2c5bd")
  (cs-lt-purple    "#c69fea")
  (cs-purple       "#7522d3")
  (cs-dk-purple    "#4d079e")
  (cs-lt-green     "#acdb99")
  (cs-green        "#088d17")
  (cs-lt-red       "#fca1a4")
  (cs-red          "#9b0a12")
  (cs-dk-red       "#e35535")
  (cs-dk-dk-red    "#6d070c")
  (cs-orange       "#a86514")
  (cs-teal         "#4e9297")
  (cs-dk-teal      "#306468")
  (cs-lt-cyan      "#d2dbbd")
  (cs-cyan         "#00c1bc")
  (cs-dk-cyan      "#099e99")
  (cs-yellow       "#e5cb22")
  
  (cs-bg           "#f4d39a")
  (cs-lt-bg        "#f2dea9")
  (cs-dk-bg        "#f2d993")
  (cs-dk-dk-bg     "#e8bd78")
  (cs-selection    "#f998b8")
  (cs-selection-2  "#e8c6f2")
  (cs-comment      "#7b7071")

  (cs-variable-1   "#99d6ff")
  (cs-variable-2   "#fab9f5")
  (cs-variable-3   "#f5e98c")
  (cs-variable-4   "#f7d8a8")
  (cs-variable-5   "#9dedb3")
  (cs-variable-6   "#f7a8b5"))
 
 ;; Customize faces
 ((cursor                             (:background cs-black))
  (default                            (:foreground cs-black :background cs-bg))
  (error                              (:foreground cs-red :weight 'bold))
  (header-line                        (:background cs-dk-bg))
  (help-key-binding                   (:foreground cs-black :background cs-lt-bg :box t))
  (highlight                          (:inherit 'region))  
  (line-number                        (:foreground cs-gray))
  (match                              (:inherit 'region))
  (minibuffer-prompt                  (:foreground cs-blue :weight 'bold))
  (region                             (:background cs-selection))
  (secondary-selection                (:background cs-selection-2))
  (shadow                             (:foreground cs-comment))
  (show-paren-match                   (:inherit 'region :foreground cs-pink :weight 'bold))
  (success                            (:foreground cs-green))
  (tooltip                            (:inherit 'variable-pitch :foreground cs-white :background cs-black))
  (warning                            (:foreground cs-orange :weight 'bold))
  
  ;; agda
  (agda2-highlight-datatype-face                  (:foreground "#83d9ec"))
  (agda2-highlight-field-face                     (:foreground "#4ff87a"))
  (agda2-highlight-function-face                  (:foreground "#4ff87a" :weight 'bold))
  (agda2-highlight-inductive-constructor-face     (:foreground "#F92672"))
  (agda2-highlight-keyword-face                   (:foreground "#ff79c6" :weight 'bold))
  (agda2-highlight-module-face                    (:foreground "#AE81FF"))
  (agda2-highlight-number-face                    (:foreground "#AE81FF"))
  (agda2-highlight-postulate-face                 (:foreground "#83d9ec"))
  (agda2-highlight-primitive-face                 (:foreground "#d76aab"))
  (agda2-highlight-primitive-type-face            (:foreground "#83d9ec"))
  
  ;; ansi
  (ansi-color-black                               (:foreground "#4f4239" :background "#4f4239"))
  (ansi-color-blue                                (:foreground "#0076c5" :background "#0076c5"))
  (ansi-color-cyan                                (:foreground "#4e9297" :background "#4e9297"))
  (ansi-color-green                               (:foreground "#088d17" :background "#088d17"))
  (ansi-color-magenta                             (:foreground "#cb27b0" :background "#cb27b0"))
  (ansi-color-red                                 (:foreground "#c41922" :background "#c41922"))
  (ansi-color-white                               (:foreground "#ABB2BF" :background "#ABB2BF"))
  (ansi-color-yellow                              (:foreground "#d47307" :background "#d47307"))
  
  ;; anzu
  (anzu-mode-line                     (:foreground cs-pink :weight 'bold))
  (anzu-mode-line-no-match            (:inherit 'anzu-mode-line))
  (anzu-replace-highlight             (:inherit 'isearch))
  (anzu-replace-to                    (:inherit 'font-lock-comment-face))

  ;; company
  (company-template-field                         (:inherit 'region))
  (company-preview                                (:background cs-lt-bg))
  (company-preview-common                         (:foreground cs-blue))
  (company-preview-search                         (:foreground cs-blue))
  (company-tooltip                                (:background cs-lt-bg))
  (company-tooltip-annotation                     (:foreground cs-orange))
  (company-tooltip-annotation-selection           (:foreground cs-orange))
  (company-tooltip-common                         (:foreground cs-blue))
  (company-tooltip-common-selection               (:foreground cs-blue))
  (company-tooltip-mouse                          (:background cs-lt-blue))
  (company-tooltip-quick-access-selection         (:foreground cs-orange)) 
  (company-tooltip-quick-access-selection         (:foreground cs-orange))
  (company-tooltip-scrollbar-thumb                (:background cs-dk-dk-bg))
  (company-tooltip-scrollbar-track                (:background cs-dk-bg))
  (company-tooltip-search                         (:inherit 'region))
  (company-tooltip-search-selection               (:inherit 'region))
  (company-tooltip-selection                      (:inherit 'region))
  (completions-highlight                          (:foreground cs-white :background cs-blue))
  (completions-common-part                        (:foreground cs-blue))

  ;; coq
  (coq-solve-tactics-face                         (:foreground cs-red))
  (coq-cheat-face                                 (:background cs-dk-red))
  (company-coq-features/code-folding-bullet-face  (:underline nil))

  ;; custom
  (custom-button                      (:foreground cs-black :background cs-lt-bg :box (:line-width 2 :color cs-lt-gray :style 'released-button)))
  (custom-button-mouse                (:inherit 'custom-button :background cs-dk-dk-bg))
  (custom-button-pressed              (:inherit 'custom-button :background cs-dk-bg :box (:line-width 2 :color cs-lt-gray :style 'pressed-button)))
  (custom-changed                     (:foreground cs-white :background cs-blue))
  (custom-modified                    (:inherit 'custom-changed))
  (custom-themed                      (:inherit 'custom-changed))
  (custom-face-tag                    (:foreground cs-blue))
  (custom-group-tag                   (:inherit 'variable-pitch :height 1.2 :foreground cs-blue :weight 'bold))
  (custom-group-tag-1                 (:inherit 'custom-group-tag :foreground cs-red))
  (custom-invalid                     (:foreground cs-white :background cs-red))
  (custom-variable-obsolete           (:foreground cs-blue))
  (custom-variable-tag                (:foreground cs-blue :weight 'bold))
  
  ;; eww
  (eww-form-checkbox                  (:inherit 'custom-button))
  (eww-form-file                      (:inherit 'custom-button-mouse))
  (eww-form-select                    (:inherit 'eww-form-checkbox))
  (eww-form-submit                    (:inherit 'eww-form-file))
  (eww-form-text                      (:foreground cs-black :background cs-dk-bg :box t))
  (eww-form-textarea                  (:inherit 'eww-form-text))
  (eww-invalid-certificate            (:foreground cs-red :weight 'bold))
  (eww-valid-certificate              (:foreground cs-green :weight 'bold))
  
  ;; flymake
  (flymake-warning                    (:underline (:color cs-orange :style 'wave)))
  
  ;; Font lock
  (font-lock-string-face              (:foreground cs-green))
  (font-lock-keyword-face             (:foreground cs-blue))
  (font-lock-comment-face             (:foreground cs-comment :slant 'italic))
  (font-lock-comment-delimiter-face   (:foreground cs-comment :slant 'italic))
  (font-lock-function-name-face       (:foreground cs-purple :weight 'bold))
  (font-lock-constant-face            (:foreground cs-pink))
  (font-lock-variable-name-face       (:foreground cs-pink :weight 'bold))
  (font-lock-builtin-face             (:foreground cs-blue))
  (font-lock-warning-face             (:foreground cs-red :weight 'bold))
  (font-lock-type-face                (:foreground cs-purple))

  ;; git merge
  (smerge-base                        (:background cs-dk-bg))
  (smerge-markers                     (:background cs-dk-dk-bg))
  (smerge-upper                       (:background cs-lt-cyan))
  (smerge-lower                       (:background cs-lt-lt-purple))
  (smerge-refined-changed             (:foreground cs-black))
  (smerge-refined-added               (:background cs-lt-green))
  (smerge-refined-removed             (:background cs-lt-red))

  ;; isearch
  (isearch                            (:foreground cs-black :background cs-lt-purple))
  (isearch-fail                       (:foreground cs-white :background cs-red))
  (isearch-group-1                    (:inherit 'isearch))
  (isearch-group-2                    (:inherit 'isearch))
  (lazy-highlight                     (:background cs-lt-blue))

  ;; lsp ui
  (lsp-ui-doc-background              (:inherit 'default))
  (lsp-ui-doc-header                  (:background cs-blue :foreground cs-white))
  (lsp-ui-peek-filename               (:foreground cs-red))
  (lsp-ui-peek-footer                 (:background cs-dk-dk-bg))
  (lsp-ui-peek-header                 (:inherit 'lsp-ui-peek-footer))
  (lsp-ui-peek-highlight              (:background cs-yellow :box (:color cs-lt-red)))
  (lsp-ui-peek-list                   (:background cs-dk-bg))
  (lsp-ui-peek-peek                   (:inherit 'lsp-ui-peek-list))
  (lsp-ui-peek-selection              (:background cs-selection))
  (lsp-ui-sideline-code-action        (:foreground cs-orange))
  (lsp-ui-sideline-symbol             (:foreground cs-gray :box (:color cs-gray)))
  (lv-separator                       (:background cs-gray))
  
  ;; markdown
  (markdown-header-face-1             (:foreground cs-purple))
  (markdown-header-face-2             (:foreground cs-blue))
  (markdown-header-face-3             (:foreground cs-green))
  (markdown-header-face-4             (:foreground cs-red))
  (markdown-header-face-5             (:foreground cs-pink))
  (markdown-link-face                 (:inherit 'link))
  (markdown-highlighting-face         (:inherit 'secondary-selection :weight 'bold))

  ;; modeline
  (mode-line                          (:background cs-dk-dk-bg))
  (mode-line-active                   (:inherit 'mode-line))
  (mode-line-inactive                 (:inherit 'mode-line))
  (mode-line-highlight                (:inherit 'mode-line))

  ;; links
  (link                               (:foreground cs-dk-cyan :underline t))
  (button                             (:inherit 'link))
  (browse-url-button                  (:inherit 'link))
  (info-xref                          (:inherit 'link))
  (info-header-xref                   (:inherit 'link))
  (shr-link                           (:inherit 'link))
  (package-name                       (:inherit 'link))
  
  ;; lsp
  (lsp-face-highlight-read            (:background cs-lt-blue))
  (lsp-installation-buffer-face       (:foreground cs-green))

  ;; nerd icons
  (nerd-icons-lorange                 (:foreground cs-orange))
  (nerd-icons-yellow                  (:foreground cs-yellow))

  ;; org
  (org-agenda-structure               (:foreground cs-black :weight 'bold))
  (org-agenda-date                    (:foreground cs-blue :weight 'bold))
  (org-agenda-date-today              (:inherit 'org-agenda-date :foreground cs-purple))
  (org-agenda-date-weekend            (:inherit 'org-agenda-date :weight 'normal :foreground cs-blue))
  (org-agenda-current-time            (:foreground cs-pink))
  (org-agenda-clocking                (:background cs-yellow))
  (org-date-selected                  (:background cs-red :foreground cs-white :weight 'bold))
  (org-mode-line-clock-overrun        (:background cs-red))
  (org-tag                            (:inherit 'font-lock-comment-face))
  (org-super-agenda-header            (:weight 'bold))
  (org-imminent-deadline              (:foreground cs-dk-dk-red))
  (org-upcoming-deadline              (:foreground cs-black))
  (org-upcoming-distant-deadline      (:foreground cs-black))
  
  ;; prog-mode
  (compilation-info                   (:foreground cs-green))

  ;; proof
  (proof-queue-face                   (:inherit 'region))
  (proof-locked-face                  (:inherit 'lazy-highlight :underline nil))
  (proof-tactics-name-face            (:foreground cs-orange :underline nil))

  ;; racket
  (racket-reader-quoted-symbol-face   (:foreground cs-green))
  
  ;; Rainbow delimiters
  (rainbow-delimiters-depth-1-face    (:foreground cs-pink))
  (rainbow-delimiters-depth-2-face    (:foreground cs-blue))
  (rainbow-delimiters-depth-3-face    (:foreground cs-purple))
  (rainbow-delimiters-depth-4-face    (:foreground cs-teal))
  (rainbow-delimiters-depth-5-face    (:foreground cs-red))
  (rainbow-delimiters-depth-6-face    (:inherit 'rainbow-delimiters-depth-1-face))
  (rainbow-delimiters-depth-7-face    (:inherit 'rainbow-delimiters-depth-2-face))
  (rainbow-delimiters-depth-8-face    (:inherit 'rainbow-delimiters-depth-3-face))
  (rainbow-delimiters-depth-9-face    (:inherit 'rainbow-delimiters-depth-4-face))

  ;; Rainbow identifiers
  (rainbow-identifiers-identifier-1   (:foreground cs-variable-1))
  (rainbow-identifiers-identifier-2   (:foreground cs-variable-2))
  (rainbow-identifiers-identifier-3   (:foreground cs-variable-3))
  (rainbow-identifiers-identifier-4   (:foreground cs-variable-4))
  (rainbow-identifiers-identifier-5   (:foreground cs-variable-5))
  (rainbow-identifiers-identifier-6   (:foreground cs-variable-6))
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
  (sh-heredoc                         (:foreground cs-orange))
  (sh-quoted-exec                     (:foreground cs-purple))

  ;; shr
  (shr-mark                           (:inherit 'secondary-selection :weight 'bold))
  (shr-selected-link                  (:inherit 'shr-mark))

  ;; sidebar
  (sidebar-added                      (:foreground cs-green))
  (sidebar-branch                     (:inherit 'sidebar-primary-color))
  (sidebar-buffers-headers-face       (:foreground cs-purple :height 1.4))
  (sidebar-changed                    (:foreground cs-orange))
  (sidebar-dir                        (:foreground cs-black :weight 'bold))
  (sidebar-empty-face                 (:foreground cs-black))
  (sidebar-file                       (:foreground cs-black))
  (sidebar-header-line                (:inherit 'sidebar-primary-color))
  (sidebar-icon-branch                (:inherit 'sidebar-primary-color))
  (sidebar-icon-header-directory      (:inherit 'sidebar-primary-color))
  (sidebar-icon-header-project        (:inherit 'sidebar-primary-color))
  (sidebar-icon-remote-branch         (:inherit 'sidebar-primary-color))
  (sidebar-ignored-dir                (:inherit 'sidebar-untracked))
  (sidebar-ignored-file               (:inherit 'sidebar-untracked))
  (sidebar-match                      (:foreground cs-green))
  (sidebar-not-updated                (:foreground cs-red))
  (sidebar-powerline                  (:background cs-selection))
  (sidebar-primary-color              (:foreground cs-white :background cs-blue))
  (sidebar-remote-branch              (:inherit 'sidebar-primary-color))
  (sidebar-renamed                    (:inherit 'sidebar-changed))
  (sidebar-select-header              (:inherit 'sidebar-primary-color))
  (sidebar-select-line                (:inherit 'sidebar-primary-color))
  (sidebar-suffix-path-header         (:foreground cs-gray))
  (sidebar-untracked                  (:inherit 'font-lock-comment-face))
  (sidebar-updated                    (:foreground cs-green))
  
  
  ;; tab bar
  (tab-bar                            (:inherit 'variable-pitch :foreground cs-black :background cs-lt-bg))
  (tab-line                           (:inherit 'tab-bar :underline t))
  
  ;; toolbar
  (tool-bar                           (:foreground cs-black :background cs-lt-bg :box (:line-width 2 :color cs-dk-bg :style 'released-button)))
  
  ;; web
  (web-mode-doctype-face              (:inherit 'font-lock-comment-face))
  (web-mode-html-tag-face             (:foreground cs-pink))
  (web-mode-html-attr-name-face       (:foreground cs-orange))

  ;; widget
  (widget-field                       (:foreground cs-black :background cs-lt-bg :box (:color cs-lt-gray)))
  (widget-single-line-field           (:inherit 'widget-field))

  ;; window dividers
  (window-divider                     (:foreground cs-dk-bg :background cs-black))
  (window-divider-first-pixel         (:inherit 'window-divider))
  (window-divider-last-pixel          (:inherit 'window-divider))
  ))



(provide-theme 'colorful-sepia)

