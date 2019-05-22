(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue?$" . vue-mode)) ;;web-mode for js/vue

;; Emmet-mode
(require 'emmet-mode)
(setq emmet-move-cursor-between-quotes t) ;; default nil
(setq emmet-expand-jsx-className? t) ;; default nil
(global-set-key "\C-j" 'emmet-expand-line)
(add-hook 'web-mode-hook  'emmet-mode)
