;(literate-haskell-mode t)
;(python-mode t)
(jedi:setup)
;(jedi:tooltip-method '(pos-tip popup))
(global-set-key (kbd "M-.") 'jedi:goto-definition)

(use-package importmagic
    :ensure t
    :config
    (add-hook 'python-mode-hook 'importmagic-mode))

(rainbow-delimiters-mode t)

(global-set-key (kbd "C-c c")      'hide/show-comments-toggle)
(global-set-key (kbd "C-c s")      'sr-speedbar-toggle)
(global-set-key (kbd "C-c m")      'minimap-toggle)
(global-set-key (kbd "C-;")        'iedit-mode)
(global-set-key (kbd "M-g M-f")    'first-error)
(global-set-key (kbd "M-<up>")     'paredit-splice-sexp)


(company-mode)
; (paredit-mode)
(smartparens-mode)
(linum-mode)
;; (literate-haskell-mode)
;; (python-mode)
;; (haskell-indentation-mode)
