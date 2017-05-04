; basic.el

; init & backup
(set 'inhibit-startup-message t)
(set 'backup-directory-alist '((".*" . "~/.emacs.d/backup/")))
(set 'auto-save-file-name-transforms '((".*" "~/.emacs.d/backup/" t)))
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(if (get-buffer "*scratch*")
    (kill-buffer "*scratch*"))

; coding-system
(prefer-coding-system 'chinese-gbk-dos)
(prefer-coding-system 'utf-8-unix)
(defun gbk ()
  "revert buffer coding to chinese-gbk"
  (interactive)
  (revert-buffer-with-coding-system 'chinese-gbk-dos))

; osx meta
(set 'mac-option-modifier 'super)
(set 'mac-command-modifier 'meta)

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
  (set-frame-size (selected-frame) 120 38))

; helm & projectile & speedbar
(require 'helm)
(global-set-key (kbd "M-x") 'helm-M-x)
(require 'projectile)
(projectile-mode t)
(set 'projectile-enable-caching t)
(require 'sr-speedbar)
;(set 'speedbar-use-images nil)
(set 'sr-speedbar-right-side nil)
(set 'sr-speedbar-width 28)
;(sr-speedbar-open)
(global-set-key (kbd "C-c t") 'sr-speedbar-toggle)

; evil mode
(require 'evil)
(evil-mode t)
(global-set-key (kbd "C-c e") 'evil-mode)
(define-key evil-normal-state-map (kbd "M-.") 'xref-find-definitions)
(define-key evil-normal-state-map "\C-]" "\M-.")
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(define-key evil-normal-state-map (kbd "gb") 'next-buffer)
(define-key evil-normal-state-map (kbd "gB") 'previous-buffer)

; org mode
(add-hook 'org-mode-hook
          (lambda () (modify-syntax-entry ?_ "w")))
(global-set-key (kbd "C-c a") 'org-agenda)
(set 'org-todo-keywords '((sequence "TODO" "TODAY" "DONE")))
(set 'org-agenda-files '("~/mind/freedom_as_autonomy/activity.org"))

; term mode
(require 'multi-term)
(evil-set-initial-state 'term-mode 'emacs)
(delete* "<ESC>" term-unbind-key-list :test 'equal)
(delete* '("C-p" . previous-line) term-bind-key-alist :test 'equal)
(delete* '("C-n" . next-line) term-bind-key-alist :test 'equal)
(delete* '("C-r" . isearch-backward) term-bind-key-alist :test 'equal)
(global-set-key (kbd "C-c m") 'multi-term)

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
(global-set-key (kbd "C-SPC") 'company-complete)

; gdb
(set 'gdb-show-main t)

; pinyin
;(require 'chinese-pyim)
;(set 'default-input-method "chinese-pyim")
;(global-set-key (kbd "C-M-SPC") 'toggle-input-method)

(provide 'init-basic)
