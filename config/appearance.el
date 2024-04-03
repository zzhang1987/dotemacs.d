(provide 'appearance)

(use-package powerline
  :straight t
  :config (powerline-default-theme))

(use-package nyan-mode
  :straight t
  :config
  (nyan-mode))

(if (eq system-type 'gnu/linux)
    (use-package rainbow-identifiers
      :straight t
      :config (add-hook 'prog-mode-hook 'rainbow-identifiers-mode))
    )
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;      Show line number of current coding window
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package linum
  :straight t
  :config
  (setq linum-format 'dynamic)
  (global-linum-mode 1)
  )




;; Dash board
;; Or if you use use-package
(use-package dashboard
  :straight t
  :config
  (dashboard-setup-startup-hook))

;(message system-type)


(setq dashboard-items '((recents  . 15)
                        (agenda . 5)
                        (bookmarks . 5)
                        (projects . 5)
			))

;; (use-package tabbar
;;   :straight tabbar
;;   :config
;;   (tabbar-mode 'nil)
;;   )


(use-package all-the-icons
  :straight t
  )


(setq mode-icons-change-mode-name nil)

;; (use-package afternoon-theme
;;   :straight t)

(use-package material-theme
  :straight t)


(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (load-theme 'material t)
                  (set-frame-font "MesloLGLDZ Nerd Font-14")
                  (if (eq system-type 'darwin)
                      (set-frame-font "MesloLGLDZ Nerd Font-14")
                      )
                  )
                )             
              )
  (use-package zenburn-theme
    :straight t)
  (load-theme 'zenburn t)
  (set-frame-font "MesloLGLDZ Nerd Font-14")
  (if (eq system-type 'darwin)
                      (set-frame-font "MesloLGLDZ Nerd Font-12")
                      )
  
  )
(load-theme 'zenburn t)

(add-to-list 'default-frame-alist
             '(font . "MesloLGLDZ Nerd Font-14"))

(if (eq system-type 'darwin)
    
    (add-to-list 'default-frame-alist
                 '(font . "MesloLGLDZ Nerd Font-12"))
  )

(use-package all-the-icons
  :straight t)


(use-package zenburn-theme
  :straight t
  :config
  (load-theme 'zenburn t))

(use-package neotree
  :straight t
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
(set-frame-parameter (selected-frame) 'alpha '(95 95))
(add-to-list 'default-frame-alist '(alpha 95 95))
