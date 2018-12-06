(use-package powerline
  :ensure t
  :config (powerline-default-theme))

(use-package nyan-mode
  :ensure t
  :config
  (nyan-mode))

(use-package rainbow-identifiers
  :ensure t
  :config (add-hook 'prog-mode-hook 'rainbow-identifiers-mode))


;; Dash board
;; Or if you use use-package
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))


(setq dashboard-items '((recents  . 15)
                        (agenda . 5)
                        (bookmarks . 5)
                        (projects . 5)
			))

(use-package tabbar
  :ensure tabbar
  :config
  (tabbar-mode 'nil)
  )

(use-package all-the-icons
  :ensure t
  )
(use-package material-theme
  :ensure t
  :config (load-theme 'material t))

(setq mode-icons-change-mode-name nil)
