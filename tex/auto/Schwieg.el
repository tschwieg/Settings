(TeX-add-style-hook
 "Schwieg"
 (lambda ()
   (TeX-run-style-hooks
    "amsmath"
    "bm"
    "amsthm"
    "mathtools")
   (TeX-add-symbols
    '("compl" 1)
    '("inverse" 1)
    '("Lim" 1)
    '("set" 1)
    '("close" 1)
    '("conj" 1)
    '("seq" 1)
    '("abs" 1)
    '("brak" 1)
    '("exV" 1)
    '("met" 1)
    "diam"
    "compose"
    "setMinus"
    "setR"
    "setQ"
    "setZ"
    "setN")
   (LaTeX-add-amsthm-newtheorems
    "definition"
    "theorem"
    "question"
    "answer")
   (LaTeX-add-mathtools-DeclarePairedDelimiters
    '("ceil" "")
    '("floor" "")))
 :latex)

