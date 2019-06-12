;;---------------SETTINGS----------------;;
;; essential for packages and use-package.
(load "~/init.el")
;; custom theme.
(load "~/theme.el")
;; default directory on Windows.
(setq-default default-directory "c:/TRABAJO/")

;;--------CONFLICTING-DEPENDENCIES-------;;
;for helm.
(use-package async
  :ensure t
  :config
  (autoload 'dired-async-mode "dired-async.el" nil t)
  (dired-async-mode 1)
  )

;;--------------MAJOR-MODES--------------;;
(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  )

(use-package helm
  :ensure t
  :defer t
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

(use-package general
  :ensure t
  :config
  (general-override-mode 1)
  (general-def
   "M-x" 'helm-M-x
   "C-s" 'helm-occur
   )
  (general-create-definer my-leader
    :prefix "SPC"
    )
  (my-leader 'normal
	     ""   '(nil :which-key "EXIT")

	     "s"  'save-buffer
	     "m"  'helm-bookmarks

	     "it" 'emacs-init-time

	     "w"  '(:ignore t :which-key "whitespace")
	     "ww" 'whitespace-mode
	     "wc" 'whitespace-cleanup

	     "f"  '(:ignore t :which-key "file")
	     "ff" 'helm-find-files

	     "p"  '(:ignore t :which-key "projectile")
	     "pp" 'helm-projectile
	     "pr" 'projectile-remove-known-project

	     "b"  '(:ignore t :which-key "buffer")
	     "be" 'eval-buffer
	     "bb" 'helm-buffers-list
	     "bk" 'kill-current-buffer
	     "br" 'revert-buffer

	     "g"  '(:ignore t :which-key "git")
	     "gs" 'magit-status
	     )
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (general which-key helm-projectile evil-commentary magit projectile helm evil async dracula-theme use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
