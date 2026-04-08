# Reference Support

- The deck now uses `natbib` plus a BibTeX database in `references.bib`.
- Add citations in slide content with `\citep{...}` or `\citet{...}` and keep entries in `references.bib`.
- The bibliography is rendered in a dedicated `References` frame at the end of `main.tex`.
- The references frame includes `\nocite{*}` so BibTeX entries still render even when the current draft has few or no in-slide citations yet.
- `compile.sh` still works through `latexmk`; it will run the BibTeX pass automatically when citations change.
