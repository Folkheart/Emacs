;;---------------SETTINGS----------------;;
;; essential for packages and use-package.
(load "~/init.el")
;; custom theme.
(load "~/theme.el")
;; default directory on Windows.
(cond
  ((string-equal system-type "windows-nt")
   (progn 
          (setq default-directory "c:/TRABAJO/Emacs")
          (setq projectile-project-search-path '("C:/TRABAJO/"))
          ))
  ((string-equal system-type "gnu/linux")
   (progn
          (setq default-directory "~/")
          (setq projectile-project-search-path '("~/"))
          ))
  )

(use-package delight
  :config
  (delight '(
	    ;; (abbrev-mode " Abv" abbrev)
            ;; (smart-tab-mode " \\t" smart-tab)
            (eldoc-mode nil "eldoc")
            ;; (rainbow-mode)
            ;; (overwrite-mode " Ov" t)
            (emacs-lisp-mode "Elisp" :major)
	    (undo-tree-mode nil "undo-tree")
	    ))
  )

(use-package company
  :config
  ;; (company-mode 1)
  (add-to-list 'company-backends '(company-capf company-dabbrev-code))
  (add-hook 'after-init-hook 'global-company-mode)
  )

(use-package projectile
  ;; :after (company)
  :config
  ;; (setq projectile-project-search-path '("C:/TRABAJO"))
  (projectile-mode 1)
  )


;; (use-package magit
;;   :defer t
;;   )


(use-package ivy
  :after (projectile)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-re-builders-alist '((t . ivy--regex-plus)))
  (ivy-mode 1)
  (use-package counsel)
  (use-package swiper)
  (use-package counsel-projectile   :after (counsel))
  )





(use-package nasm-mode :hook (asm-mode . nasm-mode)
  ;; (add-hook 'asm-mode-hook 'nasm-mode)
  )

(use-package evil
  :config (evil-mode 1))

(use-package evil-commentary
  :after (evil)
  :config
  (evil-mode 1)
  (evil-commentary-mode)
  )

;; (use-package evil :after (general) :ensure t
;;   :config (evil-mode 1))
; (use-package org-mode)

(use-package esup :commands (esup))


(use-package general :after evil
  :config
  (use-package which-key
    :config (which-key-mode 1))
  ;; (general-override-mode 1)
  (general-def 'override
   ;; "M-x" 'helm-M-x
   "M-x" 'counsel-M-x
   ;; "C-s" 'helm-occur
   ;; "M-s" 'helm-swoop
   "M-s" 'swiper
   "M-j" 'evil-window-next
   "M-k" 'evil-window-prev
   ;; "M-RET" 'projectile-run-shell
   "M-J" 'next-buffer
   "M-K" 'previous-buffer
   )
  (general-create-definer my-leader
    :prefix "SPC"
    )
  (my-leader 'normal
	     ""   '(nil                                 :wk "EXIT")

	     "RET"'(mode-line-other-buffer              :wk "switch buffer")
	     "m"  '(counsel-bookmark                    :wk "bookmarks")
	     "j"  '(next-buffer                         :wk "next buffer")
	     "k"  '(previous-buffer                     :wk "previous buffer")

	     "it" '(emacs-init-time                     :wk "init time")

	     "d"  '(:ignore t                           :wk "dired")
	     "dj" '(dired-jump                          :wk "jump to file")
	     "do" '(dired-jump-other-window             :wk "jump other window")

	     "D"  '(:ignore t                           :wk "desktop")
	     "DS" '(desktop-save                        :wk "save desktop")
	     "DL" '(desktop-read                        :wk "load desktop")
	     ;; "Dk" '(eyebrowse-close-window-config    :wk "kill workspace")
	     ;; "Dc" '(eyebrowse-create-window-config   :wk "create workspace")

	     "e"  '(:ignore t                           :wk "edit tools")
	     "ew" '(whitespace-mode                     :wk "whitespace mode")
	     "ec" '(whitespace-cleanup                  :wk "clean whitespace")

	     "f"  '(:ignore t                           :wk "file")
	     ;; "ff" '(helm-find-files                     :wk "find file")
	     "ff" '(counsel-find-file                   :wk "find file")
	     ;; "fr" '(helm-recentf                        :wk "recent files")
	     "fr" '(counsel-recentf                     :wk "recent files")

	     "w"  '(:ignore t                           :wk "window managent")
	     "wh" '(split-window-horizontally           :wk "split horizontally")
	     "wv" '(split-window-vertically             :wk "split vertically")
	     "ww" '(other-window                        :wk "other window")
	     "wd" '(evil-window-delete                  :wk "delete window")
	     "wD" '(delete-other-windows                :wk "delete other windows")

	     "p"  '(:ignore t                           :wk "project")
	     ;; "pp" 'helm-projectile
	     ;; ;; "ps" '(helm-projectile-switch-project   :wk "switch project")
	     "ps" '(counsel-projectile-switch-project   :wk "switch project")
	     ;; "pr" '(helm-projectile-recentf          :wk "recent files")
	     ;; "pb" '(helm-projectile-switch-to-buffer :wk "buffers")
	     "pb" '(counsel-projectile-switch-to-buffer :wk "buffers")
	     ;; "pf" '(helm-projectile-find-file        :wk "find files")
	     "pf" '(counsel-projectile-find-file        :wk "find files")

	     "b"  '(:ignore t                           :wk "buffer")
	     "be" '(eval-buffer                         :wk "eval buffer")
	     ;; "bb" '(helm-buffers-list                   :wk "buffers list")
	     "bb" '(counsel-switch-buffer               :wk "buffers list")
	     "bk" '(kill-current-buffer                 :wk "kill buffer")
	     "br" '(revert-buffer                       :wk "revert buffer")
	     "bs" '(save-buffer                         :wk "save buffer")

	     ;; "g"  '(:ignore t                        :wk "git")
	     ;; "gs" '(magit-status                     :wk "status")
	     )
  (general-override-mode 1)
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (wombat)))
 '(package-selected-packages
   (quote
    (org-mode mood-line flx delight esup evil-commentary nasm-mode general which-key counsel-projectile counsel projectile company gruvbox-theme use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
