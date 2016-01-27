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
(setq helm-input-idle-delay 0.2)
;;  (helm-mode t)
(setq helm-locate-command
      (case system-type
        ('gnu/linux "locate -i -r %s")
        ('berkeley-unix "locate -i %s")
        ('windows-nt "es %s")
        ('darwin "mdfind -name %s %s")
        (t "locate %s")))

;; Use OS X mdfind to locate files
(setq locate-command "mdfind")
(global-set-key "\C-x\C-g" 'helm-locate)

;; Goto line number
(global-set-key "\C-c\C-g" 'goto-line)

;; Org mod
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done 'time)
(setq org-agenda-files (list "~/org/work.org"))
(setq org-todo-keyword-faces
      '(;;("BACKLOG" . (:foreground "DarkOrange1" :weight bold))
        ("DOING" . (:foreground "spring green" :weight bold))
        ;;("BLOCKED" . (:foreground "tomato"))
        ("DONE" . (:foreground "light sea green"))
        ))
(setq org-todo-keywords
      '((sequence "BACKLOG" "DOING" "BLOCKED" "DONE")))
(defun my-org-archive-done-tasks ()
  (interactive)
  (org-map-entries 'org-archive-subtree "/DONE" 'file))

;; iEdit
(define-key global-map (kbd "C-;") 'iedit-mode)

;; Vis ett vindu
(global-set-key "\C-xx" 'delete-other-windows)

;; Turn off arrow key navigation
;;(setq guru-warn-only nil)
(require 'rspec-mode)
'(rspec-spec-command "rspec --format documentation")
'(rspec-use-rake-flag nil)
'(rspec-use-rake-when-possible nil)

(defun copy-current-line-position-to-clipboard ()
  "Copy current line in file to clipboard as '</path/to/file>:<line-number>'"
  (interactive)
  (let ((path-with-line-number
         (concat (buffer-file-name) ":" (number-to-string (line-number-at-pos)))))
    (x-select-text path-with-line-number)
    (message (concat path-with-line-number " copied to clipboard"))))
(global-set-key "\C-xw" 'copy-current-line-position-to-clipboard)

;; Cache
(setq projectile-enable-caching t)
