;---------------SETTINGS----------------;;
;; enable/disable bars.
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
;; set space between lines.
(setq-default line-spacing 3)
;; set font.
(add-to-list 'default-frame-alist '(font . "Consolas 11"))
;; emacs transparency.
(set-frame-parameter (selected-frame) 'alpha '(95 100))
(add-to-list 'default-frame-alist '(alpha 95 100))

;;----------------THEMING----------------;;
(use-package dracula-theme
  :config
  (load-theme 'dracula t)
  )

;;------------CURSOR-BEHAVIOR------------;;
;; highlight line for vim modes.
(global-hl-line-mode 1)
(add-hook 'evil-emacs-state-entry-hook
	(lambda() (set-face-background 'hl-line "#553")))
(add-hook 'evil-normal-state-entry-hook
	(lambda() (set-face-background 'hl-line "#241")))
(add-hook 'evil-insert-state-entry-hook
	(lambda() (set-face-background 'hl-line "#115")))
(add-hook 'evil-operator-state-entry-hook
	(lambda() (set-face-background 'hl-line "#520")))
(add-hook 'evil-visual-state-entry-hook
	(lambda() (set-face-background 'hl-line nil)))
