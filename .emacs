
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode 0)
(display-battery-mode 1)
(show-paren-mode t)
(setq column-number-mode t)

;; yes and no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Key bindings
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-0") 'delete-window)
(global-set-key (kbd "C-1") 'delete-other-windows)
(global-set-key (kbd "C-2") 'split-window-below)
(global-set-key (kbd "C-3") 'split-window-right)

;; Temporary file management
(setq backup-directory-alist
      `((".*" . ,"~/.emacs-saves/")))
(setq auto-save-file-name-transforms
      `((".*" ,"~/emacs-saves" t)))
