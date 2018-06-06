(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'nil)

;; Default shell should be fish
(setq explicit-shell-file-name "/usr/local/bin/fish")

;; Remove scrollbar
;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Emacs server auto start
(server-start)
