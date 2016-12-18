(add-to-list 'auto-mode-alist '("\\.geo\\'"  . (lambda ()(json-mode))))
(add-to-list 'auto-mode-alist '("\\.org\\'"  . (lambda ()(org-mode))))
(add-to-list 'auto-mode-alist '("\\.vfl\\'"  . (lambda ()(c++-mode))))
(add-to-list 'auto-mode-alist '("\\.cpp\\'"  . (lambda ()(c++-mode))))
(add-to-list 'auto-mode-alist '("\\.c\\'"    . (lambda ()(c++-mode))))
(add-to-list 'auto-mode-alist '("\\.h\\'"    . (lambda ()(c++-mode))))
(add-to-list 'auto-mode-alist '("\\.vert\\'" . (lambda ()(c++-mode))))
(add-to-list 'auto-mode-alist '("\\.frag\\'" . (lambda ()(c++-mode))))
(add-to-list 'auto-mode-alist '("\\.hs\\'"   . (lambda ()(haskell-mode))))
(add-to-list 'auto-mode-alist '("\\.py\\'"   . (lambda ()(python-mode))))
(add-to-list 'auto-mode-alist '("\\.scm\\'"  . (lambda ()(scheme-mode))))
(add-to-list 'auto-mode-alist '("\\.pdf\\'"  . org-pdfview-open))
(add-to-list 'auto-mode-alist '("\\.pdf::\\([[:digit:]]+\\)\\'"
                                             . org-pdfview-open))

(add-hook 'octave-mode-hook
          (lambda()						
						(load-octave)))


(add-hook 'json-mode-hook
          (lambda()						
						(load-json)))

(add-hook 'scheme-mode-hook
          (lambda()						
						(load-scheme)))

(add-hook 'c++-mode-hook
          (lambda()						
						(load-cpp)))

(add-hook 'gnus-group-mode-hook
          (lambda()						
						(load-gnus)))


(add-hook 'haskell-mode-hook
          (lambda()
            (autoload 'ghc-init "ghc" nil t)
            (autoload 'ghc-debug "ghc" nil t)
            (ghc-init)
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

