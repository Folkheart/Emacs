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
(setq load-prefer-newer t
      package--init-file-ensured t
      package-enable-at-startup nil)

;;----------PACKAGE-MANAGEMENT-----------;;
;; Enable package list.
; (require 'package)
(setq inhibit-startup-screen t
      ; initial-scratch-message ";; READY\n\n"
      package-enable-at-startup nil
      ; (if string-equal system-type "windows-nt"
      ;   (setq package-user-dir "C:/TRABAJO/Programas/Emacs/elpa"))
      ; (if string-equal system-type "gnu/linux"
      ;   (setq package-user-dir "~/.emacs.d/elpa"))
; (setq package-archives '(
      package-archives '(
			 ("gnu"   . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org"   . "https://orgmode.org/elpa/")
      ))


;;;;;;;;;;;;;;;;;; PULL REQUEST STARTS HERE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Disable package initialize after us.  We either initialize it
;; anyway in case of interpreted .emacs, or we don't want slow
;; initizlization in case of byte-compiled .emacs.elc.
(setq package-enable-at-startup nil)
;; Ask package.el to not add (package-initialize) to .emacs.
(setq package--init-file-ensured t)
;; set use-package-verbose to t for interpreted .emacs,
;; and to nil for byte-compiled .emacs.elc
(eval-and-compile
  (setq use-package-verbose (not (bound-and-true-p byte-compile-current-file))))
;; Add the macro generated list of package.el loadpaths to load-path.
(mapc #'(lambda (add) (add-to-list 'load-path add))
  (eval-when-compile
    ;; (require 'package)
    (package-initialize)
    ;; Install use-package if not installed yet.
    (unless (package-installed-p 'use-package)
      (package-refresh-contents)
      (package-install 'use-package))
    ;; (require 'use-package)
    (setq use-package-always-ensure t)
    (let ((package-user-dir-real (file-truename package-user-dir)))
      ;; The reverse is necessary, because outside we mapc
      ;; add-to-list element-by-element, which reverses.
      (nreverse (apply #'nconc
           ;; Only keep package.el provided loadpaths.
           (mapcar #'(lambda (path)
                   (if (string-prefix-p package-user-dir-real path)
                   (list path)
                     nil))
               load-path))))))
;;;;;;;;;;;;;;;;;; PULL REQUEST  ENDS  HERE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eval-when-compile
  (require 'use-package))

; (package-initialize)

; ;; bootstrap for use-package.
; (unless (package-installed-p 'use-package)
;   (package-refresh-contents)
;   (package-install 'use-package)
;   )
; (eval-when-compile
;   (require 'use-package)
;   (setq use-package-always-ensure t)
;   )
