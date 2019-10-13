(defun my/python-mode-hook ()
  ;; (add-to-list 'company-backends 'company-jedi)
  ;; (define-key python-mode-map (kbd "M-.") 'jedi:goto-definition)
  (define-key python-mode-map (kbd "C-c <f5>") 'realgud:pdb)
  (add-hook 'python-mode-hook 'flycheck-mode)
  (add-hook 'python-mode-hook 'hs-minor-mode)
  )

(use-package python-docstring
  :ensure t
  :config
  (add-hook 'python-mode-hook 'python-docstring-mode)
  )



(use-package py-yapf
  :ensure t
  :config (add-hook 'python-mode-hook 'py-yapf-enable-on-save))


(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--simple-prompt -i")
(add-hook 'python-mode-hook 'my/python-mode-hook)
(add-hook 'python-mode-hook (lambda ()
                              (python-docstring-mode 1)))


(use-package dap-python :after (lsp-python))
