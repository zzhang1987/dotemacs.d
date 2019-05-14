
(require 'cc-mode)
(use-package treemacs :ensure t)



(use-package dap-mode
  :ensure t :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(use-package dap-java :after (lsp-java))


(use-package gradle-mode
  :ensure t
  :config (add-hook 'java-mode-hook '(lambda() (gradle-mode 1))))
