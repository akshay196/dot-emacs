(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode 0)
(display-battery-mode 1)
(show-paren-mode t)
(setq column-number-mode t)

;; y or n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Key bindings
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-0") 'delete-window)
(global-set-key (kbd "C-1") 'delete-other-windows)
(global-set-key (kbd "C-2") 'split-window-below)
(global-set-key (kbd "C-3") 'split-window-right)

;; Binding for Magit status
(global-set-key (kbd "C-x g") 'magit-status)

;; Temporary file management
(setq backup-directory-alist
      `((".*" . ,"~/.emacs-saves/")))
(setq auto-save-file-name-transforms
      `((".*" ,"~/.emacs-saves" t)))

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t))

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/tmp/test.org")))
 '(package-selected-packages
   (quote
    (magit company-jedi company-anaconda company markdown-mode+ markdown-mode))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:inherit (shadow default) :background "white smoke")))))

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'linum-highlight-current-line-number)
(setq linum-format 'linum-highlight-current-line-number)

(add-hook 'after-init-hook 'global-company-mode)

;; Python mode hooks
(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

(add-hook 'python-mode-hook 'my/python-mode-hook)

;; Standard Jedi.el setting
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; Type:
;;     M-x package-install RET jedi RET
;;     M-x jedi:install-server RET
;; Then open Python file.

;; Start server mode
(server-start)
