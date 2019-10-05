(provide 'hist_related)

;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;      setup history of edited file
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(savehist-mode 1)
(setq savehist-file "~/.emacs.d/.savehist")
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
        search-ring
        regexp-search-ring))

;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;      Powerful undo system for emacs
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package undo-tree
  :ensure t
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)
    ))

;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;      Show recent file
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package recentf
  :config
  (progn
    (setq recentf-max-saved-items 200
          recentf-max-menu-items 15)
    (recentf-mode)
    ))
