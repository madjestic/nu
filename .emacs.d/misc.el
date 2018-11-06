(defvar winstack-stack '()
  "A Stack holding window configurations.
  Use `winstack-push' and
  `winstack-pop' to modify it.")

(defun winstack-push()
  "Push the current window configuration onto `winstack-stack'."
  (interactive)
  (if (and (window-configuration-p (first winstack-stack))
           (compare-window-configurations (first winstack-stack) (current-window-configuration)))
      (message "Current config already pushed")
    (progn (push (current-window-configuration) winstack-stack)
           (message (concat "pushed " (number-to-string
                                       (length (window-list (selected-frame)))) " frame config")))))

(defun winstack-pop()
  "Pop the last window configuration off `winstack-stack' and apply it."
  (interactive)
  (if (first winstack-stack)
      (progn (set-window-configuration (pop winstack-stack))
             (message "popped"))
    (message "End of window stack")))

(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

;; (defun load-pdf ()
;;   (interactive))

(defun load-pdf (link)
  "Open LINK in pdf-view-mode."
  (cond ((string-match "\\(.*\\)::\\([0-9]*\\)\\+\\+\\([[0-9]\\.*[0-9]*\\)"  link)
         (let* ((path (match-string 1 link))
                ;;               (page (string-to-number (match-string 2 link)))
                ;;               (height (string-to-number (match-string 3 link))))
                ;;          (org-open-file path 1)
                ;;          (pdf-view-goto-page page)
                ;;          (image-set-window-vscroll
                ;;           (round (/ (* height (car (pdf-view-image-size))) (frame-char-height))))))
                ;;       ((string-match "\\(.*\\)::\\([0-9]+\\)$"  link)
                ;;        (let* ((path (match-string 1 link))
                ;;               (page (string-to-number (match-string 2 link))))
                ;;          (org-open-file path 1)
                ;;          (pdf-view-goto-page page)))
                ;;       (t
                ;;        (org-open-file link 1))
                (interactive)) ))))

(defun load-feed ()
  "load RSS options"
  (load-rss))

(defun load-rss ()
  "load RSS options"
  (interactive)
  (load-user-file "elfeed.el"))

(defun load-octave ()
  "load octave options"
  (interactive)
  (load-user-file "octave.el"))

(defun load-cedille ()
  "load cedille options"
  (interactive)
  (load-user-file "cedille.el"))

(defun load-json ()
  "load json options"
  (interactive)
  (load-user-file "json.el"))

(defun load-folding ()
  "load folding options"
  (interactive)
  (load-user-file "folding.el"))

(defun load-calendar ()
  "load glfw Calendar"
  (interactive)
  (load-user-file "calendar.el"))

(defun load-scheme ()
  "load Scheme config files"
  (interactive)
  (load-user-file "scheme.el"))

(defun load-helm ()
  "load Helm config files"
  (interactive)
  (load-user-file "helm.el"))

(defun load-gnus ()
  "load Gnus config files"
  (interactive)
  (load-user-file "gnus.el"))

(defun load-jabber ()
  "load Jabber config files"
  (interactive)
  (load-user-file "jabber.el"))

(defun load-circe ()
  "load Circe config files"
  (interactive)
  (load-user-file "circe.el"))

(defun load-org ()
  "load Org-mode config files"
  (interactive)
  (load-user-file "org.el"))

(defun load-latex ()
  "load latex config files"
  (interactive)
  (load-user-file "latex.el"))

(defun load-lisp ()
  "load lisp config files"
  (interactive)
  (load-user-file "lisp.el"))

(defun load-python ()
  "load python config files"
  (interactive)
  (load-user-file "python-ide.el"))

(defun load-haskell ()
  "load haskell config files"
  (interactive)
  (load-user-file "haskell.el"))

(defun load-cpp ()
  "load cpp config files"
  (interactive)
  (load-user-file "cpp.el"))

(defun load-ecb ()
  "load ecb config files"
  (interactive)
  (load-user-file "ecb.el"))

(defun load-haskell-ide ()
  "load haskell-ide config files"
  (interactive)
  (load-user-file "haskell-ide.el"))

(defun load-cpp-ide ()
  "load cpp-ide config files"
  (interactive)
  (load-user-file "cpp-ide.el"))

(defun swap-buffer-mode ()
  "load swap-buffer-mode config files"
  (interactive)
  (load-user-file "buffer-mode.el"))

(defun web-mode ()
  "load web-mode config files"
  (interactive)
  (load-user-file "web-mode.el"))

(defun blog-mode ()
  "load blog-mode config files"
  (interactive)
  (load-user-file "blog.el"))

(defun load-erc ()
  "load erc config files"
  (interactive)
  (load-user-file "erc.el"))

(defun sr-speedbar ()
	(interactive)
	(load "~/.emacs.d/sr-speedbar.el"))

(defun kill-all-dired-buffers ()
  "Kill all dired buffers."
  (interactive)
  (save-excursion
    (let ((count 0))
      (dolist (buffer (buffer-list))
        (set-buffer buffer)
        (when (equal major-mode 'dired-mode)
          (setq count (1+ count))
          (kill-buffer buffer)))
      (message "Killed %i dired buffer(s)." count))))

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer 
        (delq (current-buffer) 
              (remove-if-not 'buffer-file-name (buffer-list)))))

(defun next-word ()
	"Goto next word."
	(interactive)
	(forward-word 1)
	(forward-word 1)
	(backward-word 1)
	)

(global-set-key (kbd "C-c h")      'vline-mode)
(global-set-key (kbd "C-c t")      'toggle-truncate-lines)
(global-set-key (kbd "M-#")        'next-word)
(global-set-key (kbd "C-M-g")      'revert-buffer)
(global-set-key (kbd "C-x C-k")    'kill-all-dired-buffers)
(global-set-key (kbd "C-c n")      'linum-mode)
(global-set-key (kbd "C-;")        'iedit-mode)
(global-set-key (kbd "M-+")        'text-scale-increase)
(global-set-key (kbd "M-_")        'text-scale-decrease)
(global-set-key (kbd "M-S-<up>")   'move-text-up)
(global-set-key (kbd "M-S-<down>") 'move-text-down)
(global-set-key (kbd "M-^")        'server-force-delete)
(global-set-key (kbd "C-c s")      'sr-speedbar-toggle)
;; (global-set-key (kbd "C-c m")      'minimap-toggle)
(global-set-key (kbd "C-c M-m")    'menu-bar-mode)
(global-set-key (kbd "C-c b")      'flymake-compile) ;; build with flymake/Makefile
(global-set-key (kbd "C-M-y")      'secondary-dwim)
(global-set-key (kbd "C-x p")      'winstack-push)
(global-set-key (kbd "C-x M-p")    'winstack-pop)
(global-set-key (kbd "M-j")       'tabbar-backward)
(global-set-key (kbd "M-k")       'tabbar-forward)
;;; scrollers   
;; (global-set-key "\M-n" "\C-u1\C-v\C-n")
;; (global-set-key "\M-p" "\C-u1\M-v\C-p")

;; (global-set-key "\C-M-]" "\C-u1\C-v\C-n")
;; (global-set-key "\C-M-z" "\C-u1\M-v\C-p")
;;; folding

(global-set-key (kbd "M-n")              "\C-u1\C-v\C-n")
(global-set-key (kbd "M-p")              "\C-u1\M-v\C-p")
(global-set-key (kbd "M-[")              "\C-u1\C-v\C-n") ;; haskell-mode conflict with the original
(global-set-key (kbd "M-]")              "\C-u1\M-v\C-p")
(global-set-key (kbd "M-RET")              'yafolding-toggle-element)
(global-set-key (kbd "<C-mouse-4>")        'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>")        'text-scale-decrease)
(global-set-key (kbd "<M-down-mouse-2>")   'dired-sort-menu-popup)
(global-set-key (kbd "<C-M-down-mouse-2>") 'diredp-mouse-3-menu)

(defun jabber ()
  (interactive)
  (load-jabber)
  ;;		(jabber-connect)
  (switch-to-buffer "*-jabber-*"))

(defun truncate-lines ()
  (toggle-truncate-lines))


(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(setenv "PATH" (concat (getenv "PATH") ":~/bin"))
