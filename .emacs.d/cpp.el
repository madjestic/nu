(req-package company
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode)
    (global-set-key (kbd "M-/") 'company-complete-common-or-cycle)
    (setq company-idle-delay 0)))

(req-package flycheck
  :config
  (progn
    (global-flycheck-mode)))


(setq company-dabbrev-downcase 0.1)
(setq company-idle-delay 0.1)

(defun tab-indent-or-complete ()
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
    (if (or (not yas-minor-mode)
            (null (do-yas-expand)))
        (if (check-expansion)
            (company-complete-common)
          (indent-for-tab-command)))))

(define-key c++-mode-map [backtab] 'tab-indent-or-complete)

(company-mode t)

(smartparens-mode t)

(linum-mode t)
