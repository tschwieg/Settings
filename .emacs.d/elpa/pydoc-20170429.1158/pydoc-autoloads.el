;;; pydoc-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "pydoc" "pydoc.el" (23117 14385 705150 266000))
;;; Generated autoloads from pydoc.el

(autoload 'pydoc-mode "pydoc" "\
Major mode for viewing pydoc output.
Commands:
\\{pydoc-mode-map}

\(fn)" t nil)

(autoload 'pydoc "pydoc" "\
Display pydoc information for NAME in `pydoc-buffer'.
Completion is provided with candidates from `pydoc-all-modules'.
This is cached for speed. Use a prefix arg to refresh it.

\(fn NAME)" t nil)

(autoload 'pydoc-at-point "pydoc" "\
Try to get help for thing at point.
Requires the python package jedi to be installed.

There is no way right now to get to the full module path. This is a known limitation in jedi.

\(fn)" t nil)

(autoload 'pydoc-browse "pydoc" "\
Open a browser to pydoc.
Attempts to find an open port, and to reuse the process.

\(fn)" t nil)

(autoload 'pydoc-browse-kill "pydoc" "\
Kill the pydoc browser.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil nil ("pydoc-pkg.el") (23117 14385 766116 662000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; pydoc-autoloads.el ends here
