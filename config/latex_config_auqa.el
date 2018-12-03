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


(provide 'latex_config_aqua)


;(load "auctex.el" t)  ; The second arg to load is a flag to suppress errors
;(load "preview-latex.el" nil t t)
(require 'magic-latex-buffer)
(require 'ac-math)

(add-to-list 'ac-modes 'LaTeX-mode)   ; make auto-complete aware of `latex-mode`

(defun ac-latex-mode-setup ()         ; add ac-sources to default ac-sources
  (setq ac-sources
        (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
                ac-sources))
  )

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
(add-hook 'LaTex-mode-hook 'magic-latex-buffer)
(add-hook 'LaTex-mode-hook 'ac-latex-mode-setup)


(defun TeX-toggle-escape nil (interactive)
  "Toggle Shell Escape"
  (setq LaTeX-command
    (if (string= LaTeX-command "latex") "latex -shell-escape" "latex")))
(add-hook 'LaTeX-mode-hook
      (lambda nil
        (local-set-key (kbd "C-c C-t x") 'TeX-toggle-escape)))

(setq TeX-view-program-list
      '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -r %n %o %b")))

(if (string-equal "darwin" (symbol-name system-type))
    (setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
  
  )

(setq TeX-PDF-mode t)
(setq TeX-source-correlate-mode 'synctex)
(setq TeX-source-correlate-method 'synctex)
(setq TeX-engine 'xetex)
(global-linum-mode t)
;;(setq ispell-dictionary "en")
(global-auto-revert-mode 1)
(setq TeX-parse-self t) ; Enable parse on load.
(setq TeX-auto-save t) ; Enable parse on save.

(setq reftex-plug-into-AUCTeX t)


;(require 'auto-complete-auctex)
;(require 'auto-complete-auctex)
