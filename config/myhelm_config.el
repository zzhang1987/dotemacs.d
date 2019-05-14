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

(use-package helm-bibtex
  :ensure t
  :after helm
  :config
  (setq bibtex-completion-bibliography
        '("~/Proj/references/main.bib"))
  (setq bibtex-completion-library-path
        '("~/Proj/references/pdfs"))
  (setq bibtex-completion-pdf-field "File")
  )

(use-package swiper-helm
  :ensure t
  :after helm
  :config
  (global-set-key (kbd "C-s") 'swiper-helm)
)
