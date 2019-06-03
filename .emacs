;;---------------------------------------;;
;;------------Initial Config-------------;;
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(package-initialize)
;; bootstrap for use-package for new instalations
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
;; chords
(use-package use-package-chords
  :ensure t
  :config (key-chord-mode 1)
  )
;;------------Initial Config-------------;;
;;---------------------------------------;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(ansi-term-color-vector
   [unspecified "#fdf6e3" "#dc322f" "#859900" "#b58900" "#268bd2" "#6c71c4" "#268bd2" "#586e75"] t)
 '(cua-mode nil nil (cua-base))
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" "b583823b9ee1573074e7cbfd63623fe844030d911e9279a7c8a5d16de7df0ed0" "585942bb24cab2d4b2f74977ac3ba6ddbd888e3776b9d2f993c5704aa8bb4739" "8f97d5ec8a774485296e366fdde6ff5589cf9e319a584b845b6f7fa788c9fa9a" "a22f40b63f9bc0a69ebc8ba4fbc6b452a4e3f84b80590ba0a92b4ff599e53ad0" "b46ee2c193e350d07529fcd50948ca54ad3b38446dcbd9b28d0378792db5c088" "dd2346baba899fa7eee2bba4936cfcdf30ca55cdc2df0a1a4c9808320c4d4b22" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "99c86852decaeb0c6f51ce8bd46e4906a4f28ab4c5b201bdc3fdf85b24f88518" "0c3b1358ea01895e56d1c0193f72559449462e5952bded28c81a8e09b53f103f" "60e09d2e58343186a59d9ed52a9b13d822a174b33f20bdc1d4abb86e6b17f45b" "7bef2d39bac784626f1635bd83693fae091f04ccac6b362e0405abf16a32230c" "d2bd16a8bcf295dce0b70e1d2b5c17bb34cb28224a86ee770d56e6c22a565013" "bc4c89a7b91cfbd3e28b2a8e9e6750079a985237b960384f158515d32c7f0490" "aea30125ef2e48831f46695418677b9d676c3babf43959c8e978c0ad672a7329" "1263771faf6967879c3ab8b577c6c31020222ac6d3bac31f331a74275385a452" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" "9c4acf7b5801f25501f0db26ac3eee3dc263ed51afd01f9dcfda706a15234733" "264b639ee1d01cd81f6ab49a63b6354d902c7f7ed17ecf6e8c2bd5eb6d8ca09c" "36282815a2eaab9ba67d7653cf23b1a4e230e4907c7f110eebf3cdf1445d8370" "7559ac0083d1f08a46f65920303f970898a3d80f05905d01e81d49bb4c7f9e39" "6daa09c8c2c68de3ff1b83694115231faa7e650fdbb668bc76275f0f2ce2a437" "cbd8e65d2452dfaed789f79c92d230aa8bdf413601b261dbb1291fb88605110c" "85e6bb2425cbfeed2f2b367246ad11a62fb0f6d525c157038a0d0eaaabc1bfee" "d9850d120be9d94dd7ae69053630e89af8767c36b131a3aa7b06f14007a24656" "ddd5045ceb90356295b99a4da14200604bfc1dd658a3af568bd8a9961a5c4e5f" "4a91a64af7ff1182ed04f7453bb5a4b0c3d82148d27db699df89a5f1d449e2a4" "fb44ced1e15903449772b750c081e6b8f687732147aa43cfa2e7d9a38820744b" "0961d780bd14561c505986166d167606239af3e2c3117265c9377e9b8204bf96" "ecfd522bd04e43c16e58bd8af7991bc9583b8e56286ea0959a428b3d7991bbd8" "722e1cd0dad601ec6567c32520126e42a8031cd72e05d2221ff511b58545b108" "65f35d1e0d0858947f854dc898bfd830e832189d5555e875705a939836b53054" "c614d2423075491e6b7f38a4b7ea1c68f31764b9b815e35c9741e9490119efc0" "760ce657e710a77bcf6df51d97e51aae2ee7db1fba21bbad07aab0fa0f42f834" "34ed3e2fa4a1cb2ce7400c7f1a6c8f12931d8021435bad841fdc1192bd1cc7da" "b3bcf1b12ef2a7606c7697d71b934ca0bdd495d52f901e73ce008c4c9825a3aa" default)))
 '(display-time-mode t)
 '(fci-rule-color "#6272a4")
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX" . "#dc752f")
     ("XXXX" . "#dc752f")
     ("???" . "#dc752f"))))
 '(jdee-db-active-breakpoint-face-colors (cons "#1E2029" "#bd93f9"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1E2029" "#50fa7b"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1E2029" "#565761"))
 '(package-selected-packages
   (quote
    (evil-commentary evil-easymotion evil-snipe doom-modeline doom-themes avy 0blayout dracula-theme evil-escape evil-leader use-package-chords evil-googles powerline powerline-evil helm-projectile projectile evil-goggles nlinum-relative async auctex company goto-chg helm-core popup swiper-helm evil helm company-auctex rtags cmake-ide counsel dashboard page-break-lines aggressive-indent yasnippet-snippets auto-yasnippet auto-complete-c-headers)))
 '(pdf-view-midnight-colors (quote ("#b2b2b2" . "#292b2e")))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tabbar-separator (quote (0.5)))
 '(tool-bar-mode nil)
 '(vc-annotate-background "#282a36")
 '(vc-annotate-color-map
   (list
    (cons 20 "#50fa7b")
    (cons 40 "#85fa80")
    (cons 60 "#bbf986")
    (cons 80 "#f1fa8c")
    (cons 100 "#f5e381")
    (cons 120 "#face76")
    (cons 140 "#ffb86c")
    (cons 160 "#ffa38a")
    (cons 180 "#ff8ea8")
    (cons 200 "#ff79c6")
    (cons 220 "#ff6da0")
    (cons 240 "#ff617a")
    (cons 260 "#ff5555")
    (cons 280 "#d45558")
    (cons 300 "#aa565a")
    (cons 320 "#80565d")
    (cons 340 "#6272a4")
    (cons 360 "#6272a4")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 143 :width normal))))
 '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
 '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil))))
 '(speedbar-button-face ((t (:foreground "MediumOrchid1"))))
 '(speedbar-directory-face ((t (:foreground "DeepSkyBlue2"))))
 '(speedbar-face ((t (:slant normal :weight normal :height 98 :width normal :foundry "raster" :family "Courier"))) t)
 '(speedbar-file-face ((t (:foreground "LightSkyBlue1"))))
 '(speedbar-selected-face ((t (:foreground "SlateBlue1" :underline "orchid1")))))

;;--------------Emacs Config-------------;;
;; remember last session
(desktop-save-mode 1)
;; default folder directory
(setq default-directory "C:/TRABAJO/Programacion/")
;; emacs transparency
(set-frame-parameter (selected-frame) 'alpha '(100 100))
(add-to-list 'default-frame-alist '(alpha 95 100))

(use-package powerline
  :ensure t
  :config
  (require 'powerline-evil)
  (powerline-evil-center-color-theme)
  )
;;-----------------EVIL------------------;;
(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode)
  ;; (evil-leader/set-leader "<SPC>")
  (evil-leader/set-leader "\\")
  )

(use-package evil
  :ensure t
  :init
  (evil-mode 1)
  :chords
  (:map evil-insert-state-map
		;; to correct evil-escape glitch
		("jj" . evil-normal-state)
		)
  )

(use-package evil-escape
  :ensure t
  :config
  (evil-escape-mode)
  (setq-default evil-escape-key-sequence "jj")
  (setq-default evil-escape-delay 0.2)
  )

(use-package evil-goggles
  :ensure t
  :config
  (evil-goggles-mode 1)
  )

(use-package evil-commentary
  :ensure t
  :config
  (evil-commentary-mode)
  )

(use-package evil-easymotion
  :ensure t
  :config (evilem-default-keybindings "SPC")
  )

(use-package evil-snipe
  :ensure t
  :config
  (evil-snipe-mode 1)
  )

(use-package nlinum-relative
  :ensure t
  :config
  (nlinum-relative-setup-evil)
  (add-hook 'emacs-lisp-mode-hook #'nlinum-relative-mode)
  (add-hook 'c-mode-hook #'nlinum-relative-mode)
  (add-hook 'c++-mode-hook #'nlinum-relative-mode)
  (add-hook 'python-mode-hook #'nlinum-relative-mode)
  (add-hook 'asm-mode-hook #'nlinum-relative-mode)
  (setq nlinum-relative-redisplay-delay 0.4)
  ;; or "" for display current line number
  (setq nlinum-relative-current-symbol "")
  ;; 1 if you want 0, 2, 3...
  (setq nlinum-relative-offset 0)
  )

;;-----------------HELM------------------;;
(autoload 'dired-async-mode "dired-async.el" nil t)
(dired-async-mode 1)

(use-package helm
  :ensure t
  :bind
  ("M-x" . helm-M-x)
  ("C-s" . helm-occur)
  :config
  (evil-leader/set-key "pp" 'helm-projectile)
  (evil-leader/set-key "bb" 'helm-buffers-list)
  (evil-leader/set-key "pr" 'projectile-remove-known-project)
  (evil-leader/set-key "m" 'helm-bookmarks)
  (evil-leader/set-key "ff" 'helm-find-files)
  (evil-leader/set-key "bk" 'kill-current-buffer)
  (evil-leader/set-key "s" 'save-buffer)
  (evil-leader/set-key "rb" 'revert-buffer)
  (evil-leader/set-key "ww" 'whitespace-mode)
  (evil-leader/set-key "wc" 'whitespace-cleanup)
  )

;;--------------PROJECTILE---------------;;
(use-package projectile
  :ensure t
  :config
;;  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;;  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-project-search-path '("C:/TRABAJO"))
  (projectile-mode +1)
  )

;;------------------AVY------------------;;
(use-package avy
  :ensure t
  :bind
  ("M-a" . avy-goto-char-timer)
  ("M-s" . avy-goto-char-2)
  ("M-d" . avy-goto-char)
  ("M-f" . avy-goto-char-in-line)
  )

;;---------------------------------------;;
;;-----------------C/C++-----------------;;
;;---------------------------------------;;
;;
;;;; start auto-complete
;;(require 'auto-complete)
;;
;;;; default config auto- complete
;;(require 'auto-complete-config)
;;(ac-config-default)
;;
;;;; c/c++ auto-complete
;;(defun my:ac-c-headers-init ()
;;  (require 'auto-complete-c-headers)
;;  (add-to-list 'ac-sources 'ac-source-c-headers)
;;  (add-to-list 'achead:include-directories
;;	       '" C:/TRABAJO/Programas/MinGW-w64/x86_64-8.1.0-posix-seh-rt_v6-rev0/mingw64/bin/../libexec/gcc/x86_64-w64-mingw32/8.1.0/cc1plus.exe"))
;;(add-hook 'c++-mode-hook 'my:ac-c-headers-init)
;;(add-hook 'c-mode-hook 'my:ac-c-headers-init)
;;
;;;; YASNIPPET
;;(add-to-list 'load-path
;;             "~/.emacs.d/plugins/yasnippet")
;;(require 'yasnippet)
;;(yas-global-mode 1)
;;
;;;; AGGRESSIVE INDENT
;;(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
;;(add-hook 'c-mode-hook #'aggressive-indent-mode)
;;(add-hook 'c++-mode-hook #'aggressive-indent-mode)
;;(add-hook 'asm-mode-hook #'aggressive-indent-mode)
;;
;;;; default folder directory
;;(setq default-directory "C:/TRABAJO/Programacion/")
;;
;;;; CMAKE IDE
;;(require 'rtags) ;; optional, must have rtags installed
;;(cmake-ide-setup)
;;
;;;; DASHBOARD
;;;;(require 'dashboard)
;;;;(dashboard-setup-startup-hook)
