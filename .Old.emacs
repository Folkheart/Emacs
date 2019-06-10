;;---------------------------------------;;
;;------------Initial Config-------------;;
(require 'package)
;;(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(package-initialize)
;; bootstrap for use-package for new instalations
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
;; enable use-package chords
(use-package use-package-chords
  :ensure t
  :config (key-chord-mode 1)
  )

;;--------------Emacs Config-------------;;
;; remember last session
(desktop-save-mode 1)
;; default directory on Windows
;;(if (eq system-type 'windows-nt)
    (setq default-directory "C:/TRABAJO/Programacion/")
;; else default directory on Unix like systems
  ;;(setq default-directory "~")
;;  )

;; emacs transparency
(set-frame-parameter (selected-frame) 'alpha '(100 100))
(add-to-list 'default-frame-alist '(alpha 95 100))
;; set font
(add-to-list 'default-frame-alist '(font . "Consolas 12"))
 
(use-package powerline
  :ensure t
  :config
  (require 'powerline-evil)
  (powerline-evil-center-color-theme)
  )

;;----------------THEME------------------;;
(use-package dracula-theme 
  :ensure t
;  :load-path "~\.emacs.d\elpa\dracula-theme-1.5.1"
;  :init
;  (setq dracula-theme-kit t)
  :config
  (load-theme 'dracula t)
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yasnippet-snippets use-package-chords rtags powerline-evil nlinum-relative helm-projectile evil-snipe evil-leader evil-goggles evil-escape evil-easymotion evil-commentary doom-themes doom-modeline dashboard company-auctex cmake-ide auto-yasnippet auto-complete-c-headers aggressive-indent 0blayout))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
