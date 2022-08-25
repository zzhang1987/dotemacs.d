(provide 'markdown_config)

(defun my/md-mode-hook ()
  (define-key markdown-map "<f6>" 'math-preview-all)
  (define-key markdown-map "<f7>" 'math-preview-clear-all)
)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode))
  :init (setq markdown-command "/usr/bin/pandoc --mathjax"))

(add-hook 'markdown-mode-hook 'my/md-mode-hook)
(use-package simple-httpd
  :ensure t
  :config
  (setq httpd-port 7070)
  :init (setq httpd-root "~/www"))


(defun markdown-filter (buffer)
  (princ
   (with-temp-buffer
     (let ((tmp (buffer-name)))
       (set-buffer buffer)
       (set-buffer (markdown tmp))
       (format "<!DOCTYPE html><html><title>Markdown preview</title><link rel=\"stylesheet\" href = \"/github-markdown.css\"/>
<body><article class=\"markdown-body\" style=\"box-sizing: border-box;min-width: 200px;max-width: 800px;margin: 0 auto;padding: 45px;\">%s</article></body><script src=\"/mathjax/es5/tex-chtml-full.js\"></script></html>" (buffer-string))))
   (current-buffer)))

(defun markdown-live-preview ()
  "Preview markdown."
  (interactive)
  (unless (process-status "httpd")
    (httpd-start))
  (impatient-mode)
  (imp-set-user-filter 'my-markdown-filter)
  (imp-visit-buffer))
