# Pandoc IEEE Journal and Conference template

See the repository [here](https://github.com/kdheepak/pandoc-ieee-template) for more information.
See [releases for examples](https://github.com/kdheepak/pandoc-ieee-template/releases) of PDF, DOCX and HTML.
See [blog post](http://blog.kdheepak.com/writing-papers-with-markdown.html) for more information regarding this.
See [example](http://kdheepak.com/pandoc-ieee-template) for a HTML example.

### Setup

- Install [MikTeX](https://miktex.org/download) or [MacTeX](http://www.tug.org/mactex/)
- Install [Pandoc](https://pandoc.org/installing.html)
- Install [Pandoc-Citeproc](https://pandoc.org/installing.html) (Optional)
- Install [Miniconda](https://conda.io/miniconda.html)

You can install both pandoc and pandoc-citeproc using the `conda` package manager.
However, `conda` has an older version of pandoc and pandoc-citeproc.
I've tested this with Pandoc 1.19.2.1.
`pandoc-citeproc` is only required if you are interested in generating citations using the PDF target.
The TeX target does not use the pandoc-citeproc, and uses biblatex instead.
There are minor differences in how the citations look when Pandoc generates it using pandoc-citeproc versus when it is generated using biblatex.
I tend to use the PDF target when writing the paper and use the TeX target once the final version is required.

**Mac**

Users can install Pandoc and Pandoc-Citeproc using [`brew`](https://brew.sh/) (recommended).

```bash
$ brew install pandoc pandoc-citeproc

$ pandoc --version
pandoc 2.2
Compiled with pandoc-types 1.17.4.2, texmath 0.10.1.2, skylighting 0.7.1
Default user data directory: /Users/$USER/.pandoc
Copyright (C) 2006-2018 John MacFarlane
Web:  http://pandoc.org
This is free software; see the source for copying conditions.
There is no warranty, not even for merchantability or fitness
for a particular purpose.

$ pandoc-citeproc --version
pandoc-citeproc 0.14.3.1
```

Setup the Python environment for pandoc filters (optional but recommended)

Open a terminal

```bash
conda create -n python3-pandoc-env python=3 -y
source activate python3-pandoc-env
pip install pandoc-fignos
pip install pandoc-eqnos
pip install pandoc-tablenos
```

**Windows**

You need to install [`Make`](https://gist.github.com/evanwill/0207876c3243bbb6863e65ec5dc3f058) to use the `Makefile` on Windows.
Git Bash is recommended for using `Make`.

Installing Pandoc is straightforward on Windows. You can download the binary from the link above.
You can install pandoc-citeproc using conda.

```bash
activate python3-pandoc-env
conda install pandoc-citeproc
```

You can install pandoc using conda as well.
This may be an older version of Pandoc though.

```
activate python3-pandoc-env
conda install pandoc
```

Setup the Python environment for pandoc filters (optional but recommended)

Open a Command Prompt

```
conda create -n python3-pandoc-env python=3 -y
activate python3-pandoc-env
pip install pandoc-fignos
pip install pandoc-eqnos
pip install pandoc-tablenos
```

### Generate Paper

Make sure that you have MikTeX or MacTeX, and Pandoc installed correctly.

```bash
# Mac:
source activate python3-pandoc-env
# Windows:
activate python3-pandoc-env

make pdf
# OR
make tex
```

- Change `journal: true` to `conference: true` for a conference version of the paper.
- Add packages to `package:` to add more packages to the tex file.

### Contributions

Please feel free to open issues to report bugs or submit pull requests to add features.

