(cond
  ((string-equal system-type "windows-nt")
   (progn
          (setq package-user-dir "~/elpa"
                default-directory "~/"
                projectile-project-search-path '("c:/"))
          (load "~/.emacs.d/start.el")
          (load "~/.emacs.d/theme.el")
          ))
  ((string-equal system-type "gnu/linux")
   (progn
          (setq package-user-dir "~/.emacs.d/elpa"
                default-directory "~/"
                projectile-project-search-path '("~/"))
          (load "~/.emacs.d/start.el")
          (load "~/.emacs.d/theme.el")
          ))
  )

(setq-default indent-tabs-mode nil)

;; (use-package delight
;;   :config
;;   (delight '(
;;             ;; (abbrev-mode " Abv" abbrev)
;;             ;; (smart-tab-mode " \\t" smart-tab)
;;             (eldoc-mode nil "eldoc")
;;             ;; (rainbow-mode)
;;             ;; (overwrite-mode " Ov" t)
;;             (emacs-lisp-mode "Elisp" :major)
;;             (undo-tree-mode nil "undo-tree")
;;             ))
;;   )

(use-package company
  :config
  ;; (company-mode 1)
  (add-to-list 'company-backends '(company-capf company-dabbrev-code))
  (add-hook 'after-init-hook 'global-company-mode)
  )

(use-package projectile
  :config
  ;; (setq projectile-indexing-method 'native)
  (setq projectile-sort-order 'recently-active)
  (setq projectile-completion-system 'ivy)
  (projectile-mode 1)
  )

(use-package magit :defer t)

(use-package ivy
  :after (projectile)
  :config
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "
        ;; ivy-re-builders-alist '((t . ivy--regex-plus))
        ivy-re-builders-alist '((t . ivy--regex-ignore-order))
        )
  (ivy-mode 1)
  (use-package counsel)
  (use-package swiper)
  ;; (use-package counsel-projectile   :after (counsel))
  )

(use-package nasm-mode :defer t :hook (asm-mode . nasm-mode)
  ;; (add-hook 'asm-mode-hook 'nasm-mode)
  )

(use-package haskell-mode :defer t)


(use-package evil
  :config
  (use-package evil-commentary)
  (use-package evil-escape)
  (evil-mode 1)
  (evil-escape-mode)
  (evil-commentary-mode)
  )

(use-package flycheck
  :init (global-flycheck-mode))

(use-package esup :commands (esup))

(use-package general :after evil
  :config
  (use-package which-key
    :config
    (setq which-key-idle-delay 0.5)
    )
  ;; (general-override-mode 1)
  (general-def 'override
   "M-x" 'counsel-M-x
   "C-s" 'swiper
   "M-j" 'evil-window-next
   "M-k" 'evil-window-prev
   "M-J" 'next-buffer
   "M-K" 'previous-buffer
   )

  (general-create-definer my-leader                 :prefix "SPC")

  (my-leader 'normal
   ""   '(nil                                       :wk "EXIT")

   "RET"'(mode-line-other-buffer                    :wk "switch buffer")
   "m"  '(counsel-bookmark                          :wk "bookmarks")
   "j"  '(next-buffer                               :wk "next buffer")
   "k"  '(previous-buffer                           :wk "previous buffer")

   "it" '(emacs-init-time                           :wk "init time")

   "d"  '(:ignore t                                 :wk "dired")
   "dj" '(dired-jump                                :wk "jump to file")
   "do" '(dired-jump-other-window                   :wk "jump other window")

   "D"  '(:ignore t                                 :wk "desktop")
   "DS" '(desktop-save                              :wk "save desktop")
   "DL" '(desktop-read                              :wk "load desktop")

   "e"  '(:ignore t                                 :wk "edit tools")
   "ew" '(whitespace-mode                           :wk "whitespace mode")
   "ec" '(whitespace-cleanup                        :wk "clean whitespace")
   "eu" '(untabify                                  :wk "clear tabs")

   "f"  '(:ignore t                                 :wk "file")
   "ff" '(counsel-find-file                         :wk "find file")
   "fr" '(counsel-recentf                           :wk "recent files")

   "w"  '(:ignore t                                 :wk "window managent")
   "wh" '(split-window-horizontally                 :wk "split horizontally")
   "wv" '(split-window-vertically                   :wk "split vertically")
   "ww" '(other-window                              :wk "other window")
   "wd" '(evil-window-delete                        :wk "delete window")
   "wD" '(delete-other-windows                      :wk "delete other windows")

   "p"  '(:ignore t                                 :wk "project")
   "pp" '(projectile-switch-project                 :wk "switch project")
   "pb" '(projectile-display-buffer                 :wk "buffers")
   "pf" '(projectile-find-file                      :wk "find files")
   "pd" '(projectile-discover-projects-in-directory :wk "discover projects")
   "pr" '(projectile-remove-known-project           :wk "find files")

   "b"  '(:ignore t                                 :wk "buffer")
   "be" '(eval-buffer                               :wk "eval buffer")
   "bb" '(counsel-switch-buffer                     :wk "buffers list")
   "bk" '(kill-current-buffer                       :wk "kill buffer")
   "br" '(revert-buffer                             :wk "revert buffer")
   "bs" '(save-buffer                               :wk "save buffer")

   "g"  '(:ignore t                                 :wk "git")
   "gs" '(magit-status                              :wk "status")
   )
  (general-override-mode 1)
  ;; (which-key-mode 1)
  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (dired-plus dired+ haskell-mode magit flycheck which-key use-package projectile nasm-mode gruvbox-theme general evil-commentary esup delight counsel company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
