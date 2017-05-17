; setup-basic.el

; init & backup
(set 'inhibit-startup-message t)
(set 'backup-directory-alist '((".*" . "~/.emacs.d/backup/")))
(set 'auto-save-file-name-transforms '((".*" "~/.emacs.d/backup/" t)))
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(if (get-buffer "*scratch*")
    (kill-buffer "*scratch*"))

; osx meta
(set 'mac-option-modifier 'super)
(set 'mac-command-modifier 'meta)

; gdb
(set 'gdb-show-main t)
(set 'gdb-many-windows t)

; coding-system
(prefer-coding-system 'chinese-gbk-dos)
(prefer-coding-system 'utf-8-unix)
(defun gbk ()
  "revert buffer coding to chinese-gbk"
  (interactive)
  (revert-buffer-with-coding-system 'chinese-gbk-dos))

; frame | gui
(menu-bar-mode t)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(when window-system
  (set-frame-size (selected-frame) 120 38))

; font
(if (equal system-type 'darwin)
    (set-frame-font "Menlo-13")
  (set-frame-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1"))

; color-theme
(use-package color-theme)
(use-package color-theme-solarized
  :init
  (if (string> (format-time-string "%H" (current-time)) "18")
      (set-frame-parameter nil 'background-mode 'dark))
  :config
  (load-theme 'solarized t)
  (enable-theme 'solarized))

; tab style
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq backward-delete-char-untabify-method 'hungry)

; org mode
(add-hook 'org-mode-hook
          (lambda () (modify-syntax-entry ?_ "w")))
(set 'org-todo-keywords '((sequence "TODO" "TODAY" "DONE")))
(set 'org-agenda-files '("~/mind/freedom_as_autonomy/activity.org"))

; gnus mode

; evil mode
(use-package evil
  :init
  (global-set-key (kbd "C-c m e") 'evil-mode)
  :config
  (evil-mode t)
  (define-key evil-normal-state-map (kbd "M-.") 'helm-gtags-dwim)
  (define-key evil-normal-state-map "\C-]" "\M-."))
(use-package evil-leader
  :config
  (evil-leader/set-leader "<SPC>")
  (global-evil-leader-mode))

; term mode
(use-package multi-term
  :init
  (global-set-key (kbd "C-c m t") 'multi-term)
  :config
  (evil-set-initial-state 'term-mode 'emacs)
  (define-key term-raw-map (kbd "M-x") 'helm-M-x)
  (delete* "<ESC>" term-unbind-key-list :test 'equal)
  (delete* '("C-p" . previous-line) term-bind-key-alist :test 'equal)
  (delete* '("C-n" . next-line) term-bind-key-alist :test 'equal)
  (delete* '("C-r" . isearch-backward) term-bind-key-alist :test 'equal)
  (multi-term))

; ggtags
(use-package ggtags)

; company mode
(use-package company
  :config
  (set-variable 'company-idle-delay 0.1)
  (set-variable 'company-auto-complete nil)
  (global-company-mode t))

; projectile
(use-package projectile
  :config
  (set 'projectile-enable-caching t)
  (projectile-mode t))

; emacs-lisp style
(defun custom-emacs-lisp-mode ()
  "custom emacs-lisp-mode"
  (set 'indent-tabs-mode nil)
  (set 'comment-column 0))
(add-hook 'emacs-lisp-mode-hook 'custom-emacs-lisp-mode)

(provide 'setup-basic)
