(defun my-gnus-group-list-subscribed-groups ()
  "List all subscribed groups with or without un-read messages"
  (interactive)
  (gnus-group-list-all-groups 5))

(define-key gnus-group-mode-map 
  ;; list all the subscribed groups even they contain zero un-read messages
  (kbd "o") 'my-gnus-group-list-subscribed-groups)

;; Inline images?
    (setq mm-attachment-override-types '("image/.*"))

;; No HTML mail
    (setq mm-discouraged-alternatives '("text/html" "text/richtext"))
