; setup-helm.el

(use-package helm
  :init
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-x b") 'helm-buffers-list)
  :config
  (define-key helm-map "\t" 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-<tab>") 'helm-select-action))

(use-package helm-projectile
  :config
  (setq projectile-completion-system 'helm)
  (setq projectile-indexing-method 'alien))
  (helm-projectile-on)

(use-package helm-gtags)

(provide 'setup-helm)
