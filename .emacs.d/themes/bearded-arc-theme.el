(require 'autothemer)

(autothemer-deftheme
 bearded-arc "Emacs version of bearded arc for VSCode"

 ((((class color) (min-colors #xFFFFFF)))

  ;; color palette
  (arc-black        "#000000")
  (arc-white        "#d1d8e1")
  (arc-gray         "#565f71")
  (arc-dk-gray      "#586668")
  (arc-pink         "#f38cec")
  (arc-blue         "#69c3ff")
  (arc-yellow       "#d7c855")
  (arc-purple       "#a480ed")
  (arc-dk-purple    "#502b99")
  (arc-green        "#3adf68")
  (arc-red          "#ff738a")
  (arc-dk-red       "#e35535")
  (arc-orange       "#ff9158")
  (arc-teal         "#22e6bb")
  (arc-dk-teal      "#1d384f")
  
  (arc-bg           "#1c2433")
  (arc-dk-bg        "#181f2c")
  (arc-selection    "#43345e")
  (arc-comment      "#7b88a8")

  (arc-variable-1   "#99d6ff")
  (arc-variable-2   "#fab9f5")
  (arc-variable-3   "#f5e98c")
  (arc-variable-4   "#f7d8a8")
  (arc-variable-5   "#9dedb3")
  (arc-variable-6   "#f7a8b5"))
 
 ;; Customize faces
 ((default                            (:foreground arc-white))
  (cursor                             (:background arc-red))
  (region                             (:background arc-selection))
  (match                              (:background arc-selection))
  (show-paren-match                   (:foreground arc-pink :background arc-selection :weight 'bold))
  (header-line                        (:background arc-dk-bg))
  (mode-line                          (:background arc-dk-bg))
  (mode-line-inactive                 (:background arc-dk-bg))
  (line-number                        (:foreground arc-gray))
  (shadow                             (:foreground arc-comment))
  (minibuffer-prompt                  (:foreground arc-blue :weight 'bold))
  (warning                            (:foreground arc-pink :weight 'bold))
  (error                              (:foreground arc-red :weight 'bold))
  
  ;; Font lock
  (font-lock-string-face              (:foreground arc-green))
  (font-lock-keyword-face             (:foreground arc-blue))
  (font-lock-comment-face             (:foreground arc-comment))
  (font-lock-comment-delimiter-face   (:foreground arc-comment))
  (font-lock-function-name-face       (:foreground arc-purple :weight 'bold))
  (font-lock-constant-face            (:foreground arc-pink))
  (font-lock-variable-name-face       (:foreground arc-pink :weight 'bold))
  (font-lock-builtin-face             (:foreground arc-blue))
  (font-lock-warning-face             (:foreground arc-red :weight 'bold))
  (font-lock-type-face                (:foreground arc-purple))

  ;; Rainbow delimiters
  (rainbow-delimiters-depth-1-face    (:foreground arc-yellow))
  (rainbow-delimiters-depth-2-face    (:foreground arc-pink))
  (rainbow-delimiters-depth-3-face    (:foreground arc-blue))
  (rainbow-delimiters-depth-4-face    (:foreground arc-purple))
  (rainbow-delimiters-depth-5-face    (:foreground arc-teal))
  (rainbow-delimiters-depth-6-face    (:foreground arc-red))
  (rainbow-delimiters-depth-7-face    (:foreground arc-yellow))
  (rainbow-delimiters-depth-8-face    (:foreground arc-pink))
  (rainbow-delimiters-depth-9-face    (:foreground arc-blue))

  ;; Rainbow identifiers
  (rainbow-identifiers-identifier-1   (:foreground arc-variable-1))
  (rainbow-identifiers-identifier-2   (:foreground arc-variable-2))
  (rainbow-identifiers-identifier-3   (:foreground arc-variable-3))
  (rainbow-identifiers-identifier-4   (:foreground arc-variable-4))
  (rainbow-identifiers-identifier-5   (:foreground arc-variable-5))
  (rainbow-identifiers-identifier-6   (:foreground arc-variable-6))
  (rainbow-identifiers-identifier-7   (:foreground arc-variable-1))
  (rainbow-identifiers-identifier-8   (:foreground arc-variable-2))
  (rainbow-identifiers-identifier-9   (:foreground arc-variable-3))
  (rainbow-identifiers-identifier-10  (:foreground arc-variable-4))
  (rainbow-identifiers-identifier-11  (:foreground arc-variable-5))
  (rainbow-identifiers-identifier-12  (:foreground arc-variable-6))
  (rainbow-identifiers-identifier-13  (:foreground arc-variable-1))
  (rainbow-identifiers-identifier-14  (:foreground arc-variable-2))
  (rainbow-identifiers-identifier-15  (:foreground arc-variable-3))

  ;; company
  (company-template-field             (:background arc-selection))
  
  ;; racket
  (racket-reader-quoted-symbol-face   (:foreground arc-green))

  ;; flymake
  (flymake-warning                    (:background arc-dk-red :underline nil))

  ;; coq
  (proof-locked-face                  (:background arc-dk-teal :underline nil))
  (proof-tactics-name-face            (:foreground arc-orange :underline nil))
  (coq-solve-tactics-face             (:foreground arc-red))
  (coq-cheat-face                     (:background arc-dk-red))
  (company-coq-features/code-folding-bullet-face (:underline nil))
  ))



(provide-theme 'bearded-arc)

