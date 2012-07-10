(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'cl)
(require 'ido-ubiquitous)
(require 'flymake-point)
(require 'lorem)

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.emacs.d/saves/"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t       ; use versioned backups
   mouse-wheel-scroll-amount '(1 ((shift) . 1)) ;; one line at a time
   mouse-wheel-progressive-speed nil ;; don't accelerate scrolling
   mouse-wheel-follow-mouse 't ;; scroll window under mouse
   scroll-step 1 ;; keyboard scroll one line at a time
   dabbrev-case-fold-search nil ;make dabbrev match case
   line-number-mode t
   column-number-mode t
   transient-mark-mode nil
)

;proving my worthiness
(menu-bar-mode -1)

;show matching parens
(show-paren-mode 1)

;Like iswitchb but much better
(ido-mode t)
(ido-ubiquitous t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)

;Custom shortcuts
(global-set-key (kbd "C-c f") 'fill-paragraph)
(global-set-key (kbd "C-c l") 'kill-whole-line)
(global-set-key (kbd "C-c /") 'replace-regexp)
(global-set-key (kbd "C-t") 'ido-goto-symbol)


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

(eval-after-load "flymake"
  '(progn
    (defun flymake-after-change-function (start stop len)
      "Start syntax check for current buffer if it isn't already running."
      ;; Do nothing, don't want to run checks until I save.
      )))


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

;; Run Flymake whenever possible
(add-hook 'find-file-hook 'flymake-find-file-hook)
