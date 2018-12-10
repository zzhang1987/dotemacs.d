(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi)
  (define-key python-mode-map (kbd "M-.") 'jedi:goto-definition)
  (define-key python-mode-map (kbd "<f5>") 'realgud:pdb)
  )
(use-package py-autopep8
  :ensure t
  :config
  (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
  (setq py-autopep8-options '("--ignore E402")))
(use-package company-jedi
  :ensure t
  )
(add-hook 'python-mode-hook 'my/python-mode-hook)
(add-hook 'python-mode-hook 'flycheck-mode)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--simple-prompt -i")
