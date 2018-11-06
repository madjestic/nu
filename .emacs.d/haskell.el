(custom-set-variables
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t))

(require 'flymake-haskell-multi)
(add-hook 'haskell-mode-hook 'flymake-haskell-multi-load)

(linum-mode t)
;; (turn-on-haskell-doc-mode t)
;; (interactive-haskell-mode t)
(rainbow-delimiters-mode t)

;; (add-to-list 'yas/root-directory "~/.emacs.d/snippets/haskell-mode")
;; (yas/initialize)

(require 'speedbar)
(speedbar-add-supported-extension ".hs")
(speedbar-add-supported-extension ".vert")
(speedbar-add-supported-extension ".frag")
(speedbar-add-supported-extension ".tga")
(speedbar-add-supported-extension ".glsl")

(defun restartHaskell ()
     (interactive)
     (haskell-process-interrupt)
     (haskell-process-restart)
     )

(define-key haskell-mode-map (kbd "C-c c")      'hide/show-comments-toggle)
(define-key haskell-mode-map (kbd "C-c s")      'sr-speedbar-toggle)
(define-key haskell-mode-map (kbd "C-c m")      'minimap-toggle)
(define-key haskell-mode-map (kbd "C-c C-k")    'haskell-process-load-file)
(define-key haskell-mode-map (kbd "C-;")        'iedit-mode)
(define-key haskell-mode-map (kbd "C-c r")      'restartHaskell)
(define-key haskell-mode-map (kbd "M-g M-f")    'first-error)
(define-key haskell-mode-map (kbd "M-<up>")     'paredit-splice-sexp)
(define-key haskell-mode-map (kbd "M-<RET>")    'yafolding-toggle-element)
(define-key haskell-mode-map (kbd "C-c d")      'haskell-hayoo)
(define-key haskell-mode-map (kbd "C-c .")      'haskell-navigate-imports)
(define-key haskell-mode-map (kbd "M-<iso-lefttab>") 'company-complete)

(smartparens-mode t)
(paredit-mode t)

;; (add-to-list 'company-backends 'company-ghc)

;; ;; (intero-mode t)

(auto-complete-mode t)
(company-mode t)

;; ;;
;; ;; LSP
;; ;;

;; (add-to-list 'load-path "/home/madjestic/Projects/Emacs/lsp-haskell")
;; (add-to-list 'load-path "/home/madjestic/Projects/Emacs/lsp-mode")
;; (add-to-list 'load-path "/home/madjestic/Projects/Emacs/lsp-ui")
;; (require 'lsp-ui)
;; (require 'lsp-haskell)
;; (add-hook 'lsp-mode-hook 'lsp-ui-mode)
;; (add-hook 'haskell-mode-hook 'lsp-haskell-enable)
;; (add-hook 'haskell-mode-hook 'flycheck-mode)
