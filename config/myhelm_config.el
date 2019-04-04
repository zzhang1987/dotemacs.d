(use-package helm-config
  :ensure helm
  :config
  (helm-mode 1)
  (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
  )


(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on)
  )

