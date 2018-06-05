;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; use web-mode for .vue files
(add-to-list 'auto-mode-alist '("\\.vue$" . web-mode))

(eval-after-load 'js2-mode
  '(add-hook 'js2-mode-hook (lambda () (add-hook 'after-save-hook 'eslint-fix nil t))))

(eval-after-load 'web-mode
f  '(add-hook 'web-mode-hook (lambda () (add-hook 'after-save-hook 'eslint-fix nil t))))



;; ;; adjust indents for web-mode to 2 spaces
;; (defun my-web-mode-hook ()
;;   "Hooks for Web mode. Adjust indents"
;;   ;;; http://web-mode.org/
;;   (setq web-mode-markup-indent-offset 2)
;;   (setq web-mode-css-indent-offset 2)
;;   (setq web-mode-code-indent-offset 2))
;; (add-hook 'web-mode-hook  'my-web-mode-hook)


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
