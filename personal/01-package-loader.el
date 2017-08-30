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

(set-frame-font "Source Code Pro-15")

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


;; Go mode hack to get renaming to work
(setq go-projectile-switch-gopath 'never)
(setenv "GOPATH" "/Users/jonas/src/go/")

;; Magithub
;;(require 'magithub)
;;(magithub-feature-autoinject t)

;; Mode icons
(mode-icons-mode)

;;  Ace isearch
(global-ace-isearch-mode +1)

(setq tramp-default-method "ssh")

;; Avy-zap-to-char
(global-set-key "\M-z" 'avy-zap-to-char)

;; Javascript stuff
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
                           (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
