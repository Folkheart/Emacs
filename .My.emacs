;;--------------SPEEDUP-INIT-------------;;
;; Temporarily reduce garbage collection on startup. Inspect `gcs-done'.
(defun ambrevar/reset-gc-cons-threshold ()
  (setq gc-cons-threshold (car (get 'gc-cons-threshold 'standard-value))))
(setq gc-cons-threshold (* 64 1024 1024))
(add-hook 'after-init-hook #'ambrevar/reset-gc-cons-threshold)
;; Temporarily disable the file name handler.
(setq default-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
(defun ambrevar/reset-file-name-handler-alist ()
  (setq file-name-handler-alist
	(append default-file-name-handler-alist
		file-name-handler-alist))
  (cl-delete-duplicates file-name-handler-alist :test 'equal))
(add-hook 'after-init-hook #'ambrevar/reset-file-name-handler-alist)
;; Avoid the "loaded old bytecode instead of newer source" pitfall.
(setq load-prefer-newer t)

;;----------------CONFIGS----------------;;
;; Enable package list.
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; bootstrap for use-package.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  )
(eval-when-compile
  (require 'use-package))

;;----------------CONFIGS----------------;;
;; default directory on Windows.
(setq default-directory "c:/TRABAJO/")
;; set font.
(add-to-list 'default-frame-alist '(font . "Consolas 12"))
;; enable/disable bars.
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
;; emacs transparency.
(set-frame-parameter (selected-frame) 'alpha '(95 100))
(add-to-list 'default-frame-alist '(alpha 95 100))
;; highlight line for vim modes.
(global-hl-line-mode 1)
(add-hook 'evil-emacs-state-entry-hook
	(lambda() (set-face-background 'hl-line "#322")))
(add-hook 'evil-normal-state-entry-hook
	(lambda() (set-face-background 'hl-line "#241")))
(add-hook 'evil-insert-state-entry-hook
	(lambda() (set-face-background 'hl-line "#115")))
(add-hook 'evil-operator-state-entry-hook
	(lambda() (set-face-background 'hl-line "#520")))
(add-hook 'evil-visual-state-entry-hook
	(lambda() (set-face-background 'hl-line nil)))

;;----------------THEMING----------------;;
(use-package dracula-theme
  :ensure t
  :config
  (load-theme 'dracula t)
  )

;;--------CONFLICTING-DEPENDENCIES-------;;
;for evil-leader and evil.
(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode)
  )
;for helm.
(use-package async
  :ensure t
  :config
  (autoload 'dired-async-mode "dired-async.el" nil t)
  (dired-async-mode 1)
  )
;for leader in scratch and other buffers.
(use-package evil-leader
  :ensure t
  :after (undo-tree)
  :config
  (evil-leader/set-leader "<SPC>")
  (global-evil-leader-mode)
  ;; leader binds.
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
  (evil-leader/set-key "gs" 'magit-status)
  ;; common binds.
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-s") 'helm-occur)
  )

;;--------------MAJOR-MODES--------------;;
(use-package evil
  :ensure t
  :defer t
  :config
  (evil-mode 1)
  )

(use-package helm
  :ensure t
  :defer t
  :config
  )

(use-package projectile
  :ensure t
  :defer t
  :config
  (setq projectile-project-search-path '("C:/TRABAJO"))
  (projectile-mode 1)
  )

(use-package magit
  :ensure t
  :defer t
  )

;;------------SECONDARY-MODES------------;;
(use-package evil-escape
  :ensure t
  :after (evil)
  :config
  (setq-default evil-escape-key-sequence "jj")
  (setq-default evil-escape-delay 0.3)
  (evil-escape-mode)
  )

(use-package evil-commentary
  :ensure t
  :after (evil)
  :config
  (evil-commentary-mode)
  )

(use-package helm-projectile
  :ensure t
  :defer t
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (magit avy helm-projectile helm evil-commentary evil-escape evil-leader async undo-tree dracula-theme use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
