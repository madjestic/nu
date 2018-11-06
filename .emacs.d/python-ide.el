                                        ;(python-mode)
(jedi:setup)
(elpy-mode)
(helm-mode)
                                        ;(jedi:tooltip-method '(pos-tip popup))
;(company-mode)
(smartparens-mode)
(linum-mode)
(rainbow-delimiters-mode t)
(paredit-mode)

(use-package importmagic
  :ensure t
  :config
  (add-hook 'python-mode-hook 'importmagic-mode))

(global-set-key (kbd "M-.") 'jedi:goto-definition)
(global-set-key (kbd "C-c c")      'hide/show-comments-toggle)
(global-set-key (kbd "C-c s")      'sr-speedbar-toggle)
(global-set-key (kbd "C-c m")      'minimap-toggle)
(global-set-key (kbd "C-;")        'iedit-mode)
(global-set-key (kbd "M-g M-f")    'first-error)
(global-set-key (kbd "M-<up>")     'paredit-splice-sexp)
