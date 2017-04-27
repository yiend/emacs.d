(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(set 'org-agenda-files '("~/mind/freedom_as_autonomy/activity.org"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (projectile chinese-pyim-greatdict chinese-pyim magit evil-leader evil color-theme-solarized ##))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; install any packages in yiend-packages, if they are not installed already
(set 'yiend-packages '(color-theme
                       color-theme-solarized
                       evil
                       evil-leader
                       ycmd
                       company-ycmd
                       flycheck-ycmd
                       projectile
                       ))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (pkg yiend-packages)
  (when (and (not (package-installed-p pkg))
             (assoc pkg package-archive-contents))
    (package-install pkg)))

;(let (refreshed)
;  (when (not package-archive-contents)
;    (package-refresh-contents)
;    (setq refreshed t))
;  (dolist (pkg yiend-packages)
;    (when (and (not (package-installed-p pkg))
;               (assoc pkg package-archive-contents))
;      (unless refreshed
;        (package-refresh-contents)
;        (setq refreshed t))
;      (package-install pkg))))

;; load lisp/init-basic.el
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-basic)

(provide 'init)
