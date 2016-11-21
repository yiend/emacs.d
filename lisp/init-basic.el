; basic.el

; font & color-theme
(set-default-font "Menlo-13")
(require 'color-theme)
(require 'color-theme-solarized)
(load-theme 'solarized t)
(enable-theme 'solarized)

; code style
(global-linum-mode t)
(setq indent-tabs-mode t)
(setq default-tab-width 4)
(setq tab-width 4)

; frame | gui
(menu-bar-mode t)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(when window-system
  (set-frame-size (selected-frame) 108 34))

; evil mode
(require 'evil)
(evil-mode t)

(provide 'init-basic)
