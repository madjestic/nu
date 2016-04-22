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

;; (defun delete-forward-whitespace ()
;; 	"Delte forward whitespace."
;; 	(interactive)
;; 	(back-to-indentation)
;; 	(set-marker 1) - fails here
;; 	(move-beginning-of-line)
;; 	(kill-region))
;;  did not work 

(global-set-key (kbd "M-#") 'next-word)
(global-set-key (kbd "C-M-g") 'revert-buffer)
(global-set-key (kbd "C-x C-k") 'kill-all-dired-buffers)
(global-set-key (kbd "C-c n") 'linum-mode)
(global-set-key (kbd "C-;") 'iedit-mode)
(global-set-key (kbd "M-+") 'text-scale-increase)
(global-set-key (kbd "M-_") 'text-scale-decrease)
(global-set-key (kbd "M-S-<up>") 'move-text-up)
(global-set-key (kbd "M-S-<down>") 'move-text-down)
(global-set-key (kbd "M-^") 'server-force-delete)
(global-set-key (kbd "C-c s") 'sr-speedbar-toggle)
(global-set-key (kbd "C-c m") 'minimap-toggle)
(global-set-key (kbd "C-c M-m") 'menu-bar-mode)
(global-set-key (kbd "C-c b") 'flymake-compile) ;; build with flymake/Makefile
;;(global-set-key (kbd "C-M-x") 'delete-forward-whitespace)


(defun jabber ()
    (interactive)
		(load-jabber)
;;		(jabber-connect)
    (switch-to-buffer "*-jabber-*"))

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(setenv "PATH" (concat (getenv "PATH") ":~/bin"))
