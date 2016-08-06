(yafolding-mode t)

(global-set-key (kbd "C-S-RET") 'yafolding-hide-parent-element)
(global-set-key (kbd "C-M-RET") 'yafolding-toggle-all)
(global-set-key (kbd "M-RET")   'yafolding-toggle-element)

;; (defvar yafolding-mode-map
;;   (let ((map (make-sparse-keymap)))
;;     (define-key map (kbd "<C-S-return>") 'yafolding-hide-parent-element)
;;     (define-key map (kbd "<C-M-return>") 'yafolding-toggle-all)
;;     (define-key map (kbd "<M-return>")   'yafolding-toggle-element)
;;     map))
