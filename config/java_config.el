(provide 'java_config)
(require 'cc-mode)
(use-package treemacs :straight t)



(use-package dap-mode
  :straight t :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(use-package dap-java :after (lsp-java))


(use-package gradle-mode
  :straight t
  :config (add-hook 'java-mode-hook '(lambda() (gradle-mode 1))))
