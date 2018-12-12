
(defun my/python-mode-hook ()
  ;; (add-to-list 'company-backends 'company-jedi)
  ;; (define-key python-mode-map (kbd "M-.") 'jedi:goto-definition)
  (define-key python-mode-map (kbd "<f5>") 'realgud:pdb)
  (add-hook 'python-mode-hook 'flycheck-mode)
  )
(use-package py-autopep8
  :ensure t
  :config
  (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
  (setq py-autopep8-options '("--ignore E402")))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/ms-python/"))
(require 'ms-python)
(setq ms-python-server-install-dir "~/source/python-language-server/output/bin/Release/")

(add-hook 'python-mode-hook #'lsp)

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--simple-prompt -i")
