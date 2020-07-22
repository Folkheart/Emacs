;---------------SETTINGS----------------;;
(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))
;; enable/disable bars.
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
;; display clock on mode line
(display-time-mode 1)
;; lazy yes or no
(fset 'yes-or-no-p 'y-or-n-p)
;; ;; highlight line for vim modes.
(global-hl-line-mode 1)
;; set font.
(set-frame-font "Mononoki-10:bold" nil t)
;; emacs transparency.
;; (set-frame-parameter (selected-frame) 'alpha '(95 100))
;; (add-to-list 'default-frame-alist '(alpha 95 100))
;; ;;----------------THEMING----------------;;

(use-package gruvbox-theme
  :config
  (load-theme 'gruvbox-dark-hard t)
  )

;; (use-package mood-line :ensure t
;;   :config
;;   (mood-line-mode)
;;   )

;; (use-package doom-modeline          :ensure t
;;   ;; :diminish doom-modeline
;;   :config
;;   (doom-modeline-mode 1)
;;   ;; M-x all-the-icons-install-fonts
;;   )
