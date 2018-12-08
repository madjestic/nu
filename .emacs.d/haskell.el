;; ;; If you don't have MELPA in your package archives:
;; ;; (require 'package)
;; ;; (add-to-list
;; ;;   'package-archives
;; ;;   '("melpa" . "http://melpa.org/packages/") t)
;; ;; (package-initialize)
;; ;; (package-refresh-contents)
    
;; ;; ;; Install Intero
;; ;; (package-install 'intero)
;; ;; (add-hook 'haskell-mode-hook 'intero-mode)

(custom-set-variables
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t))

(require 'flymake-haskell-multi)
(add-hook 'haskell-mode-hook 'flymake-haskell-multi-load)

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
(define-key haskell-mode-map (kbd "C-c C-k")    'haskell-process-load-file)
(define-key haskell-mode-map (kbd "C-;")        'iedit-mode)
(define-key haskell-mode-map (kbd "C-c r")      'restartHaskell)
(define-key haskell-mode-map (kbd "M-g M-f")    'first-error)
(define-key haskell-mode-map (kbd "M-<up>")     'paredit-splice-sexp)
(define-key haskell-mode-map (kbd "M-<RET>")    'yafolding-toggle-element)
(define-key haskell-mode-map (kbd "C-c d")      'haskell-hayoo)
(define-key haskell-mode-map (kbd "C-c .")      'haskell-navigate-imports)
(define-key haskell-mode-map (kbd "M-<iso-lefttab>") 'company-complete)

;; ;; (smartparens-mode t)
;; ;; (sp-point-at-bol-p f)
;; ;; (paredit-mode t)

;; (add-to-list 'company-backends 'company-ghc)

;; (auto-complete-mode t)
;; (company-mode t)

;;
;; LSP
;;

;; (add-to-list 'load-path "/home/madjestic/Projects/Emacs/lsp-haskell")
;; (add-to-list 'load-path "/home/madjestic/Projects/Emacs/lsp-mode")
;; (add-to-list 'load-path "/home/madjestic/Projects/Emacs/lsp-ui")
;; (require 'lsp-ui)
;; (require 'lsp-haskell)
;; (add-hook 'lsp-mode-hook 'lsp-ui-mode)
;; (add-hook 'haskell-mode-hook 'lsp-haskell-enable)
;; (add-hook 'haskell-mode-hook 'flycheck-mode)

;;;;;;;;;;
;; helm ;;
;;;;;;;;;;

;; (auto-complete-mode)

;; (setq
;;  helm-gtags-ignore-case                t
;;  helm-gtags-auto-update                t
;;  helm-gtags-use-input-at-cursor        t
;;  helm-gtags-pulse-at-cursor            t
;;  helm-gtags-suggested-key-mapping      t
;;  helm-M-x-fuzzy-match                  t
;;  helm-bookmark-show-location           t
;;  helm-buffers-fuzzy-matching           t
;;  helm-completion-in-region-fuzzy-match t
;;  helm-file-cache-fuzzy-match           t
;;  helm-imenu-fuzzy-match                t
;;  helm-mode-fuzzy-match                 t
;;  helm-locate-fuzzy-match               t 
;;  helm-quick-update                     t
;;  helm-recentf-fuzzy-match              t
;;  helm-semantic-fuzzy-match             t
;;  helm-gtags-prefix-key                 "\C-c g"
;;  ;;helm-show-completion-use-special-display t
;;  helm-swoop-pattern                    t
;;  )

;; (auto-complete-mode nil)
(require 'helm)
(require 'ac-helm)
;; (helm-mode 1)
;; (helm-swoop)

;; (require 'helm-gtags)
;; (helm-gtags-mode)
;; (define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
;; (define-key helm-gtags-mode-map (kbd "C-j")     'helm-gtags-select)
;; (define-key helm-gtags-mode-map (kbd "M-.")     'helm-gtags-dwim)
;; (define-key helm-gtags-mode-map (kbd "M-,")     'helm-gtags-pop-stack)
;; (define-key helm-gtags-mode-map (kbd "C-c <")   'helm-gtags-previous-history)
;; (define-key helm-gtags-mode-map (kbd "C-c >")   'helm-gtags-next-history)

(define-key haskell-mode-map (kbd "<tab>") 'helm-imenu)
(define-key haskell-mode-map (kbd "C-:")   'ac-complete-with-helm)

;; (global-set-key (kbd "C-x r b") 'helm-bookmarks)
;; (global-set-key (kbd "C-x C-m") 'helm-M-x)
;; (global-set-key (kbd "M-y")     'helm-show-kill-ring)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)

;; (global-set-key (kbd "C-:")     'ac-complete-with-helm)


















