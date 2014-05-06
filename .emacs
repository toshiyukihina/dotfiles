;; emacs setting
(transient-mark-mode 1)

;(setq-default tab-width 2)
(setq default-tab-width 2)
(setq-default indent-tabs-mode nil)

;; key bind
(global-set-key "\C-h" 'delete-backward-char)
(define-key global-map (kbd "C-]") 'anything)

;; package
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
(package-initialize)

;; anything
(require 'anything)
(require 'anything-config)
(add-to-list 'anything-sources 'anything-c-source-emacs-commands)

;; load path
(add-to-list 'load-path "~/.emacs.d/elisp")

;; Language and Coding System
;;(set-language-environment "Japanese")
;; (set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; (set-buffer-file-coding-system 'utf-8)
;; (setq default-buffer-file-coding-system 'utf-8)

;; linum setting
;(setq load-path (cons "~/.emacs.d" load-path))
;(require 'linum)
;(global-linum-mode)
;(setq linum-format "%4d ")

;; json-mode
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
(add-hook 'json-mode-hook 'electric-pair-mode)
(add-hook 'json-mode-hook '(lambda ()
                             (setq js-indent-level 2)
                             ))

;; Javascript setting
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook
          '(lambda ()
             (setq indent-tabs-mode nil)
             (setq js-indent-level 2)
             (setq js-expr-indent-offset 2)
             (setq js2-basic-offset 2)
             (setq js2-enter-indents-newline t)
             ))

;; Ruby mode
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))

(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(setq ruby-electric-expand-delimiters-list nil)

;; coffee
(defun coffee-custom ()
  "coffee-mode-hook"
  (set (make-local-variable 'tab-width) 2)
  (setq coffee-tab-width 2))

;; markdown mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; zencoding-mode
;; (require 'zencoding-mode)
;; (add-hook 'sgml-mode-hook 'zencoding-mode)
;; (define-key zencoding-mode-keymap (kbd "C-i") 'zencoding-expand-line)
;; (setq zencoding-indentation 2)

;;(put 'set-goal-column 'disabled nil)

;; git-gutter
(require 'git-gutter)

(global-git-gutter-mode t)
(add-hook 'ruby-mode-hook 'git-gutter-mode)

(setq git-gutter:modified-sign "    ") ;; two space
(setq git-gutter:added-sign "+")    ;; multiple character is OK
(setq git-gutter:deleted-sign "-")

(set-face-background 'git-gutter:modified "purple") ;; background color
(set-face-foreground 'git-gutter:added "green")
(set-face-foreground 'git-gutter:deleted "red")

(setq git-gutter:window-width 2)

;; theme
(require 'color-theme)
(load-theme 'misterioso t)
;(load-theme 'manoj-dark t)
;(load-theme 'deeper-blue t)
;(load-theme 'tango-dark t)
;(load-theme 'tsdh-dark t)
;(load-theme 'wombat t)
;(load-theme 'wheatgrass t)
