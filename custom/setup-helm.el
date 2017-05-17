; setup-helm.el

(use-package helm
  :init
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-x b") 'helm-buffers-list)
  :config
  (helm-mode)
  (setq helm-prevent-escaping-from-minibuffer t
        helm-bookmark-show-location t
        ;helm-split-window-in-side-p t
        ;helm-echo-input-in-header-line t
        helm-ff-skip-boring-files t
        helm-find-files-doc-header nil
        helm-always-two-windows t
        helm-display-header-line nil)
  (setq helm-autoresize-min-height 10)
  (helm-autoresize-mode t)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  (define-key helm-find-files-map (kbd "<backtab>") 'helm-find-files-up-one-level)
  (define-key helm-find-files-map (kbd "S-<tab>") 'helm-find-files-up-one-level)
  (define-key helm-find-files-map (kbd "C-<tab>") 'helm-select-action))

(use-package helm-projectile
  :config
  (setq projectile-completion-system 'helm)
  (setq projectile-indexing-method 'alien))
  (helm-projectile-on)

(use-package helm-gtags)

(provide 'setup-helm)
