;;;;;;;;;;;;;;
;; Org-mode ;;
;;;;;;;;;;;;;;

(smartparens-mode)
(auto-complete-mode)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c C-S-l") 'org-store-link)
(global-set-key (kbd "C-c C-S-c") 'org-capture)
(global-set-key (kbd "C-c C-S-a") 'org-agenda)
(global-set-key (kbd "C-c C-S-b") 'org-iswitchb)

(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

(global-set-key (kbd "C-c a") 'org-agenda)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "firefox")
(setq browse-url-default-browser "firefox")

(lambda (file link) (org-pdfview-open file))

;; * To manupulate a image under cursor.
;;
;;  M-x imagex-global-sticky-mode
(imagex-global-sticky-mode)
;; * C-c C-x C-v org-mode-toggle-inline-images
;;
;; * C-c + / C-c -: Zoom in/out image.
;; * C-c M-m: Adjust image to current frame size.
;; * C-c C-x C-s: Save current image.
;;
;; * Adjusted image when open image file.
;;
;;  M-x imagex-auto-adjust-mode
;; (org-mode)

(pdf-tools-install)
