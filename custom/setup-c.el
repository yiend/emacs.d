; setup-c.el

(defun custom-c-mode ()
  "custom c-mode"
  (set 'indent-tabs-mode t)
  (set 'c-default-style "linux")
  (set 'c-basic-offset 4)
  (linum-mode)
  (hs-minor-mode)
  (set 'hs-hide-comments-when-hiding-all 1)
  (set 'hs-allow-nesting 1)
  (modify-syntax-entry ?_ "w")
  (ggtags-mode))
(add-hook 'c-mode-hook 'custom-c-mode)
(add-hook 'c++-mode-hook 'custom-c-mode)
(add-hook 'sh-mode-hook 'custom-c-mode)

(provide 'setup-c)
