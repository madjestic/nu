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

;;
;; RTags
;;
(require 'flycheck-rtags)
(rtags-start-process-unless-running)

(define-key c++-mode-map (kbd "M-.")     'rtags-find-symbol-at-point)
(define-key c++-mode-map (kbd "M-,")     'rtags-find-references-at-point)
(define-key c++-mode-map (kbd "M-?")     'rtags-display-summary)
(define-key c++-mode-map (kbd "C-c C-c") 'rtags-compile-file)

;;
;; Fix space insertion for paredit-mode
;;

(defun my-at-expression-paredit-space-for-delimiter-predicate (endp delimiter)
  (if (and (member major-mode '(c++-mode))
           (not endp))
      (not (or (and (memq delimiter '(?\[ ?\{ ?\()))))
    t))

(add-hook 'paredit-space-for-delimiter-predicates
          #'my-at-expression-paredit-space-for-delimiter-predicate)

;;
;; Mode Settings
;;

;; (flycheck-mode t)
(company-mode t)
(smartparens-mode t)
(paredit-mode t)
(rainbow-delimiters-mode t)
(linum-mode t)
