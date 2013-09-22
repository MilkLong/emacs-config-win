;; Auther: JerryZhang
;; E-mail: chinajiezhang@gmail.com
;; Blog: http://www.perfect-is-shit.com

;; base setting
(setq frame-title-format "%f")
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq x-select-enable-clipboard t)
(scroll-bar-mode nil)
(tool-bar-mode nil)
(global-visual-line-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(blink-cursor-mode -1)
(setq default-major-mode 'text-mode)
(show-paren-mode t)
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;; Setting English Font
(set-face-attribute
  'default nil :font "Droid Sans Mono 10")
  
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Microsoft YaHei" :size 13)))

(require 'ido)
(ido-mode t)

;; turn autoindenting on
(global-set-key "\r" 'newline-and-indent)


;; color-theme
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
(color-theme-gray30)
(global-hl-line-mode t)

;; ======================= Markdown =======================

(autoload 'markdown-mode "~/.emacs.d/markdown-mode/markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

;; max window
(run-with-idle-timer 0.0 nil 'w32-send-sys-command 61488)

;; transparent window
(global-set-key [(f12)] 'loop-alpha)
(setq alpha-list '((90 90) (100 100)))

(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list)))
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab)) 
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))
       ) (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))
    )
)

;; ======================= System custom =======================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(inhibit-startup-screen t)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
