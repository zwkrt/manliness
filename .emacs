(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.emacs.d/saves/"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;Always view column- and line-numbers
(setq line-number-mode t)
(setq column-number-mode t)

;show matching parens
(show-paren-mode 1)

;make dabbrev match case
(setq dabbrev-case-fold-search nil)

;iswitchb mode
(iswitchb-mode 1)
(add-to-list 'iswitchb-buffer-ignore "^ ")
(add-to-list 'iswitchb-buffer-ignore "*Messages*")
(add-to-list 'iswitchb-buffer-ignore "*ECB")
(add-to-list 'iswitchb-buffer-ignore "*Buffer")
(add-to-list 'iswitchb-buffer-ignore "*Completions")
(add-to-list 'iswitchb-buffer-ignore "*ftp ")
(add-to-list 'iswitchb-buffer-ignore "*bsh")
(add-to-list 'iswitchb-buffer-ignore "*jde-log")
(add-to-list 'iswitchb-buffer-ignore "^[tT][aA][gG][sS]$")
;Custom shortcuts
(global-set-key (kbd "C-c f") 'fill-paragraph)
(global-set-key (kbd "C-c l") 'kill-whole-line)
(global-set-key (kbd "C-c /") 'replace-regexp)


;End Custom shortcuts

(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(global-set-key [f12] 'iwb)

;;;;;;;;;;;;;;;;;;
;Flymake settings
;;;;;;;;;;;;;;;;;;

;; (eval-after-load "flymake"
;;   '(progn
;;     (defun flymake-after-change-function (start stop len)
;;       "Start syntax check for current buffer if it isn't already running."
;;       ;; Do nothing, don't want to run checks until I save.
;;       )))


;Python
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pycheckers"  (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))

;Other Languages?

;; Run Flymake whenever possible
;; (add-hook 'find-file-hook 'flymake-find-file-hook)

;Create useful flymake shortcuts
(defun flymake-error-under-point ()
  "Display the flymake error under the point in the minibuffer."
  (interactive)
  (let ((line-no (line-number-at-pos)))
    (dolist (elem flymake-err-info)
      (if (eq (car elem) line-no)
          (let ((err (car (nth 1 elem))))
            (message "%s" (flymake-ler-text err)))))))

(defadvice flymake-goto-next-error (after display-message activate compile)
  "Show the next error in the ring in the minibuffer."
  (flymake-error-under-point))


(defadvice flymake-goto-prev-error (after display-message activate compile)
  "Show the previous error in the ring in the minibuffer."
  (flymake-error-under-point))


(defadvice flymake-mode (before post-command-stuff activate compile)
  "When there's an error under the point, display it in the
minibuffer."
  (set (make-local-variable 'post-command-hook)
       (cons 'flymake-error-under-point post-command-hook)))

(global-set-key (kbd "C-c n") 'flymake-goto-next-error)
(global-set-key (kbd "C-c p") 'flymake-goto-prev-error)

(provide 'flymake-point)