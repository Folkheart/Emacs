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
  :config
  (autoload 'dired-async-mode "dired-async.el" nil t)
  (dired-async-mode 1)
  )

;;--------------MAJOR-MODES--------------;;
(use-package evil
  :config
  (evil-mode 1)
  )

(use-package helm
  :defer t
  )

(use-package projectile
  :defer t
  :config
  (setq projectile-project-search-path '("C:/TRABAJO"))
  (projectile-mode 1)
  )

(use-package magit
  :defer t
  )

;;------------SECONDARY-MODES------------;;
(use-package evil-commentary
  :after (evil)
  :config
  (evil-commentary-mode)
  )

(use-package helm-swoop
  :defer t
  )

(use-package helm-projectile
  :commands (helm-projectile
  	     helm-projectile-find-file
  	     helm-projectile-recentf
  	     helm-projectile-switch-project
  	     helm-projectile-switch-to-buffer)
  )

(use-package which-key
  :config
  (which-key-mode 1)
  )

(use-package general
  :config
  (general-override-mode 1)
  (general-def 'override
   "M-x" 'helm-M-x
   "C-s" 'helm-occur
   "M-s" 'helm-swoop
   "M-j" 'evil-window-next
   "M-k" 'evil-window-prev
   "M-RET" 'projectile-run-shell
   "M-J" 'next-buffer
   "M-K" 'previous-buffer
   )
  (general-create-definer my-leader
    :prefix "SPC"
    )
  (my-leader 'normal
	     ""   '(nil                              :wk "EXIT")

	     "RET"'(mode-line-other-buffer           :wk "switch buffer")
	     "m"  '(helm-bookmarks                   :wk "bookmarks")
	     "j"  '(next-buffer                      :wk "next buffer")
	     "k"  '(previous-buffer                  :wk "previous buffer")

	     "it" '(emacs-init-time                  :wk "init time")

	     "d"  '(:ignore t                        :wk "dired")
	     "dj" '(dired-jump                       :wk "jump to file")
	     "do" '(dired-jump-other-window          :wk "jump other window")

	     "D"  '(:ignore t                        :wk "desktop")
	     "DS" '(desktop-save                     :wk "save desktop")
	     "DL" '(desktop-read                     :wk "load desktop")
	     "Dk" '(eyebrowse-close-window-config    :wk "kill workspace")
	     "Dc" '(eyebrowse-create-window-config   :wk "create workspace")

	     "e"  '(:ignore t                        :wk "edit tools")
	     "ew" '(whitespace-mode                  :wk "whitespace mode")
	     "ec" '(whitespace-cleanup               :wk "clean whitespace")

	     "f"  '(:ignore t                        :wk "file")
	     "ff" '(helm-find-files                  :wk "find file")
	     "fr" '(helm-recentf                     :wk "recent files")

	     "w"  '(:ignore t                        :wk "window managent")
	     "wh" '(split-window-horizontally        :wk "split horizontally")
	     "wv" '(split-window-vertically          :wk "split vertically")
	     "ww" '(other-window                     :wk "other window")
	     "wd" '(evil-window-delete               :wk "delete window")
	     "wD" '(delete-other-windows             :wk "delete other windows")

	     "p"  '(:ignore t                        :wk "project")
	     "pp" 'helm-projectile
	     "ps" '(helm-projectile-switch-project   :wk "switch project")
	     "pr" '(helm-projectile-recentf          :wk "recent files")
	     "pb" '(helm-projectile-switch-to-buffer :wk "buffers")
	     "pf" '(helm-projectile-find-file        :wk "find files")

	     "b"  '(:ignore t                        :wk "buffer")
	     "be" '(eval-buffer                      :wk "eval buffer")
	     "bb" '(helm-buffers-list                :wk "buffers list")
	     "bk" '(kill-current-buffer              :wk "kill buffer")
	     "br" '(revert-buffer                    :wk "revert buffer")
	     "bs" '(save-buffer                      :wk "save buffer")

	     "g"  '(:ignore t                        :wk "git")
	     "gs" '(magit-status                     :wk "status")
	     )
  )

(use-package nasm-mode
  :hook (asm-mode . nasm-mode)
  ;; (add-hook 'asm-mode-hook 'nasm-mode)
  )

(use-package eyebrowse
  ;; :ensure t
  :config
  (eyebrowse-setup-opinionated-keys)
  ;; (general-def
  ;;   "M-1" 'eyebrowse-switch-to-window-config-1
  ;;   "M-2" 'eyebrowse-switch-to-window-config-2
  ;;   "M-3" 'eyebrowse-switch-to-window-config-3
  ;;   "M-4" 'eyebrowse-switch-to-window-config-4
  ;;   "M-5" 'eyebrowse-switch-to-window-config-5
  ;;   "M-6" 'eyebrowse-switch-to-window-config-6
  ;;   "M-7" 'eyebrowse-switch-to-window-config-7
  ;;   "M-8" 'eyebrowse-switch-to-window-config-8
  ;;   "M-9" 'eyebrowse-switch-to-window-config-9
  ;;   "M-0" 'eyebrowse-switch-to-window-config-0
  ;;   )
  (eyebrowse-mode t)
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm-swoop general which-key helm-projectile evil-commentary magit projectile helm evil async dracula-theme use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
