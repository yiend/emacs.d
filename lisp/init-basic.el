; basic.el
(set 'inhibit-startup-message t)
(set 'backup-directory-alist '((".*" . "~/.emacs.d/backup/")))
(set 'auto-save-file-name-transforms '((".*" "~/.emacs.d/backup/" t)))

; font & color-theme
(set-default-font "Menlo-13")
(require 'color-theme)
(require 'color-theme-solarized)
(load-theme 'solarized t)
(enable-theme 'solarized)

; code style
(setq-default tab-width 4)
(setq c-default-style "linux"
  c-basic-offset 4)

; frame | gui
(menu-bar-mode t)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(when window-system
  (set-frame-size (selected-frame) 108 34))

; evil mode
(require 'evil)
(evil-mode t)

; ycmd & company-ycmd
(require 'ycmd)
(set-variable 'ycmd-server-command '("python" "/opt/ycmd/ycmd"))
(set-variable 'ycmd-global-config "~/.ycm_extra_conf.py")
(add-hook 'c-mode-hook 'ycmd-mode)
(add-hook 'c-mode-hook 'company-mode)
(add-hook 'c++-mode-hook 'ycmd-mode)
(add-hook 'c++-mode-hook 'company-mode)
(require 'company-ycmd)
(company-ycmd-setup)

(provide 'init-basic)
