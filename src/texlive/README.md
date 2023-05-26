
# TeX Live from official site installer (texlive)

Install an up-to-date TeX Live distribution from official site.

## Example Usage

```json
"features": {
    "ghcr.io/lbssousa/devcontainer-features-texlive-music/texlive:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| repository | Specify the package repository to be used as the source of the installation. | string | https://mirror.ctan.org/systems/texlive/tlnet |
| version | Select or the TeX Live historic version to install. | string | latest |
| scheme | Select or enter the TeX Live scheme to install. WARNING: _minimal_ scheme **DOES NOT** include LaTeX! | string | basic |
| collection-basic | Enable TeX Live collection-basic installation. | boolean | false |
| collection-bibtexextra | Enable TeX Live collection-bibtexextra installation. | boolean | false |
| collection-binextra | Enable TeX Live collection-binextra installation. | boolean | false |
| collection-context | Enable TeX Live collection-context installation. | boolean | false |
| collection-fontsextra | Enable TeX Live collection-fontsextra installation. | boolean | false |
| collection-fontsrecommended | Enable TeX Live collection-fontsrecommended installation. | boolean | false |
| collection-fontutils | Enable TeX Live collection-fontutils installation. | boolean | false |
| collection-formatsextra | Enable TeX Live collection-formatsextra installation. | boolean | false |
| collection-games | Enable TeX Live collection-games installation. | boolean | false |
| collection-humanities | Enable TeX Live collection-humanities installation. | boolean | false |
| collection-langarabic | Enable TeX Live collection-langarabicc installation. | boolean | false |
| collection-langchinese | Enable TeX Live collection-langchinese installation. | boolean | false |
| collection-langcjk | Enable TeX Live collection-langcjk installation. | boolean | false |
| collection-langcyrillic | Enable TeX Live collection-langcyrillic installation. | boolean | false |
| collection-langczechslovak | Enable TeX Live collection-langczechslovak installation. | boolean | false |
| collection-langenglish | Enable TeX Live collection-langenglish installation. | boolean | false |
| collection-langeuropean | Enable TeX Live collection-langeuropean installation. | boolean | false |
| collection-langfrench | Enable TeX Live collection-langfrench installation. | boolean | false |
| collection-langgerman | Enable TeX Live collection-langgerman installation. | boolean | false |
| collection-langgreek | Enable TeX Live collection-langgreek installation. | boolean | false |
| collection-langitalian | Enable TeX Live collection-langitalian installation. | boolean | false |
| collection-langjapanese | Enable TeX Live collection-langjapanese installation. | boolean | false |
| collection-langkorean | Enable TeX Live collection-langkorean installation. | boolean | false |
| collection-langother | Enable TeX Live collection-langother installation. | boolean | false |
| collection-langpolish | Enable TeX Live collection-langpolish installation. | boolean | false |
| collection-langportuguese | Enable TeX Live collection-langportuguese installation. | boolean | false |
| collection-langspanish | Enable TeX Live collection-langspanish installation. | boolean | false |
| collection-latex | Enable TeX Live collection-latex installation. | boolean | false |
| collection-latexextra | Enable TeX Live collection-latexextra installation. | boolean | false |
| collection-latexrecommended | Enable TeX Live collection-latexrecommended installation. | boolean | false |
| collection-luatex | Enable TeX Live collection-luatex installation. | boolean | false |
| collection-mathscience | Enable TeX Live collection-mathscience installation. | boolean | false |
| collection-metapost | Enable TeX Live collection-metapost installation. | boolean | false |
| collection-music | Enable TeX Live collection-music installation. | boolean | false |
| collection-pictures | Enable TeX Live collection-pictures installation. | boolean | false |
| collection-plaingeneric | Enable TeX Live collection-plaingeneric installation. | boolean | false |
| collection-pstricks | Enable TeX Live collection-pstricks installation. | boolean | false |
| collection-publishers | Enable TeX Live collection-publishers installation. | boolean | false |
| collection-texworks | Enable TeX Live collection-texworks installation. | boolean | false |
| collection-wintools | Enable TeX Live collection-wintools installation. | boolean | false |
| collection-xetex | Enable TeX Live collection-xetex installation. | boolean | false |
| extra-packages | Space-separated list of individual TeX Live packages to install. | string | - |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/lbssousa/devcontainer-features-texlive-music/blob/main/src/texlive/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
