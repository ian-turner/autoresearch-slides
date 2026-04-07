# Reference Support

- The deck now uses `natbib` plus a BibTeX database in `references.bib`.
- Add citations in slide content with `\citep{...}` or `\citet{...}` and keep entries in `references.bib`.
- The bibliography is rendered in a dedicated `References` frame at the end of `main.tex`.
- `compile.sh` still works through `latexmk`; it will run the BibTeX pass automatically when citations change.
