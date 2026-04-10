# Repository Instructions

- Put information that may be necessary for future development in the `notes/` folder as Markdown files.
- Keep updates to LaTeX files limited to the specific change requested.
- Do not edit overall style information unless explicitly asked.
- Small formatting changes for readability or continuity are allowed when they directly support the requested edit.

## Building the PDF

Always use the compile script — do not invoke `pdflatex` or `latexmk` directly:

```
bash compile.sh
```

The script runs the full latexmk pipeline (multiple passes, BibTeX, output to `build/`). If latexmk reports "Nothing to do" after a real change, delete `build/main.fdb_latexmk` to force a rebuild.
