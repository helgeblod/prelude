;; Dash documentation
(global-set-key "\C-cø" 'dash-at-point)
(global-set-key "\C-cm" 'dash-at-point-with-docset)

(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; Theme
(load-theme 'sanityinc-tomorrow-night t)
(set-face-attribute 'region nil :background "#c5c8c6") ;; Set more visible highlight color

;; Clean up unused buffers from time to time
(require 'midnight)

(set-frame-font "Source Code Pro-14")

;; Disable spellcheck
(setq prelude-flyspell nil)

(require 'helm-config)
(setq helm-locate-command
      (case system-type
        ('gnu/linux "locate -i -r %s")
        ('berkeley-unix "locate -i %s")
        ('windows-nt "es %s")
        ('darwin "mdfind -name %s %s")
        (t "locate %s")))

;; Faster grep searching using ripgrep
(setq helm-grep-ag-command "rg --color=always --smart-case --no-heading --line-number %s %s %s")

;; Use OS X mdfind to locate files
(setq locate-command "mdfind")
(global-set-key "\C-x\C-g" 'helm-locate)

;; Goto line number
(global-set-key "\C-c\C-g" 'goto-line)

;; Vis ett vindu
(global-set-key "\C-xx" 'delete-other-windows)

;; Turn off arrow key navigation
(setq guru-warn-only nil)

(require 'rspec-mode)
'(rspec-spec-command "rspec --format documentation")
'(rspec-use-rake-flag nil)
'(rspec-use-rake-when-possible nil)

;; Cache
(setq projectile-enable-caching t)

;; Dumb jump
(dumb-jump-mode)

;; Emmet-mode
(require 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(setq emmet-move-cursor-between-quotes t) ;; default nil
(setq emmet-expand-jsx-className? t) ;; default nil
(global-set-key "\C-j" 'emmet-expand-line)

;; Web-mode on js-files
(setq web-mode-content-types-alist
      '(("jsx" . "\\.js[x]?\\'")))

;; Magithub
;;(require 'magithub)
;;(magithub-feature-autoinject t)

;; Mode icons
(mode-icons-mode)

;;  Ace isearch
(global-ace-isearch-mode +1)

;; Avy-zap-to-char
(global-set-key "\M-z" 'avy-zap-to-char)
