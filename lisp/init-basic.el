; basic.el

; init & backup
(set 'inhibit-startup-message t)
(set 'backup-directory-alist '((".*" . "~/.emacs.d/backup/")))
(set 'auto-save-file-name-transforms '((".*" "~/.emacs.d/backup/" t)))

; font & color-theme
(if (equal system-type 'darwin)
    (set-frame-font "Menlo-13")
  (set-frame-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1"))
(require 'color-theme)
(require 'color-theme-solarized)
(load-theme 'solarized t)
(if (string> (format-time-string "%H" (current-time)) "18")
    (set-frame-parameter nil 'background-mode 'dark))
(enable-theme 'solarized)

; frame | gui
(menu-bar-mode t)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(when window-system
  (set-frame-size (selected-frame) 108 34))

; basic style
(global-linum-mode t)
(setq-default tab-width 4)
(setq backward-delete-char-untabify-method 'hungry)

; emacs-lisp style
;(add-hook 'emacs-lisp-mode-hook (lambda () (setq indent-tabs-mode nil)))
;(add-hook 'emacs-lisp-mode-hook (lambda () (setq comment-column 0)))
(defun custom-emacs-lisp-mode ()
  "custom emacs-lisp-mode"
  (set 'indent-tabs-mode nil)
  (set 'comment-column 0))
(add-hook 'emacs-lisp-mode-hook 'custom-emacs-lisp-mode)

; c style
(defun custom-c-mode ()
  "custom c-mode"
  (set 'indent-tabs-mode t)
  (set 'c-default-style "linux")
  (set 'c-basic-offset 4))
(add-hook 'c-mode-hook 'custom-c-mode)

; evil mode
(require 'evil)
(evil-mode t)

; ycmd & company & company-ycmd & flycheck-ycmd
(require 'ycmd)
(set-variable 'ycmd-server-command '("python" "/opt/ycmd/ycmd"))
(set-variable 'ycmd-global-config "~/.ycm_extra_conf.py")
(set-variable 'ycmd-extra-conf-handler 'load)
(add-hook 'c-mode-hook 'ycmd-mode)
(add-hook 'c-mode-hook 'company-mode)
(add-hook 'c++-mode-hook 'ycmd-mode)
(add-hook 'c++-mode-hook 'company-mode)
(set-variable 'company-idle-delay 0)
(require 'company-ycmd)
(company-ycmd-setup)
(require 'flycheck-ycmd)
(flycheck-ycmd-setup)

(provide 'init-basic)
