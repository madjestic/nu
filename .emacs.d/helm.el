;;;;;;;;;;
;; helm ;;
;;;;;;;;;;

(setq
 helm-gtags-ignore-case                t
 helm-gtags-auto-update                t
 helm-gtags-use-input-at-cursor        t
 helm-gtags-pulse-at-cursor            t
 helm-gtags-suggested-key-mapping      t
 helm-M-x-fuzzy-match                  t
 helm-bookmark-show-location           t
 helm-buffers-fuzzy-matching           t
 helm-completion-in-region-fuzzy-match t
 helm-file-cache-fuzzy-match           t
 helm-imenu-fuzzy-match                t
 helm-mode-fuzzy-match                 t
 helm-locate-fuzzy-match               t 
 helm-quick-update                     t
 helm-recentf-fuzzy-match              t
 helm-semantic-fuzzy-match             t
 helm-gtags-prefix-key                 "\C-cg"
; helm-show-completion-use-special-display nil
 helm-swoop-pattern                    t
 )

;; Enable helm-gtags-mode
(require 'helm-gtags)
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)

(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

(global-set-key (kbd "C-x r b") 'helm-bookmarks)
(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(require 'ac-helm)
(global-set-key (kbd "C-:") 'ac-complete-with-helm)
(define-key ac-complete-mode-map (kbd "C-:") 'ac-complete-with-helm)

(setq ac-complete-mode-map t)

(helm-mode)
;(helm-swoop)
