(require 'autothemer)

(setq default-frame-alist
      (append
       '((background-color . "#f4d39a")
         (foreground-color . "#4f4239")
         (cursor-color     . "#4f4239"))
       default-frame-alist))

(autothemer-deftheme
 bearded-milkshake "Emacs version of bearded milkshake for VSCode"

 ((((class color) (min-colors #xFFFFFF)))

  ;; color palette
  (milkshake-black        "#4f4239")
  (milkshake-white        "#f2f2f2")
  (milkshake-gray         "#6d645e")
  (milkshake-dk-gray      "#586668")
  (milkshake-pink         "#cb27b0")
  (milkshake-lt-blue      "#c0dded")
  (milkshake-blue         "#0076c5")
  (milkshake-lt-purple    "#d2c5bd")
  (milkshake-purple       "#7522d3")
  (milkshake-dk-purple    "#4d079e")
  (milkshake-lt-green     "#acdb99")
  (milkshake-green        "#088d17")
  (milkshake-lt-red       "#fca1a4")
  (milkshake-red          "#9b0a12")
  (milkshake-dk-red       "#e35535") 
  (milkshake-orange       "#bd4507")
  (milkshake-teal         "#4e9297")
  (milkshake-dk-teal      "#306468")
  (milkshake-lt-cyan      "#d2dbbd")
  (milkshake-cyan         "#00c1bc")
  (milkshake-dk-cyan      "#099e99")
  
  (milkshake-bg           "#f4d39a")
  (milkshake-dk-bg        "#f2dea9")
  (milkshake-dk-dk-bg     "#f2d993")
  (milkshake-dk-dk-dk-bg  "#e8bd78")
  (milkshake-selection    "#f998b8")
  (milkshake-comment      "#7b7071")

  (milkshake-variable-1   "#99d6ff")
  (milkshake-variable-2   "#fab9f5")
  (milkshake-variable-3   "#f5e98c")
  (milkshake-variable-4   "#f7d8a8")
  (milkshake-variable-5   "#9dedb3")
  (milkshake-variable-6   "#f7a8b5"))
 
 ;; Customize faces
 ((default                            (:foreground milkshake-black :background milkshake-bg))
  (cursor                             (:background milkshake-red))
  (region                             (:background milkshake-selection))
  (match                              (:inherit 'region))
  (highlight                          (:inherit 'region))
  (show-paren-match                   (:inherit 'region :foreground milkshake-pink :weight 'bold))
  (header-line                        (:background milkshake-dk-dk-bg))
  (mode-line                          (:background milkshake-dk-dk-dk-bg))
  (mode-line-active                   (:background milkshake-dk-dk-dk-bg))
  (mode-line-inactive                 (:background milkshake-dk-dk-dk-bg))
  (mode-line-highlight                (:background milkshake-dk-dk-dk-bg))
  (line-number                        (:foreground milkshake-gray))
  (shadow                             (:foreground milkshake-comment))
  (minibuffer-prompt                  (:foreground milkshake-blue :weight 'bold))
  (warning                            (:foreground milkshake-pink :weight 'bold))
  (error                              (:foreground milkshake-red :weight 'bold))
  (link                               (:foreground milkshake-dk-cyan :underline t))
  (button                             (:inherit 'link))
  (browse-url-button                  (:inherit 'link))
  (info-xref                          (:inherit 'link))
  (info-header-xref                   (:inherit 'link))
  (shr-link                           (:inherit 'link))
  (package-name                       (:inherit 'link))
  (lazy-highlight                     (:foreground milkshake-black :background milkshake-dk-cyan))
  (isearch-fail                       (:foreground milkshake-white :background milkshake-red))
  (success                            (:foreground milkshake-green))
  (completions-common-part            (:foreground milkshake-blue))

  (window-divider                     (:foreground milkshake-dk-dk-bg :background milkshake-black))
  (window-divider-first-pixel         (:inherit 'window-divider))
  (window-divider-last-pixel          (:inherit 'window-divider))
  
  ;; Font lock
  (font-lock-string-face              (:foreground milkshake-green))
  (font-lock-keyword-face             (:foreground milkshake-blue))
  (font-lock-comment-face             (:foreground milkshake-comment :slant 'italic))
  (font-lock-comment-delimiter-face   (:foreground milkshake-comment :slant 'italic))
  (font-lock-function-name-face       (:foreground milkshake-purple :weight 'bold))
  (font-lock-constant-face            (:foreground milkshake-pink))
  (font-lock-variable-name-face       (:foreground milkshake-pink :weight 'bold))
  (font-lock-builtin-face             (:foreground milkshake-blue))
  (font-lock-warning-face             (:foreground milkshake-red :weight 'bold))
  (font-lock-type-face                (:foreground milkshake-purple))

  ;; Rainbow delimiters
  (rainbow-delimiters-depth-1-face    (:foreground milkshake-pink))
  (rainbow-delimiters-depth-2-face    (:foreground milkshake-blue))
  (rainbow-delimiters-depth-3-face    (:foreground milkshake-purple))
  (rainbow-delimiters-depth-4-face    (:foreground milkshake-teal))
  (rainbow-delimiters-depth-5-face    (:foreground milkshake-red))
  (rainbow-delimiters-depth-6-face    (:foreground milkshake-pink))
  (rainbow-delimiters-depth-7-face    (:foreground milkshake-blue))
  (rainbow-delimiters-depth-8-face    (:foreground milkshake-purple))
  (rainbow-delimiters-depth-9-face    (:foreground milkshake-teal))

  ;; Rainbow identifiers
  (rainbow-identifiers-identifier-1   (:foreground milkshake-variable-1))
  (rainbow-identifiers-identifier-2   (:foreground milkshake-variable-2))
  (rainbow-identifiers-identifier-3   (:foreground milkshake-variable-3))
  (rainbow-identifiers-identifier-4   (:foreground milkshake-variable-4))
  (rainbow-identifiers-identifier-5   (:foreground milkshake-variable-5))
  (rainbow-identifiers-identifier-6   (:foreground milkshake-variable-6))
  (rainbow-identifiers-identifier-7   (:foreground milkshake-variable-1))
  (rainbow-identifiers-identifier-8   (:foreground milkshake-variable-2))
  (rainbow-identifiers-identifier-9   (:foreground milkshake-variable-3))
  (rainbow-identifiers-identifier-10  (:foreground milkshake-variable-4))
  (rainbow-identifiers-identifier-11  (:foreground milkshake-variable-5))
  (rainbow-identifiers-identifier-12  (:foreground milkshake-variable-6))
  (rainbow-identifiers-identifier-13  (:foreground milkshake-variable-1))
  (rainbow-identifiers-identifier-14  (:foreground milkshake-variable-2))
  (rainbow-identifiers-identifier-15  (:foreground milkshake-variable-3))

  ;; company
  (company-template-field                  (:inherit 'region))
  (company-preview                         (:background milkshake-dk-bg))
  (company-preview-common                  (:foreground milkshake-blue))
  (company-preview-search                  (:foreground milkshake-blue))
  (company-tooltip                         (:background milkshake-dk-bg))
  (company-tooltip-annotation              (:foreground milkshake-orange))
  (company-tooltip-annotation-selection    (:foreground milkshake-orange))
  (company-tooltip-common                  (:foreground milkshake-blue))
  (company-tooltip-common-selection        (:foreground milkshake-blue))
  (company-tooltip-mouse                   (:background milkshake-lt-blue))
  (company-tooltip-quick-access-selection  (:foreground milkshake-orange)) 
  (company-tooltip-quick-access-selection  (:foreground milkshake-orange))
  (company-tooltip-scrollbar-thumb         (:background milkshake-dk-dk-dk-bg))
  (company-tooltip-scrollbar-track         (:background milkshake-dk-dk-bg))
  (company-tooltip-search                  (:inherit 'region))
  (company-tooltip-search-selection        (:inherit 'region))
  (company-tooltip-selection               (:inherit 'region))
  (completions-highlight                   (:background milkshake-blue))

  ;; prog-mode
  (compilation-info                   (:foreground milkshake-green))
  
  ;; racket
  (racket-reader-quoted-symbol-face   (:foreground milkshake-green))

  ;; flymake
  (flymake-warning                    (:background milkshake-dk-red :underline nil))

  ;; sh
  (sh-heredoc                         (:foreground milkshake-orange))
  (sh-quoted-exec                     (:foreground milkshake-purple))
  
  ;; coq
  (proof-queue-face                               (:inherit 'region))
  (proof-locked-face                              (:background milkshake-lt-blue :underline nil))
  (proof-tactics-name-face                        (:foreground milkshake-orange :underline nil))
  (coq-solve-tactics-face                         (:foreground milkshake-red))
  (coq-cheat-face                                 (:background milkshake-dk-red))
  (company-coq-features/code-folding-bullet-face  (:underline nil))

  ;; ansi
  (ansi-color-black                               (:foreground "#4f4239" :background "#4f4239"))
  (ansi-color-blue                                (:foreground "#0076c5" :background "#0076c5"))
  (ansi-color-cyan                                (:foreground "#4e9297" :background "#4e9297"))
  (ansi-color-green                               (:foreground "#088d17" :background "#088d17"))
  (ansi-color-magenta                             (:foreground "#cb27b0" :background "#cb27b0"))
  (ansi-color-red                                 (:foreground "#c41922" :background "#c41922"))
  (ansi-color-white                               (:foreground "#ABB2BF" :background "#ABB2BF"))
  (ansi-color-yellow                              (:foreground "#d47307" :background "#d47307"))

  ;; git merge
  (smerge-base                                    (:background milkshake-dk-dk-bg))
  (smerge-markers                                 (:background milkshake-dk-dk-dk-bg))
  (smerge-upper                                   (:background milkshake-lt-cyan))
  (smerge-lower                                   (:background milkshake-lt-purple))
  (smerge-refined-changed                         (:foreground milkshake-black))
  (smerge-refined-added                           (:background milkshake-lt-green))
  (smerge-refined-removed                         (:background milkshake-lt-red))

  ;; markdown
  (markdown-header-face-1                         (:foreground milkshake-purple))
  (markdown-header-face-2                         (:foreground milkshake-blue))
  (markdown-header-face-3                         (:foreground milkshake-green))
  (markdown-header-face-4                         (:foreground milkshake-red))
  (markdown-header-face-5                         (:foreground milkshake-pink))
  (markdown-link-face                             (:inherit 'link))

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
  
  ;; org
  (org-agenda-structure                           (:foreground milkshake-black :weight 'bold))
  (org-agenda-date                                (:foreground milkshake-blue))
  (org-agenda-date-today                          (:foreground milkshake-purple :weight 'bold))
  (org-agenda-date-weekend                        (:foreground milkshake-blue :weight 'bold))

  ;; web
  (web-mode-doctype-face                          (:inherit 'font-lock-comment-face))
  (web-mode-html-tag-face                         (:foreground milkshake-pink))
  (web-mode-html-attr-name-face                   (:foreground milkshake-orange))

  ;; anzu
  (anzu-mode-line                                 (:foreground milkshake-pink :weight 'bold))
  (anzu-mode-line-no-match                        (:inherit 'anzu-mode-line))
  ))



(provide-theme 'bearded-milkshake)

