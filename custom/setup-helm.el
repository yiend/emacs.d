; setup-helm.el

(use-package helm
  :init
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-x b") 'helm-buffers-list))

(use-package helm-projectile
  :config
  (setq projectile-completion-system 'helm)
  (setq projectile-indexing-method 'alien))
  (helm-projectile-on)

(provide 'setup-helm)
