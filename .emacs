;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))




(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
 (package-initialize)  ;load and activate packages, including auto-complete




(toggle-frame-maximized)

(setq package-enable-at-startup nil)
(require 'yasnippet)
(yas-global-mode 1)

(require 'ess-site)
;; (require 'julia-mode)
;; (setq inferior-ess-r-program-name "R" )
;; (load "~/ESS/lisp/ess-site")

(tool-bar-mode -1)

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<C-tab>") 'yas-expand)

(eval-after-load 'yasnippet
  '(progn
     (define-key yas-keymap (kbd "TAB") nil)
     (define-key yas-keymap (kbd "<C-tab>") 'yas-next-field-or-maybe-expand)))

(require 'auto-complete)
(ac-config-default)
(ac-flyspell-workaround)
(pdf-tools-install)

(save-place-mode 1)

(server-start)

(subword-mode)

(require 'ido)
(ido-mode t)

(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection
   (quote
    ((output-pdf "xdg-open")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Evince")
     (output-html "xdg-open"))))
 '(cdlatex-paired-parens "$[{(")
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(elpy-modules
   (quote
    (elpy-module-eldoc elpy-module-pyvenv elpy-module-django elpy-module-sane-defaults)))
 '(ess-R-font-lock-keywords
   (quote
    ((ess-R-fl-keyword:modifiers . t)
     (ess-R-fl-keyword:fun-defs . t)
     (ess-R-fl-keyword:keywords . t)
     (ess-R-fl-keyword:assign-ops . t)
     (ess-R-fl-keyword:constants . t)
     (ess-fl-keyword:fun-calls . t)
     (ess-fl-keyword:numbers . t)
     (ess-fl-keyword:operators . t)
     (ess-fl-keyword:delimiters)
     (ess-fl-keyword:=)
     (ess-R-fl-keyword:F&T . t)
     (ess-R-fl-keyword:%op% . t))))
 '(ess-pdf-viewer-pref "okular")
 '(ess-swv-pdflatex-commands (quote ("pdflatex" "texi2pdf" "make")))
 '(ess-swv-processor (quote knitr))
 '(flycheck-lintr-linters
   "with_defaults(camel_case_linter = NULL,snake_case_linter,infix_spaces_linter = NULL)")
 '(inferior-julia-args "")
 '(inhibit-startup-screen t)
 '(org-agenda-files
   (quote
    ("~/School/Classes/Project/Paper/outline.org" "~/School/Classes/Project/Outline/outline.org")))
 '(org-format-latex-options
   (quote
    (:foreground default :background default :scale 1.0 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\[" "#+BEGIN_EXPORT latex"))))
 '(package-selected-packages
   (quote
    (bookmark solarized-theme orgnoter org interleave org-noter preview-latex preview-mode ess noweb-mode noweb-mdoe no-web-mode polymode org-mode auto-complete julia-mode pyenv-mode font-lock-studio)))
 '(python-shell-interpreter "python")
 '(sp-highlight-pair-overlay nil)
 '(sp-highlight-wrap-overlay nil)
 '(sp-highlight-wrap-tag-overlay nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-scrollbar-bg ((t (:background "black"))))
 '(company-scrollbar-fg ((t (:background "grey"))))
 '(company-tooltip ((t (:background "#00222c" :foreground "light grey"))))
 '(company-tooltip-annotation ((t (:foreground "white"))))
 '(company-tooltip-common ((t (:foreground "light grey"))))
 '(company-tooltip-selection ((t (:background "SteelBlue4"))))
 '(org-latex-and-related ((t (:foreground "#6c71c4")))))


(require 'highlight-symbol)
;(global-set-key (kbd "C-c a") 'highlight-symbol-at-point)
(global-set-key (kbd "C-c d") 'comment-region )
(global-set-key (kbd "C-c s") 'uncomment-region )

(require 'highlight-thing)
(global-highlight-thing-mode)
(setq highlight-thing-what-thing 'word)
(setq highlight-thing-exclude-thing-under-point t)

(font-lock-add-keywords
 'ess-julia-mode
 '(("\\<\\([0-9]+\\)\\>"
    1 font-lock-constant-face)))


(font-lock-add-keywords
 'ess-julia-mode
 '(("\\<\\([A-Za-z_]+\\)\\>("
    1 font-lock-function-name-face)))


(font-lock-add-keywords
 'ess-julia-mode
 '(("\\<\\(while\\|for\\|return\\|print\\|if\\)\\>("
    1 font-lock-keyword-face)))


(font-lock-add-keywords
 'ess-julia-mode
 '(("@\\<\\([A-Za-z_]+\\)\\>("
    1 font-lock-preprocessor-face)))

(font-lock-add-keywords
 'ess-julia-mode
 `((,(let ((OR "\\|"))
       (concat "\\(" ;; stolen `matlab.el' operators first
               "[<>!]=?" OR
               "\\.[/*^']" OR
               "==" OR
               "=>" OR
               "\\<xor\\>" OR
               "[-+*\\/^&|$]=?" OR ;; this has to come before next (updating operators)
               "[-!^&|*+\\/~:]" OR
               ;; more extra julia operators follow
               "[%$]" OR
               ;; bitwise operators
               ">>>" OR
               ">>" OR
               "<<" OR
               ">>>=" OR ">>" OR "<<" OR
               ;; comparison
               "[<>!]=?" OR
               "\\)"))
   1 font-lock-type-face)))

(require 'smartparens-config)

(add-hook 'prog-mode-hook
          (lambda ()
            (font-lock-add-keywords nil
                                    '(("\\<\\(NOTE\\|FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))
	    (rainbow-delimiters-mode)
	    (smartparens-mode)
            (unless (equal major-mode 'pdf-view-mode) 
               (display-line-numbers-mode))
	    ))

;(global-linum-mode 1)



(setq ess-ask-for-ess-directory nil)

(defun my-company-r-hook(x)
  (when x
  (setq company-r-window (selected-window))
  (ess-display-help-on-object x)
  (select-window company-r-window)))

(setq ac-auto-show-menu nil)
(setq ac-use-quick-help nil)
(define-key ac-completing-map "\t" 'ac-complete)
(define-key ac-completing-map "\r" nil)
(setq ac-ignore-case 'smart)
(setq ac-expand-on-auto-complete t)
(push 'ac-source-yasnippet ac-sources)

(defun display-help-R()
  (interactive)
  (setq company-r-window (selected-window))
  (ess-display-help-on-object)
  (select-window company-r-window))


(add-hook 'ess-mode-hook
	  (lambda ()
	    (linum-on)
	    ;; (require 'whitespace)
	    ;; (setq whitespace-line-column 80 )
	    ;; 
	    ;; (setq whitespace-style '(face tabs lines-tail trailing))
	    ;; (whitespace-mode)
	    (setq flycheck-lintr-caching nil)
	    ;(purpose-load-window-layout "RLayout")
	    ;(ess-load-file "~/.emacsPrinter.r")
	    (add-hook 'company-completion-finished-hook 'my-company-r-hook )
	    (local-set-key (kbd "<C-iso-lefttab>") 'ess-display-help-on-object)
	    (flycheck-mode t)
	    (setq ess-use-company 'script-only)
	    (setq company-r-window (selected-window))
	    (ess-switch-to-end-of-ESS)
	    (select-window company-r-window)))




(require 'python)
(require 'eval-in-repl)
(require 'eval-in-repl-python)

(defun EvaluateWholeFunction()
  "This sends the entire buffer to the REPL Process"
  (interactive)
  (mark-whole-buffer)
  (eir-eval-in-python))


(global-company-mode)
(setq company-minimum-prefix-length 2 )
(setq company-idle-delay 60)
(define-key company-mode-map (kbd "<backtab>") 'company-complete)
;(global-set-key (kbd "<tab>") 'completion-at-point)
(setq completion-cycle-threshold t)
(require 'company-statistics)
(company-statistics-mode)

(defun company-down-view-doc()
(interactive)
(company-select-next-or-abort)
(company-show-doc-buffer))

(defun company-up-view-doc()
(interactive)
(company-select-previous-or-abort)
(company-show-doc-buffer))




(define-key company-active-map (kbd "<return>" ) nil )
(define-key company-active-map (kbd "RET" ) nil )
(define-key company-active-map (kbd "<tab>" ) 'company-complete-selection )
(define-key company-active-map (kbd "<backtab>" ) 'company-show-doc-buffer )
(define-key company-active-map (kbd "<down>" ) 'company-down-view-doc )
(define-key company-active-map (kbd "<up>" ) 'company-up-view-doc )

(defun my-company-python-hook(x)
  (when x 
  (jedi:show-doc)))




(add-hook 'python-mode-hook
	  (lambda ()
		    (require 'py-autopep8)
		    (require 'eval-in-repl-python)
		    (require 'jedi-core)
		    (require 'company-jedi)
		    (load-library "realgud")
		    (add-to-list 'company-backends 'company-jedi)
		    ;(setq python-shell-interpreter "python3")
		    (require 'whitespace)
		    (setq whitespace-line-column 80 )
		    (set-fill-column 80)
		    (setq whitespace-style '(face tabs lines-tail trailing))
		    (whitespace-mode)
		    (setq eir-ielm-eval-in-current-buffer t)
		    (setq py-keep-windows-configuration t )
		    (setq py-split-window-on-execute nil )
		    (add-hook 'company-completion-finished-hook 'my-company-python-hook )
		    (py-autopep8-enable-on-save)
;		    (jedi:setup)
		    (local-set-key (kbd "<C-iso-lefttab>") 'jedi:show-doc)
		    (run-python)
		    ;(purpose-load-window-layout "RLayout")
		    (local-set-key (kbd "<C-return>") 'eir-eval-in-python)))

(show-paren-mode 1)

(defun GenerateTheoremLabel()
  (interactive)
  (setq m (point-marker))
  (setq  startPos (point))
  ;; set cursor at start.
  (LaTeX-find-matching-begin)
  (setq  enumPos (point))

  (forward-sexp)
  (forward-sexp)
  (if (string-match-p (regexp-quote "\\begin{enumerate}") (buffer-substring enumPos (point)))
      (progn
        (goto-char enumPos)
        ;; Set cursor at enumerate
        (LaTeX-find-matching-begin)
        (setq parPos (point))

        (forward-sexp)
        (forward-sexp)
        (setq envText (buffer-substring parPos (point)))

                                        ;(message envText)
        (goto-char startPos)
        (if (string-match-p (regexp-quote "\\begin{document}") envText)
            (message "Not in nested Enviornment")
          
          (setq parText (buffer-substring parPos enumPos))
                                        ;(message parText)
          (when (string-match "\\\\label{[a-zA-Z]+:\\([0-9]+\\.[0-9]+\\)}" parText )
            ;; (list (match-string 0 parText)
            ;;       (match-string 1 parText))
            (setq theoremNum (match-string 1 parText))

            (setq enumText ( buffer-substring enumPos startPos))
            (setq testString "1")
            (setq pos 0)
            (while (string-match "\\\\label{item:[0-9]+\\.[0-9]+\\.\\([0-9]+\\)}" enumText pos )
              (setq testString (number-to-string (1+ (string-to-number (match-string 1 enumText)))))
              (setq pos (match-end 0)))
                                        ;(message (number-to-string lastNum))
            
            (setq labelNum (concat  theoremNum "." testString))
                                        ;(message labelNum)
            (delete-char -1)
            (insert (concat "\\label{item:" labelNum "} ")))))
    (goto-char startPos)))

(defun my-LaTeX-item-list()
    (interactive)
    (LaTeX-insert-item)
    (GenerateTheoremLabel))

(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (latex-extra-mode)
	    (company-auctex-init)
	    (setq-local company-backends
              (append '((company-math-symbols-latex company-latex-commands))
                      company-backends))
	    (require 'flyspell )
	    ;; (setq ispell-program-name "ispell") ; could be ispell as well, depending on your preferences
	    (setq ispell-dictionary "en_US") ; this can obviously be set to any language your spell-checking program supports
	    (setq reftex-plug-into-AUCTeX t)
	    (setq TeX-auto-save t)
	    (setq TeX-parse-self t)
	    (setq TeX-save-query nil)
	    (flyspell-mode)
	    (setq reftex-plug-into-AUCTeX t)
	    (flyspell-buffer)
	    (TeX-global-PDF-mode t)
	    (outline-minor-mode)
	    (setq TeX-error-overview-open-after-TeX-run t )
	    (prettify-symbols-mode)
            (display-line-numbers-mode)
            
            (turn-on-auto-fill)
            
                                        ;(local-set-key (kbd "C-c j") 'my-LaTeX-item-list)
            (smartparens-mode)
            (cdlatex-mode)
            (setq reftex-label-alist
                  '(("theorem" ?h "thr:" "~\\ref{%s}" t   ("Theorem" "theorem") -3)))

            (setq reftex-insert-label-flags '(nil t))
            (LaTeX-add-environments
             '("theorem" LaTeX-env-label))
            (add-to-list 'LaTeX-label-alist '("theorem" . "thr:"))
            ))
            ;(modify-syntax-entry ?_ "w" )
            ;(modify-syntax-entry ?^ "w" ) ))




(add-hook 'ess-julia-mode-hook
          (lambda ()
            (auto-complete-mode 1)
	    (local-set-key (kbd "<tab>") 'julia-latexsub-or-indent)))

(setq confirm-kill-processes nil )


(delete-selection-mode 1)


(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

(require 'ergoemacs-mode)
(setq ergoemacs-theme nil) ;; Uses Standard Ergoemacs keyboard theme
(setq ergoemacs-keyboard-layout "us") ;; Assumes QWERTY keyboard layout
(ergoemacs-mode 1)

(setq-default indent-tabs-mode nil)
;(setq-default tab-always-indent 'complete)


(require 'org)
(setq org-confirm-babel-evaluate nil)
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-startup-indented t)
(setq org-startup-folded "showall")
(setq org-pretty-entities t)

(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)   


(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t) (python . t) (R . t) (latex . t)))

(defun org-mode-reftex-setup ()
  (load-library "reftex")
  (and (buffer-file-name) (file-exists-p (buffer-file-name))
       (progn
     ;enable auto-revert-mode to update reftex when bibtex file changes on disk
     (global-auto-revert-mode t)
     (reftex-parse-all)
     ;add a custom reftex cite format to insert links
     ;;(reftex-set-cite-format "** [[papers:%l][%l]]: %t \n"
     (setq reftex-cite-format 'chicago)
   ))
  (define-key org-mode-map (kbd "C-c )") 'reftex-citation)
  (auto-fill-mode t)
  ;;(setq org-latex-pdf-process '("texi2dvi -p -b -V %f"))
) 
 

(add-hook 'org-mode-hook
	  (lambda ()
            (org-display-inline-images)
            (org-mode-reftex-setup)
	    (require 'flyspell )
	    ;; (setq ispell-program-name "ispell") ; could be ispell as well, depending on your preferences
	    (setq ispell-dictionary "en_US") ; this can obviously be set to any language your sp
	    (flyspell-mode)
	    (flyspell-buffer)

            (display-line-numbers-mode) ))

(require 'org-ref)


(add-to-list 'org-latex-packages-alist '("" "minted"))
(add-to-list 'org-latex-packages-alist '("" "bm"))
(add-to-list 'org-latex-packages-alist
             '("" "tikz" t))
(add-to-list 'org-latex-packages-alist
             '("" "natbib" t))

(eval-after-load "preview"
  '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{tikzpicture}" t))

(setq org-latex-create-formula-image-program 'imagemagick)

(setq org-latex-listings 'minted)

(setq org-highlight-latex-and-related '(latex script entities))

(setq org-latex-pdf-process '(
                              "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                              "bibtex %b"
                              "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                              "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                              ))



(require 'cdlatex)

(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
(add-hook 'org-mode-hook 'display-line-numbers-mode)
(setq org-src-window-setup 'current-window)


(add-to-list 'cdlatex-math-modify-alist
             '(98 "\\bm" "\\textbf" t nil nil))

(setq cdlatex-math-symbol-alist
      '((?- ("\\cap" "\\leftrightarrow" "\\longleftrightarrow" "\\Longleftrightarrow"))))

(add-to-list 'cdlatex-math-symbol-alist
             '([-] "\\cap" nil t nil nil))

(add-to-list 'cdlatex-math-modify-alist
             '(115 "\\seq" nil t nil nil))

(add-to-list 'cdlatex-math-modify-alist
             '(118 "\\vec" nil t nil nil))

(cdlatex-reset-mode)

(setq org-latex-minted-options '(
                                 ("frame" "lines")
                                 ("fontsize" "\\scriptsize")
                                 ("xleftmargin" "\\parindent")
                                 ("linenos" "")
                                 ("mathescape" "")
                                 ))


(add-to-list 'org-latex-classes
             '("paper"
               "\\documentclass{paper}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(transient-mark-mode t)

(set-fill-column 80)
(setq tramp-default-method "sshx")

(add-hook 'pdf-view-mode-hook 'pdf-view-midnight-minor-mode)


(turn-on-auto-fill)

