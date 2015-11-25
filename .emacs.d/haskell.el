;;(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;;(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

(add-to-list 'load-path "/home/madjestic/Projects/structured-haskell-mode/elisp")
(require 'shm)
(structured-haskell-mode)

(custom-set-variables
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t))

(global-set-key (kbd "C-c C-k") 'haskell-process-load-file)

(global-set-key (kbd "C-c l") 'linum-mode)

(global-set-key (kbd "C-;") 'iedit-mode)

(require 'flymake-haskell-multi)
(add-hook 'haskell-mode-hook 'flymake-haskell-multi-load)

(linum-mode t)
(structured-haskell-mode t)

(define-key haskell-mode-map (kbd "C-c D") 'haskell-hayoo)
(global-set-key (kbd "C-c r") 'haskell-process-restart)

(turn-on-haskell-doc-mode)
(interactive-haskell-mode)

(paredit-mode)
(global-set-key (kbd "M-s") 'paredit-splice-sexp)

(add-to-list 'yas/root-directory "~/.emacs.d/snippets/haskell-mode")
(yas/initialize)

