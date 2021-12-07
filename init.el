(setq mac-command-modifier 'meta)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("d0ebd553aa00983952185f9d0e1a004967614d7c75fc8547f1b9af1f26b77dfc" default))
 '(package-selected-packages
   '(melancholy-theme treemacs-perspective perspective treemacs-all-the-icons all-the-icons treemacs-persp treemacs-magit treemacs-icons-dired treemacs-projectile treemacs-evil treemacs cfrs ht hydra pfuture ace-window s dash yasnippet-snippets yasnippet-lean yasnippet-classic-snippets math-symbols ac-math auto-complete-auctex let-alist org-pdftools latex-preview-pane pdf-tools auctex))
 '(pdf-tools-handle-upgrades nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#333333" :foreground "#DEDEDE" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "nil" :family "Helvetica")))))
(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin/"))
(setq exec-path (append exec-path '("/Library/TeX/texbin/")))
(setenv "PKG_CONFIG_PATH" "/usr/local/Cellar/zlib/1.2.11/lib/pkgconfig:/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig")


(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))



(use-package pdf-tools
      :ensure t
      :config
      (custom-set-variables
        '(pdf-tools-handle-upgrades nil)) ; Use brew upgrade pdf-tools instead.
     (setq pdf-info-epdfinfo-program "/usr/local/bin/epdfinfo"))
     (pdf-tools-install)


(use-package treemacs
	:demand t
  :config
	(setq treemacs-follow-after-init t
				treemacs-is-never-other-window t
				treemacs-width 35)
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (treemacs-git-mode 'simple)
	(treemacs-fringe-indicator-mode t)
	:hook (after-init . treemacs)
	:bind
  (:map global-map
        ("C-M-t"   . treemacs)))

(require 'package)

(require 'auto-complete-config)
(ac-config-default)

;; Activate auto-complete for latex modes (AUCTeX or Emacs' builtin one).
(add-to-list 'ac-modes 'latex-mode)

;; Activate ac-math.
(eval-after-load "latex"
  '(when (featurep 'auto-complete)
     ;; See https://github.com/vspinu/ac-math
     (require 'ac-math)
     (defun ac-latex-mode-setup ()       ; add ac-sources to default ac-sources
       (setq ac-sources
         (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
             ac-sources)))
     (add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)))

(add-to-list 'default-frame-alist '(height . 70))
(add-to-list 'default-frame-alist '(width . 220))

(set-face-attribute 'default nil :height 200)



(load-theme 'melancholy)
(require 'latex-preview-pane)
(latex-preview-pane-enable)
