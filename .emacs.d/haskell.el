(custom-set-variables
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t))

(linum-mode t)
;; (turn-on-haskell-doc-mode t)
;; (interactive-haskell-mode t)
(rainbow-delimiters-mode t)

;; ;; (add-to-list 'yas/root-directory "~/.emacs.d/snippets/haskell-mode")
;; ;; (yas/initialize)

(require 'speedbar)
(speedbar-add-supported-extension ".hs")
(speedbar-add-supported-extension ".vert")
(speedbar-add-supported-extension ".frag")
(speedbar-add-supported-extension ".tga")
(speedbar-add-supported-extension ".glsl")

;; (defun restartHaskell ()
;;      (interactive)
;;      (haskell-process-interrupt)
;;      (haskell-process-restart)
;;      )

(define-key haskell-mode-map (kbd "C-c c")      'hide/show-comments-toggle)
(define-key haskell-mode-map (kbd "C-c s")      'sr-speedbar-toggle)
(define-key haskell-mode-map (kbd "C-c m")      'minimap-toggle)
;;(define-key haskell-mode-map (kbd "C-c C-k")    'haskell-process-load-file)
(define-key haskell-mode-map (kbd "C-;")        'iedit-mode)
;;(define-key haskell-mode-map (kbd "C-c r")      'restartHaskell)
(define-key haskell-mode-map (kbd "M-<up>")     'paredit-splice-sexp)
(define-key haskell-mode-map (kbd "M-<RET>")    'yafolding-toggle-element)
(define-key haskell-mode-map (kbd "C-c d")      'haskell-hayoo)
(define-key haskell-mode-map (kbd "C-c .")      'haskell-navigate-imports)
(define-key haskell-mode-map (kbd "M-<iso-lefttab>") 'company-complete)
(define-key haskell-mode-map (kbd "C-c C-l")    'interactive-haskell-mode)

;;;;;;;;;;
;; helm ;;
;;;;;;;;;;


(require 'helm)
(require 'ac-helm)

(define-key haskell-mode-map (kbd "C-.") 'helm-imenu)
(define-key haskell-mode-map (kbd "C-:") 'ac-complete-with-helm)

(auto-complete-mode t)

;;
;; Flycheck
;;

(add-hook 'haskell-mode-hook #'flycheck-haskell-setup)
(define-key haskell-mode-map (kbd "C-c C-c")    'flycheck-compile)
(define-key haskell-mode-map (kbd "C-c C-k")    'flymake-hlint-load)
;; C-c l - hs-lint
(define-key haskell-mode-map (kbd "M-g M-j")    'flymake-goto-next-error)
(define-key haskell-mode-map (kbd "M-g M-k")    'flymake-goto-prev-error)

;; (require 'flymake-haskell-multi)
;; (add-hook 'haskell-mode-hook 'flymake-haskell-multi-load)
;; (flycheck-mode t)

;;
;; HPP
;;

(autoload 'hhp-init "hhp" nil t)
(autoload 'hhp-debug "hhp" nil t)
(add-hook 'haskell-mode-hook (lambda () (hhp-init)))

;;(lsp-haskell-enable)
(require 'lsp)
(require 'lsp-haskell)
(lsp)
