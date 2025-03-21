;; emacs configuration

(require 'package)
(require 'splash-screen)

;;(setq theme 'bearded-arc)
(setq theme 'bearded-milkshake)

(add-to-list 'exec-path "~/.cabal/bin/")

(let ((default-directory "~/.emacs.d/load/"))
	(normal-top-level-add-subdirs-to-load-path))

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Packaging
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("gnu-devel" . "https://elpa.gnu.org/devel/"))
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; My Custom Stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Allow Clipboard
(setq x-select-enable-clipboard t)

;; Disable menu bar
(menu-bar-mode -1)

;; Parentheses
(electric-pair-mode t)
(rainbow-delimiters-mode t)

;; No more ~ files
(setq make-backup-files nil)

;; Line numbers on the side
(global-display-line-numbers-mode 1)

;; Custom keybinds
(global-set-key (kbd "M-<down>") 'scroll-up-line)
(global-set-key (kbd "M-<up>") 'scroll-down-line)
(global-set-key (kbd "C-c C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-c C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-c C-<down>") 'shrink-window)
(global-set-key (kbd "C-c C-<up>") 'enlarge-window)

;; Dired sidebar
(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :init
  (add-hook 'dired-sidebar-mode-hook
            (lambda ()
	      (display-line-numbers-mode 0)
              (unless (file-remote-p default-directory)
                (auto-revert-mode))))
  :config
  (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
  (push 'rotate-windows dired-sidebar-toggle-hidden-commands)

  (setq dired-sidebar-use-term-integration t)
  (setq dired-sidebar-use-custom-font 0)
  (setq dired-sidebar-width 25))

;; Deduce
(add-to-list 'auto-mode-alist '("\\.pf\\'" . deduce-mode))
(setq deduce-path "~/Projects/deduce-stuff/deduce/deduce.py")

;; Coq
(defun coq-start ()
  (define-key coq-mode-map (kbd "M-<down>") 'scroll-up-line)
  (define-key coq-mode-map (kbd "M-<up>") 'scroll-down-line))
(add-hook 'coq-mode-hook #'company-coq-mode)
(add-hook 'coq-mode-hook 'coq-start)
(setq proof-splash-enable nil)
(setq coq-compile-before-require t)

;; Rofi
(add-to-list 'auto-mode-alist '("\\.rasi\\'" . css-mode))

;; JSON
(add-to-list 'auto-mode-alist '("\\.jsonc\\'" . json-mode))

;; Racket schtuff
(defun my-racket-faces ()
  "Buffer-local face remapping for `racket-mode-hook`."
  (cond
   ((eq theme 'bearded-arc)
    (face-remap-add-relative 'font-lock-comment-delimiter-face
			     '(:foreground "#ffb75e"))
    (face-remap-add-relative 'font-lock-comment-face
			     '(:foreground "#ffb75e")))
   ((eq theme 'bearded-milkshake)
    (face-remap-add-relative 'font-lock-comment-delimiter-face
			     '(:foreground "#c57600"))
    (face-remap-add-relative 'font-lock-comment-face
			     '(:foreground "#c57600")))))

(defun racket-start ()
  (rainbow-delimiters-mode 1)
  (flymake-mode 1)
  (define-key flymake-mode-map (kbd "M-n") 'open-small-flymake)
  (define-key racket-mode-map (kbd "C-c C-l") 'racket-run-module-at-point)
  (define-key racket-mode-map (kbd "C-c C-k") 'racket-repl-clear-leaving-last-prompt))

(defun open-small-flymake ()
  "Open flymake in minimized window"
  (interactive)
  (let ((split-width-threshold nil)
        (split-height-threshold 0))
    (flymake-show-buffer-diagnostics)
    (maximize-window)))

(add-hook 'racket-mode-hook 'my-racket-faces)
(add-hook 'racket-mode-hook 'racket-start)

(with-eval-after-load 'racket-mode
  ;; Redefine `test-fun` to change its internals
  (defun racket--sexp-comment-face-spec-set (face)
    "Create or refresh a faded variant of FACE."
    (let* ((fg (if noninteractive "black" (face-foreground face nil 'default)))
           (bg (if noninteractive "white" "#1c2433"))
           (fg-rgb (color-name-to-rgb fg))
           (bg-rgb (color-name-to-rgb bg))
           (pct (- 1.0 (color-clamp (or racket-sexp-comment-fade 1.0))))
           (faded-rgb (cl-mapcar (lambda (fg bg)
                                   (color-clamp
                                    (+ (* fg pct)
                                       (* bg (- 1.0 pct)))))
				 fg-rgb bg-rgb))
           (faded (apply #'color-rgb-to-hex faded-rgb))
           (other-props (apply #'append
                               (mapcar (pcase-lambda (`(,k . ,v))
					 (unless (or (eq k :foreground)
                                                     (eq k :inherit)
                                                     (eq v 'unspecified))
                                           (list k v)))
                                       (face-all-attributes face))))
           (spec `((t (:foreground ,faded ,@other-props))))
           (doc (format "A faded variant of the face `%s'.\nSee the customization variable `racket-sexp-comment-fade'." face))
           (faded-face-name (racket--sexp-comment-face-name face)))
      (face-spec-set faded-face-name spec)
      (set-face-documentation faded-face-name doc))))

(use-package flymake-racket
  :ensure t
  :commands (flymake-racket-add-hook)
  :init 
  (add-hook 'scheme-mode-hook #'flymake-racket-add-hook)
  (add-hook 'racket-mode-hook #'flymake-racket-add-hook))

;; Shell mode
(defun my-shell-hook ()
  (define-key shell-mode-map (kbd "C-c C-k") 'comint-clear-buffer))
(add-hook 'shell-mode-hook 'my-shell-hook)

;; C schtuff
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(require 'company-irony)
(eval-after-load 'company
 '(add-to-list 'company-backends 'company-irony))

(add-to-list 'company-backends 'company-irony-c-headers)

(add-hook 'c++-mode-hook 'company-mode)
(add-hook 'c-mode-hook 'company-mode)
(add-hook 'objc-mode-hook 'company-mode)

(defun c-start ()
  (rainbow-identifiers-mode 0)
  (rainbow-delimiters-mode 1)
  (define-key c-mode-map (kbd "<tab>")        'company-indent-or-complete-common))
(add-hook 'c-mode-hook 'c-start)

(with-eval-after-load 'c-mode
  (setq-local comment-start "//")
  (setq-local comment-end ""))

;; Prog mode
(defun prog-start ()
  (hs-minor-mode 1)
  (define-key prog-mode-map (kbd "C-x <down>")   'hs-hide-block)
  (define-key prog-mode-map (kbd "C-x <up>")     'hs-show-block)
  (define-key prog-mode-map (kbd "C-x C-<down>") 'hs-hide-all)
  (define-key prog-mode-map (kbd "C-x C-<up>")   'hs-show-all))
(add-hook 'prog-mode-hook 'prog-start)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Themeing
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme theme t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "adobe" :slant normal :weight normal :height 98 :width normal))))
 '(agda2-highlight-datatype-face ((t (:foreground "#83d9ec"))))
 '(agda2-highlight-field-face ((t (:foreground "#4ff87a"))))
 '(agda2-highlight-function-face ((t (:foreground "#4ff87a" :weight heavy))))
 '(agda2-highlight-inductive-constructor-face ((t (:foreground "#F92672"))))
 '(agda2-highlight-keyword-face ((t (:foreground "#ff79c6" :weight heavy))))
 '(agda2-highlight-module-face ((t (:foreground "#AE81FF"))))
 '(agda2-highlight-number-face ((t (:foreground "#AE81FF"))))
 '(agda2-highlight-postulate-face ((t (:foreground "#83d9ec"))))
 '(agda2-highlight-primitive-face ((t (:foreground "#d76aab"))))
 '(agda2-highlight-primitive-type-face ((t (:foreground "#83d9ec")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (list theme))
 '(custom-safe-themes
   '("f7d57adb83a251eceb28667be13f452dd87bd1ee2c3576ed1c00310a6cff3bab"
     "70e13a2438b49225b847a24ea1fb46b4f10ceeb7fe3992f9ad4f7d85277b3a7f"
     "f74c486087708e5d0041f946a37aa8fa3bb6e203f667676836b255cc1724752b"
     "17e2e0cc05273f745e88422f91520b92cf90186f6717b2ba7dee4d827ee537e8"
     "f860b04ebbfd0b39aedb1baf4b8399aa38f4bc4bb9f31190dc0d53cf8d183024"
     "c004d2637fc9e136dce5f916155ba0fcd3f9a44270a2eef632868671c8a5b3ba"
     "ac800c8c139d4d3d7633a46febe6d8d0a1b3e65366688c72186a5c0df2e0918a"
     "513fcf30c10a67413bb3f7afb18da72e1d64e6f42c8fc94007f53aba255972fd"
     "73a3a2142fb242eddfb51e993505b92d0ddc25813488974101e89e4a6a5f6856"
     "fa74a2f232c1c4370c59c3e70b16fe12463f2db0d0ce8994e8cadcad8d04ef38"
     "6ea0d8641842494dc317eaa8553d2cd39cd42fce8ae501a98fd4bb25c11dd90e"
     "0eb30f621220f357fb6979bf9f3bf307988f847ba95ba2d5dd6bd2a37162ac6a"
     "ac8090c8304da9d471e29f265664ca6c7ff0a2d07e48d798a7e71a438f0597cb"
     "59bb87b571b4199bbdc8abe2d4114d730de6d7437aff9bfee5494f9588935d29"
     "7ba51cc112f71945eef810db74261eec3b9e406ec3df0d08cec8a2f9e8bff1c6"
     "5d6bdbc3e866e59dcd973f89b42cd0fc6a44be7e935596a40bec9f179e92d185"
     "544fe91862ff2c7c6a4b0f58770d4df637d7434056717df9ccdd390794304240"
     "85afd7da0d9ee9ce804d76b1347bf5d3e424f332b395a6ff9b5aa8fe990aa9bb"
     "2fda9e21d8db1824c0d9e30c232247ff5f5d4e72ac441e44c0adb716b00a9d45"
     "29bbe3d7926ec60e5d0b6d3b800225ce9e7cd3f662380639307b7925b079812d"
     "8683e173cbb5042988d931174252a914b063da628c415a7a7ec656b3d739a07f"
     "13a2a0a8bcd07fd5a2525b5fe772955e28470e6002ec4d9831a98805b6483f01"
     "b3b2b1b3c651369ddc6034f61f2b310e4df9d1a96848649299eecd300da1e3ad"
     "f2e5efb8ba80b9f81896e333f57c23590ab2b4e91fbb29dbc21382fc3b4dff5b"
     "8897fc5d4da31f967d18582a9d9a7895552b4d1644fa0a4efe1219b2bdb89f6c"
     "88e4fd3891763982c426192de2ed6d4122939d333805203fff79ae1ccd96d692"
     "ad61a09015224edeaf28dac560503d953d4df6a5ea2b043af1f7a8f3bac2ea91"
     "cdec7e13c26bd3f8bb4d403216312e25440a6dcd202526606551e5c064ef0a98"
     "7dc0705b07200e3e65ac8808ca30057e25f0007f8556c9fbead78f29488f08f0"
     "086240f519837a4ba1b73e20f54c38553df6f7e00098d37ae3d5c7e270b54d5f"
     "1ae942c6149414cb35400bd29fd083c061b34dca86868982700e3e72dd2bdb6d"
     "40cdec0605c3a3022790c1af7d702de6d413344a1d8703133fe81ec853825ee9"
     "03371f449497ce36d74e356139837a324695df30e2d049d43472b4fcbb94215c"
     "eab2f23f7e93e736940ab2d488a34d8292fcd0f40c784a44d3a71387789cb471"
     "dd4f25d66e6e5605b74c6a36a12a80f16f39d2867af35ed220fb416401eac0eb"
     "05c27ad7c7c69dbecbc062c68c6d1e8589e8c822a0aab90d2830376bf0578cc7"
     "dd58c2ceff385996d08d86f619645df5bd64124efdf547863c656e5b4e4ad998"
     "2295b364edc57007c6c0978465d41c9d5e719afac7abebfb27f11413c6ba5817"
     "fbce5b7ecfa652bd5b9b42a85634e164919f489a64593fe710751ea9b2c3123f"
     "0bdd1464e7e07dc6b4893f3b41030f28d94ab945eef872d989da271a6537a4a4"
     "dcd9d51a38e8a00c6977c6c6173cbc3f1773dac8ea58dd3b1ee434445cc645e2"
     "2b64b0a8da0c44e8ce460c995d649f8c222bb15f87f175f4c1ec2b306b5194b1"
     "280d4e94a0600edfd949648df39558fe1ca24ce29ea89201457176da37225277"
     "2b95bac654989085c55f07d946df5641f124a2a330c526153d14f5509181fc49"
     "404101c9f98ad0e88f10695ef3610563732a6a4c2478acfded0af57044b97992"
     "2cdd8cb2c0e2216c239d54bb3fd3146c22c68342ee9b09a77a58f79c213b55be"
     "4172de7a3099c3bb61b182b5e58387fe541d7936f863ac8af38141143d074261"
     "9bf8feea8eed9fab0238a7177490ce56e7dde0709a9e391d33e877d5eb51685e"
     "d4488fb2a06577508a6e5423aa6006bbd17a8be18460ecb706bbb71e5e086290"
     "f32d70b8a08f41b55f5f13fef1e50ea32ca56bac0c6ec945caca93bbc2821e8c"
     "5e82e01fe8205a978339eabc009cb207a4cd3dbfbb1c9125e08b09336e134367"
     "afd57cedec2ee8a2a1294e67fdb4d31898c4fbe163a36c40e23050d1433c4dbb"
     "dea7e0ab94b6d084fcf15bd6a20cfc3eb560b2e2efb8adfeb9b59610f25da354"
     "4b2d47fe5665cd031704fef04136f5e6adf4df26b9a7c87e1e9779e03bb03236"
     "a4f10418a41356cfb99138738ce9aa38cb87ae9c791626de3b2d693ce61d7366"
     "407f2c4a8aaba02fb1df805991cecd656ac859059eb9cfa7e036f358b8802103"
     "02d7627091ffef7a0e4f60e30595adcab29d23adff359bcde77ff48f7c69a0b8"
     "7a8c710945153c833ef2d1d9332f621fe5eb5daf64c73250318f80cd346ab81d"
     "1f7e09b3e7c5c7295eebc5ba6b40a0ff1c791dc9081f4bb2977af9b27fb0cfd5"
     "85699291f2fbd2c9ba5d694c468412a00f40a02fa5e5efd4d25bff0bca3c858d"
     "7f15ff0896fe89ae13a4788046ef141786c4127c3fe5f91d4e69bb3b26ab34b2"
     "26b07bf7ba121b1cca5f6c64135415c2d5fd3933ab69fbbabff479c58658fcf8"
     "ebac8a7cd3a87ee4e5882ed033a9fcfcd1af3023e2454ac4e7dd08edbc120c3f"
     "a2b3a4ce8a187396a55a3a04d6a807c2478e8b204af6771362e91019e0a77dcb"
     "45717a1060e2fcb1641e972d87b05b2dd75675fc669c1b8883dd5336288e4ce1"
     "ae230be8fbff413b495b8acfd2033ec5c8c702b022a66a12bd53773dc4fed090"
     "e7fda9def9b330d9cca7159f2fa5e46958288f395a2b18867ad5058892455e36"
     "6351cd2ad96801127286d22a2957ebe94bfd61f085cedfa18fc3ff901cbf22f5"
     "0e71a0471df21fd46e4e9bdb409a1c017d8a9fb64f4b13bc7b278a51754e00b0"
     "7432c1fda8f5d4ec1ef7562abf07d787cbcecbaf898254054d3c5cc9d22e6aab"
     "f9f539f9244168622006754ad5a8190b47615ff46a2ae7a4ef8d285d8e290267"
     "a18eb9558abb09a418b46e2d0a7cd5bcb08c2ac5e10258987725f25e18034820"
     "a22f8a4d17b916b55b4745a3035e4bc0eadf6ce54b2b118fedd0d1ee3b69638e"
     "4ddddcaa1a512e172e06c9b1397ddc887ea5f165b618752d9b73185b1299bf29"
     "8de49e355d96a07beabfc1919e961ad87d7d63d0ba8edc3da1a12d45276cbbb5"
     "7fd02ca5e412da32a0e7cb6881e70012122b651af0c058d7ff451976ef6d32b5"
     "3e7ff296392da297015f7b4095928c8e0a31173fa57e2171dd396cbb0f4063bb"
     "8c7e832be864674c220f9a9361c851917a93f921fedb7717b1b5ece47690c098"
     "f4d1b183465f2d29b7a2e9dbe87ccc20598e79738e5d29fc52ec8fb8c576fcfd"
     "cbc8dee011906427c45f4757d2c4c41749309d92037eb296f7d6d77fc93c7014"
     "8190f278193fbe359843ccbb969c722c1b9f710d11c1f593e35d1deaf7a481ac"
     "1a2a53c7a0517dafcb85e0196a5de451668adac22cd8b0f112bf605e87489eda"
     "042fe5b1f435086a27456eaec477f5154adf4b34994e433d08dac0d82877822a"
     "d10f3a1a3bc7cef84cd6b6812b450a8b511bec4b67a62fb7d4510fc0430d1bbf"
     "f44bb32804c6dc06f539c82ff978f7178eef577caa90c0b89260fa4e67ba3322"
     "2f6a54ad14a28dbecafc9c7f2f9089948815ccff9d9739bec8475d9cd0905716"
     default))
 '(package-selected-packages
   '(## autothemer color-identifiers-mode company-coq company-irony
	company-irony-c-headers deduce-mode dired-sidebar emmet-mode
	flymake-racket git-modes go-mode haskell-mode
	highlight-numbers impatient-mode irony json-mode markdown-mode
	melancholy-theme parent-mode proof-general racket-mode
	rainbow-delimiters rainbow-identifiers splash-screen
	splash-screen-new tagedit web-mode)))
