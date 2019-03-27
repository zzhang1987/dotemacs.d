(use-package powerline
  :ensure t
  :config (powerline-default-theme))

(use-package nyan-mode
  :ensure t
  :config
  (nyan-mode))

(if (eq system-type 'gnu/linux)
    (use-package rainbow-identifiers
      :ensure t
      :config (add-hook 'prog-mode-hook 'rainbow-identifiers-mode))
    )



;; Dash board
;; Or if you use use-package
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

;(message system-type)


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


(setq mode-icons-change-mode-name nil)

(use-package nova-theme
  :ensure t)

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (load-theme 'nova t)
                  (set-frame-font "Fira Code-14")
                  )
                )             
              )
  (load-theme 'oceanic t)
  (set-frame-font "Fira Code-14")
  )
