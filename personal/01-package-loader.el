;; Dash documentation
(global-set-key "\C-cø" 'dash-at-point)
(global-set-key "\C-cm" 'dash-at-point-with-docset)

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

;; Avy-zap-to-char
(global-set-key "\M-z" 'avy-zap-to-char)

;; Ask before quit
(setq confirm-kill-emacs 'y-or-n-p)

;; Markdown mode should enable writeroom
(add-hook 'markdown-mode-hook 'writeroom-mode)

;; Hide most info in the mode-line


(setq-default mode-line-format '("%e "
                                 (format "%s " mode-name)
                                 " %* %b ܃ "
                                 (:eval
                                  (if (use-region-p)
                                      (if (eq (point) (region-beginning))
                                          (format "%%l … %d" (line-number-at-pos (region-end)))
                                        (format "%d … %%l" (line-number-at-pos (region-beginning))))
                                    "%l "))
                                 ))
;; Mode icons
(mode-icons-mode)

;; TLS fix
(require 'gnutls)
(add-to-list 'gnutls-trustfiles "/usr/local/etc/openssl/cert.pem")
