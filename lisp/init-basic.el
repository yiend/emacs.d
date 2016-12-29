; basic.el

; init & backup
(set 'inhibit-startup-message t)
(set 'backup-directory-alist '((".*" . "~/.emacs.d/backup/")))
(set 'auto-save-file-name-transforms '((".*" "~/.emacs.d/backup/" t)))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

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
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
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
  (set 'c-basic-offset 4)
  (hs-minor-mode)
  (set 'hs-hide-comments-when-hiding-all 1)
  (set 'hs-allow-nesting 1)
  (modify-syntax-entry ?_ "w")
  (linum-mode))
(add-hook 'c-mode-hook 'custom-c-mode)
(add-hook 'c++-mode-hook 'custom-c-mode)
(add-hook 'sh-mode-hook 'custom-c-mode)

; evil mode
(require 'evil)
(evil-mode t)
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key "jd" 'ycmd-goto-declaration)
(evil-leader/set-key "ji" 'ycmd-goto-imprecise)
(evil-leader/set-key "e" 'speedbar)

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

; pinyin
(require 'chinese-pyim)
(set 'default-input-method "chinese-pyim")
(global-set-key (kbd "C-M-SPC") 'toggle-input-method)

; org-mode
(global-set-key (kbd "C-c a") 'org-agenda)
(set 'org-todo-keywords
     '((sequence "TODO" "TODAY" "DONE")))

(provide 'init-basic)
