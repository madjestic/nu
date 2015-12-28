(add-to-list 'auto-mode-alist '("\\.org\\'" . (lambda ()(org-mode))))
(add-to-list 'auto-mode-alist '("\\.vfl\\'" . (lambda ()(c++-mode))))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . (lambda ()(c++-mode))))
(add-to-list 'auto-mode-alist '("\\.c\\'"   . (lambda ()(c++-mode))))
(add-to-list 'auto-mode-alist '("\\.h\\'"   . (lambda ()(c++-mode))))
(add-to-list 'auto-mode-alist '("\\.vert\\'"   . (lambda ()(c++-mode))))
(add-to-list 'auto-mode-alist '("\\.frag\\'"   . (lambda ()(c++-mode))))
(add-to-list 'auto-mode-alist '("\\.hs\\'" . (lambda ()(haskell-mode))))
(add-to-list 'auto-mode-alist '("\\.py\\'" . (lambda ()(python-mode))))

(add-hook 'c++-mode-hook
          (lambda()						
						(load-cpp)))

(add-hook 'gnus-group-mode-hook
          (lambda()						
						(load-gnus)))


(add-hook 'haskell-mode-hook
          (lambda()
						(load-haskell)
						(load-helm)))

(add-hook 'circe-mode-hook
          (lambda()
						(load-circe)
						))

;; (add-hook 'org-mode-hook
;;           (lambda()
;; 						(load-org)
;; 						(org-mode)
;; 						))

(add-hook 'html-mode-hook
          (lambda()
            (setq sgml-basic-offset 4)
            (setq indent-tabs-mode t)))

(add-hook 'doc-view-mode-hook 'auto-revert-mode)

(add-hook 'LaTeX-mode-hook
          (lambda()
						(load-latex)
						))

(add-hook 'web-mode-hook
          (lambda()
	    (linum-mode)
	    (iedit-mode)
	    (setq web-mode-markup-indent-offset 4)
	    (setq web-mode-css-indent-offset 4)
	    (setq web-mode-code-indent-offset 4)
	    (setq web-mode-indent-style 4)))

