;;(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;;(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

(add-to-list 'load-path "/home/madjestic/Projects/structured-haskell-mode/elisp")
(require 'shm)
(structured-haskell-mode)

(custom-set-variables
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t))


(require 'flymake-haskell-multi)
(add-hook 'haskell-mode-hook 'flymake-haskell-multi-load)

(linum-mode t)
(structured-haskell-mode t)


(turn-on-haskell-doc-mode)
(interactive-haskell-mode)

(smartparens-mode)
(rainbow-delimiters-mode)

(add-to-list 'yas/root-directory "~/.emacs.d/snippets/haskell-mode")
;;(yas/initialize)

(require 'speedbar)
(speedbar-add-supported-extension ".hs")
(speedbar-add-supported-extension ".vert")
(speedbar-add-supported-extension ".frag")
(speedbar-add-supported-extension ".tga")
(speedbar-add-supported-extension ".glsl")


(global-set-key (kbd "C-c s") 'sr-speedbar-toggle)
(global-set-key (kbd "C-c m") 'minimap-toggle)
(global-set-key (kbd "C-c C-k") 'haskell-process-load-file)
(global-set-key (kbd "C-;") 'iedit-mode)
(define-key haskell-mode-map (kbd "C-c D") 'haskell-hayoo)
(global-set-key (kbd "C-c r") 'haskell-process-restart)
