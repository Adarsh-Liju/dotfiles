;; Initialize package.el
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(setq package-check-signature nil)

;; Install 'use-package' if not installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Configure 'use-package'
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

;; Enable flycheck for real-time syntax checking
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

;; Enable auto-completion with company-mode
(use-package company
  :ensure t
  :init
  (global-company-mode))

;; Set up Yasnippet for code snippets
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

;; Use IPython for better Python shell
(setq python-shell-interpreter "ipython3"
      python-shell-interpreter-args "-i --simple-prompt")

;; Set the default indentation for Python
(setq-default python-indent 4)

;; Enable LSP for Python
(use-package lsp-mode
  :ensure t
  :commands lsp
  :config
  (add-hook 'python-mode-hook #'lsp))

;; LSP client for Python (Microsoft's LSP implementation)
(use-package lsp-python-ms
  :ensure t
  :config
  (setq lsp-python-ms-executable (executable-find "python-language-server")))

;; Key bindings
(global-set-key (kbd "<f8>") 'elpy-shell-switch-to-shell)

;; Enable line numbers
(global-display-line-numbers-mode t)

;; Highlight matching parentheses
(show-paren-mode 1)

;; Customization for better readability
(set-face-attribute 'default nil :font "Source Code Pro-16")

;; Change the theme (you can choose your preferred theme)

(load-theme 'dracula t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(dracula-theme org-pomodoro org-bullets format-all evil gruvbox-theme flycheck elpy use-package)))

(setq inhibit-startup-screen t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)

(use-package format-all
  :preface
  (defun ian/format-code ()
    "Auto-format whole buffer."
    (interactive)
    (if (derived-mode-p 'prolog-mode)
        (prolog-indent-buffer)
      (format-all-buffer)))
  :config
  (global-set-key (kbd "M-F") #'ian/format-code)
  (add-hook 'prog-mode-hook #'format-all-ensure-formatter))

;; Install 'org' if not installed
(unless (package-installed-p 'org)
  (package-refresh-contents)
  (package-install 'org))

;; Enable Org Mode
(require 'org)

;; Enable Org Babel for code blocks in Org Mode
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)   ; enable Python code execution in Org Mode
   (emacs-lisp . t) ; enable Emacs Lisp code execution in Org Mode
   ;; Add more languages as needed
   ))

;; Set the default header arguments for code blocks
(setq org-babel-default-header-args
      '((:session . "none")   ; use a separate session for each code block
        (:results . "replace") ; replace the previous results when re-running
        (:exports . "both")    ; export both code and results
        (:cache . "no")        ; disable caching for code block evaluation
        (:noweb . "t")))       ; enable noweb expansion in code blocks


;; Install 'org-bullets' for better Org Mode bullet points
(use-package org-bullets
  :ensure t
  :hook (org-mode . org-bullets-mode))
