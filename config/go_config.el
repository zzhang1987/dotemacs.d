(provide 'go_config)

(use-package go-mode
  :straight t
  :config
  (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
  (add-hook 'go-mode-hook 'lsp-deferred)
  )
