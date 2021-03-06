(provide 'appearance)

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
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;      Show line number of current coding window
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package linum
  :ensure t
  :config
  (setq linum-format 'dynamic)
  (global-linum-mode 1)
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

;; (use-package tabbar
;;   :ensure tabbar
;;   :config
;;   (tabbar-mode 'nil)
;;   )


(use-package all-the-icons
  :ensure t
  )


(setq mode-icons-change-mode-name nil)

;; (use-package afternoon-theme
;;   :ensure t)

(use-package material-theme
  :ensure t)


(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (load-theme 'material t)
                  (set-frame-font "Source Code Pro-13")
                  (if (eq system-type 'darwin)
                      (set-frame-font "Source Code Pro-13")
                      )
                  )
                )             
              )
  (load-theme 'material t)
  (set-frame-font "Source Code Pro-13")
  (if (eq system-type 'darwin)
                      (set-frame-font "Source Code Pro-13")
                      )
  
  )

(add-to-list 'default-frame-alist
             '(font . "Source Code Pro-13"))

(if (eq system-type 'darwin)
    (add-to-list 'default-frame-alist
                 '(font . "Source Code Pro-13"))
  )

(use-package all-the-icons
  :ensure t)

(use-package neotree
  :ensure t
  :config (progn
    (setq neo-smart-open t)
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
    (setq neo-window-fixed-size nil)
    (setq-default neo-show-hidden-files t)
    (global-set-key [f2] 'neotree-refresh)
    (global-set-key [f8] 'neotree-toggle))
  )

;; (use-package awesome-tab
;;   :load-path "~/.emacs.d/site-lisp/awesome-tab/"
;;   :config (awesome-tab-mode t)
;;   (awesome-tab-build-helm-source))

;; set transparency
(set-frame-parameter (selected-frame) 'alpha '(85 85))
(add-to-list 'default-frame-alist '(alpha 85 85))
