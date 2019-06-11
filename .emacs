;;---------------SETTINGS----------------;;
;; essential for packages and use-package.
(load "~/init.el")
;; custom theme.
(load "~/theme.el")
;; default directory on Windows.
(setq-default default-directory "c:/TRABAJO/")

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

(use-package which-key
  :ensure t
  :config
  (which-key-mode 1)
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (which-key magit avy helm-projectile helm evil-commentary evil-escape evil-leader async undo-tree dracula-theme use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
