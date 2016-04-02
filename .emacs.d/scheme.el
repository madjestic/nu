(smartparens-mode)
(run-scheme)

(defun slime-tab ()
  "slime-mode tab dwim, either indent, complete symbol or yas/expand"
  (interactive)
  (let ((r (slime-indent-and-complete-symbol)))
    (unless r
      (yas/expand))))




