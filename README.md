# Pandoc IEEE Journal and Conference template

### Setup

- Install [MikTeX](https://miktex.org/download) or [MacTeX](http://www.tug.org/mactex/)
- Install [Pandoc](https://pandoc.org/installing.html)
- Install [Pandoc-Citeproc](https://pandoc.org/installing.html) (Optional)
- Install [Miniconda](https://conda.io/miniconda.html)

You can install both pandoc and pandoc-citeproc using the `conda` package manager.
However, `conda` has an older version of pandoc and pandoc-citeproc.
Some of the command line options passed to Pandoc in the Makefile might need to be changed in order to get an older version of Pandoc working.
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

Installing Pandoc is straightforward on Windows. You can download the binary from the link above.
You can install pandoc-citeproc using conda.

```bash
activate python3-pandoc-env
conda install pandoc-citeproc
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

