; setup-ycmd.el

(use-package ycmd
  :init
  (set-variable 'ycmd-server-command '("python" "/opt/ycmd/ycmd"))
  (set-variable 'ycmd-global-config "~/.ycm_extra_conf.py")
  (set-variable 'ycmd-extra-conf-handler 'load)
  (add-hook 'c-mode-hook 'ycmd-mode)
  (add-hook 'c++-mode-hook 'ycmd-mode)
  (evil-leader/set-key "jd" 'ycmd-goto-declaration)
  (evil-leader/set-key "jD" 'ycmd-goto-definition))

(use-package company-ycmd)
(company-ycmd-setup)

(use-package flycheck-ycmd)
(flycheck-ycmd-setup)

(provide 'setup-ycmd)
