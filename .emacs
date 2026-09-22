;;; -*- lexical-binding: t -*-

(setq custom-file "~/.emacs.custom.el")
(load-file custom-file)

(add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font"))

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(global-display-line-numbers-mode 1)
(pixel-scroll-precision-mode 1)

(setq make-backup-files nil
      auto-save-default nil
      create-lockfiles nil)

(setq warning-suppress-types '((files)))

;;; MELPA + use-package

(require 'package)
(setq package-archives
      '(("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa"  . "https://melpa.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;;; Completion

(use-package which-key
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.4))

(use-package vertico
  :init (vertico-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
  :init (marginalia-mode))

(use-package consult
  :bind (("C-s"   . consult-line)
         ("C-x b" . consult-buffer)
         ("M-y"   . consult-yank-pop)
         ("M-g g" . consult-goto-line)
         ("M-g i" . consult-imenu)
         ("C-x p b" . consult-project-buffer)))

(use-package magit
  :bind ("C-x g" . magit-status))

;;; ------------------------------------------------------------
;;; To-do list (Org)
;;; File: ~/org/todo.org
;;; ------------------------------------------------------------
(setq org-directory (expand-file-name "~/org")
      org-default-notes-file (expand-file-name "todo.org" org-directory)
      org-agenda-files (list org-directory)
      org-startup-indented t
      org-log-done 'time
      org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "WAIT(w)" "|" "DONE(d)" "CANCEL(c)")))

(unless (file-directory-p org-directory)
  (make-directory org-directory t))
(unless (file-exists-p org-default-notes-file)
  (with-temp-file org-default-notes-file
    (insert "#+TITLE: Tasks\n\n* Inbox\n")))

(setq org-capture-templates
      '(("t" "Todo" entry
         (file+headline org-default-notes-file "Inbox")
         "* TODO %?\n  %u\n")
        ("n" "Note" entry
         (file+headline org-default-notes-file "Inbox")
         "* %?\n  %u\n")))

(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
(global-set-key (kbd "C-c t") (lambda ()
                                (interactive)
                                (find-file org-default-notes-file)))

;;; ------------------------------------------------------------
;;; LSP: eglot (Rust / Python / C)
;;; Servers on PATH: rust-analyzer, basedpyright|pyright|pylsp, clangd
;;; ------------------------------------------------------------
(use-package rust-mode
  :mode "\\.rs\\'")

(use-package python
  :ensure nil
  :mode ("\\.py\\'" . python-mode))

(use-package cc-mode
  :ensure nil
  :mode (("\\.c\\'" . c-mode)
         ("\\.h\\'" . c-mode)
         ("\\.cpp\\'" . c++-mode)
         ("\\.hpp\\'" . c++-mode)))

(use-package eglot
  :ensure nil
  :hook ((rust-mode . eglot-ensure)
         (python-mode . eglot-ensure)
         (c-mode . eglot-ensure)
         (c++-mode . eglot-ensure))
  :bind (:map eglot-mode-map
              ("C-c l r" . eglot-rename)
              ("C-c l a" . eglot-code-actions)
              ("C-c l f" . eglot-format-buffer)
              ("C-c l h" . eldoc-doc-buffer)
              ("C-c l q" . eglot-shutdown))
  :config
  ;; Prefer basedpyright, then pyright, then pylsp
  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
                 '(python-mode . ("basedpyright-langserver" "--stdio")))
    (add-to-list 'eglot-server-programs
                 '(rust-mode . ("rust-analyzer")))
    (add-to-list 'eglot-server-programs
                 '((c-mode c++-mode) . ("clangd")))))

(use-package company
  :commands (company-complete company-complete-common)
  :bind (("C-M-i" . company-complete)
         ("M-/"   . company-complete))
  :custom
  (company-idle-delay nil)
  (company-minimum-prefix-length 1)
  (company-tooltip-align-annotations t)
  :config
  (global-company-mode 1))

(setq tab-always-indent 'complete)

(use-package flymake
  :ensure nil
  :hook (prog-mode . flymake-mode)
  :bind (("C-c ! n" . flymake-goto-next-error)
         ("C-c ! p" . flymake-goto-prev-error)
         ("C-c ! l" . flymake-show-buffer-diagnostics)))
