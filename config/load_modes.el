(provide 'load_modes)

;;;; This snippet enables lua-mode
;; This line is not necessary, if lua-mode.el is already on your load-path
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))


;;Markdown mode
(use-package markdown-mode
  :straight t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package vimish-fold
  :straight t
  :config
  (vimish-fold-global-mode 1))

(use-package nginx-mode
  :straight t)
