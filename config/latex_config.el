;;; latex.el --- 
;;
;; Copyright (C) 2014 Zhen Zhang
;;
;; Author: Zhen Zhang <zhen@zzhang.org>
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see http://www.gnu.org/licenses/.

;;; Commentary:
;;
;; 

;;; Code:
(provide 'latex_config)


(use-package latex
  :ensure auctex
  :mode
  ("\\.tex\\'" . latex-mode)
  :bind
  (:map LaTeX-mode-map
        ("M-<delete>" . TeX-remove-macro)
        ("C-c C-r" . reftex-query-replace-document)
        ("C-c C-g" . reftex-grep-document))
  :init
  ;; A function to delete the current macro in AUCTeX.
  ;; Note: keybinds won't be added to TeX-mode-hook if not kept at the end of the AUCTeX setup!
  (defun TeX-remove-macro ()
    "Remove current macro and return TRUE, If no macro at point, return Nil."
    (interactive)
    (when (TeX-current-macro)
      (let ((bounds (TeX-find-macro-boundaries))
            (brace  (save-excursion
                      (goto-char (1- (TeX-find-macro-end)))
                      (TeX-find-opening-brace))))
        (delete-region (1- (cdr bounds)) (cdr bounds))
        (delete-region (car bounds) (1+ brace)))
      t))
  :config
  (use-package magic-latex-buffer
    :ensure t)

  (add-hook 'LaTeX-mode-hook 'visual-line-mode)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
  (add-hook 'LaTeX-mode-hook 'auto-fill-mode)
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  ;;(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
  (add-hook 'LaTex-mode-hook 'magic-latex-buffer)
  
  (defun TeX-toggle-escape nil (interactive)
         "Toggle Shell Escape"
         (setq LaTeX-command
               (if (string= LaTeX-command "latex") "latex -shell-escape" "latex")))
  (add-hook 'LaTeX-mode-hook
	    (lambda nil
	      (local-set-key (kbd "C-c C-t x") 'TeX-toggle-escape)))
  
  (use-package pdf-tools
    :ensure t
    :config 

    ;; Use pdf-tools to open PDF files
    (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
          TeX-source-correlate-start-server t)

    ;; Update PDF buffers after successful LaTeX runs
    (add-hook 'TeX-after-compilation-finished-functions
              #'TeX-revert-document-buffer)
    (add-hook 'LaTeX-mode-hook 'pdf-tools-install))
  
  (if (string-equal "darwin" (symbol-name system-type))
      
      (setq TeX-view-program-list
            '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))
    
    )
  (if (string-equal "darwin" (symbol-name system-type))
      (setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
    )
  (when (eq system-type 'windows-nt)
    
    (setq TeX-view-program-list
          '(("Sumatra PDF" ("\"c:/Emacs/bin/SumatraPDF.exe\" -reuse-instance"
                            (mode-io-correlate " -forward-search %b %n ") " %o"))))

    (eval-after-load 'tex
      '(progn
         (assq-delete-all 'output-pdf TeX-view-program-selection)
         (add-to-list 'TeX-view-program-selection '(output-pdf "Sumatra PDF")))
      )
    
    (setq TeX-view-program-selection '((output-pdf "Sumatra PDF")))
    )
=======
>>>>>>> 2d0a0d49ca1554f7cb657db06a49a090530e7759
  (setq TeX-PDF-mode t)
  (setq TeX-source-correlate-mode 'synctex)
  (setq TeX-source-correlate-method 'synctex)
  ;; (setq TeX-engine 'xetex)
  ;; (setq TeX-source-correlate-method 'source-specials)
  ;; (setq TeX-source-correlate-mode t)
  (setq TeX-source-correlate-start-server t)
  ;; (setq tex-dvi-view-command "xdvi -editor 'emacsclient -a emacs --no-wait +%l %f'")

  (global-auto-revert-mode 1)
  (setq TeX-parse-self t) ; Enable parse on load.
  (setq TeX-auto-save t) ; Enable parse on save.

  (setq reftex-plug-into-AUCTeX t)


  (use-package auctex-latexmk
    :ensure t
    :config
    (auctex-latexmk-setup)
    (setq auctex-latexmk-inherit-TeX-PDF-mode t)
    )
  (use-package gscholar-bibtex
    :ensure t)
  (use-package pdf-tools
    :ensure t
    :config 

    ;; Use pdf-tools to open PDF files
    ;; (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
    ;;       TeX-source-correlate-start-server t)

    (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
          TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
          TeX-source-correlate-start-server t)
    
    ;; Update PDF buffers after successful LaTeX runs
    (add-hook 'TeX-after-compilation-finished-functions
              #'TeX-revert-document-buffer)
    (add-hook 'LaTeX-mode-hook 'pdf-tools-install))
  
  )



