(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; Default shell should be fish
(setq explicit-shell-file-name "/usr/local/bin/fish")

;; Remove scrollbar
(scroll-bar-mode -1)

;; Emacs server auto start
(server-start)
