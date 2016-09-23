(add-to-list 'load-path "/home/madjestic/Projects/structured-haskell-mode/elisp")
;; (require 'shm)
;; (structured-haskell-mode t)
(ghc-core-mode)

(custom-set-variables
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t))

;; (require 'flymake-haskell-multi)
;; (add-hook 'haskell-mode-hook 'flymake-haskell-multi-load)

(linum-mode t)
(turn-on-haskell-doc-mode t)
(interactive-haskell-mode t)
(rainbow-delimiters-mode t)

(add-to-list 'yas/root-directory "~/.emacs.d/snippets/haskell-mode")
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

(global-set-key (kbd "C-c c")      'hide/show-comments-toggle)
(global-set-key (kbd "C-c s")      'sr-speedbar-toggle)
(global-set-key (kbd "C-c m")      'minimap-toggle)
(global-set-key (kbd "C-c C-k")    'haskell-process-load-file)
(global-set-key (kbd "C-;")        'iedit-mode)
(global-set-key (kbd "C-c r")      'restartHaskell)
(global-set-key (kbd "M-g M-f")    'first-error)
(global-set-key (kbd "M-<up>")     'paredit-splice-sexp)

(define-key haskell-mode-map (kbd "C-c D") 'haskell-hoogle)

(paredit-mode t)
(smartparens-mode t)
