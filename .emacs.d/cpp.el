
(req-package flycheck
  :config
  (progn
    (global-flycheck-mode)))

(req-package company
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode)
    (global-set-key (kbd "M-/") 'company-complete-common-or-cycle)
    (setq company-idle-delay 0.1)))

(setq company-dabbrev-downcase 0.1)
(setq company-idle-delay 0.1)

(define-key c++-mode-map [backtab]   'company-yasnippet)
(define-key c++-mode-map (kbd "C-:") 'ac-complete-with-helm)

(req-package projectile
  :config
  (progn
    (projectile-global-mode)
    ))

(company-mode t)
(smartparens-mode t)
(paredit-mode t)
(rainbow-delimiters-mode t)
(linum-mode t)

(defun my-at-expression-paredit-space-for-delimiter-predicate (endp delimiter)
  (if (and (member major-mode '(c++-mode))
           (not endp))
      (not (or (and (memq delimiter '(?\[ ?\{ ?\()))))
    t))

(add-hook 'paredit-space-for-delimiter-predicates
          #'my-at-expression-paredit-space-for-delimiter-predicate)

