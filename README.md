# Oxforddown with VS Code

A template for writing an Oxford University thesis using VS Code and R Markdown.
The template uses the [bookdown](https://bookdown.org) R package together with the [OxThesis LaTeX template](https://github.com/mcmanigle/OxThesis), plus lots of inspiration from [thesisdown](https://github.com/ismayc/thesisdown).

## Requirements

- [Visual Studio Code](https://code.visualstudio.com/download)
- [R](https://cran.r-project.org) (version 4.0 or higher recommended)
- VS Code extensions:
  - [R Extension for VS Code](https://marketplace.visualstudio.com/items?itemName=REditorSupport.r)
  - [R Markdown All in One](https://marketplace.visualstudio.com/items?itemName=TianyiShi.rmarkdown) (optional but recommended)
  - [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one) (optional but recommended)

## Getting Started

### 1. Clone the Repository

```powershell
# Clone the repository
git clone https://github.com/ulyngs/oxforddown.git
cd oxforddown

# OR download and extract the ZIP file from GitHub
# https://github.com/ulyngs/oxforddown/archive/refs/heads/main.zip
```

### 2. Open the Project in VS Code

```powershell
code .
```

Or open VS Code and select File > Open Folder... > Navigate to the oxforddown directory.

### 3. Install Required R Packages

Open a terminal in VS Code (Terminal > New Terminal) and run:

```powershell
# Install required R packages
Rscript -e "install.packages(c('rmarkdown', 'bookdown', 'tidyverse', 'kableExtra', 'here', 'downlit', 'bslib'))"
```

### 4. LaTeX Installation

You need a LaTeX installation to build the PDF output. Choose one of these options:

#### Option 1: TinyTeX (Recommended for R Markdown users)

TinyTeX is a lightweight LaTeX distribution specifically designed for R Markdown.

```powershell
# Install TinyTeX
Rscript -e "install.packages('remotes'); remotes::install_github('yihui/tinytex'); tinytex::install_tinytex()"

# Install required LaTeX packages
Rscript -e "tinytex::tlmgr_install(c('appendix', 'babel-english', 'babel-greek', 'babel-latin', 'biber', 'biblatex', 'caption', 'cbfonts-fd', 'colortbl', 'csquotes', 'enumitem', 'environ', 'eso-pic', 'fancyhdr', 'greek-fontenc', 'grfext', 'hyphen-greek', 'hyphen-latin', 'lineno', 'logreq', 'makecell', 'microtype', 'minitoc', 'multirow', 'notoccite', 'oberdiek', 'pdflscape', 'pdfpages', 'quotchap', 'soul', 'tabu', 'threeparttable', 'threeparttablex', 'titlesec', 'tocbibind', 'trimspaces', 'ulem', 'units', 'utopia', 'varwidth', 'wrapfig', 'fvextra', 'xurl'))"
```

#### Option 2: Full LaTeX Distribution

- **Windows**: Install MiKTeX from [miktex.org](https://miktex.org)
- **Mac**: Install MacTeX from [tug.org/mactex/](http://www.tug.org/mactex/) (approximately 4 GB)
- **Linux**: Install TeX Live with `sudo apt-get install texlive-full` (Ubuntu/Debian) or equivalent for your distribution

### 5. VS Code Setup for Building the Thesis

The repository already includes VS Code task configurations in the `.vscode/tasks.json` file. These tasks make it easy to build your thesis in different formats.

If the `.vscode` folder doesn't exist in your repository, create it:

```bash
mkdir -p .vscode
```

Then create a `tasks.json` file with the following content:

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Build Thesis (PDF)",
      "type": "shell",
      "command": "Rscript",
      "args": [
        "build-thesis.R",
        "pdf"
      ],
      "group": {
        "kind": "build",
        "isDefault": true
      },
      "presentation": {
        "echo": true,
        "reveal": "always",
        "focus": false,
        "panel": "shared",
        "showReuseMessage": false,
        "clear": false
      },
      "problemMatcher": []
    },
    {
      "label": "Build Thesis (BS4)",
      "type": "shell",
      "command": "Rscript",
      "args": [
        "build-thesis.R",
        "bs4"
      ],
      "group": "build"
    },
    {
      "label": "Build Thesis (GitBook)",
      "type": "shell",
      "command": "Rscript",
      "args": [
        "build-thesis.R",
        "gitbook"
      ],
      "group": "build"
    },
    {
      "label": "Build Thesis (Word)",
      "type": "shell",
      "command": "Rscript",
      "args": [
        "build-thesis.R",
        "word"
      ],
      "group": "build"
    },
    {
      "label": "Build Thesis (All Formats)",
      "type": "shell",
      "command": "Rscript",
      "args": [
        "build-thesis.R",
        "pdf",
        "bs4",
        "gitbook",
        "word"
      ],
      "group": "build"
    }
  ]
}
```

## Writing Your Thesis

### Thesis Configuration

Update the YAML header in `index.Rmd` with your name, college, and other details:

```yaml
---
title: |
  `oxforddown`: \
  An Oxford University Thesis \
  Template for R Markdown
author: Your Name
college: Your College
university: University of Oxford
# ... other settings
---
```

### Thesis Structure

- Write your chapters as `.Rmd` files in the root folder
- Front matter (abstract, acknowledgements) and back matter (appendices) are in the `front-and-back-matter/` folder
- Bibliography files are in the `bibliography/` folder (don't use underscores in filenames!)

## Building Your Thesis in VS Code

### Using VS Code Tasks

1. Press `Ctrl+Shift+B` (Windows/Linux) or `Cmd+Shift+B` (Mac) to open the task runner
2. Select one of the available build tasks:
   - **Build Thesis (PDF)**: Builds the thesis as a PDF document
   - **Build Thesis (BS4)**: Builds the thesis as an HTML document using the BS4 format
   - **Build Thesis (GitBook)**: Builds the thesis as an HTML document using the GitBook format
   - **Build Thesis (Word)**: Builds the thesis as a Word document
   - **Build Thesis (All Formats)**: Builds the thesis in all available formats

### Alternative: Using Terminal

You can also build the thesis directly from the terminal:

```powershell
# Build PDF version
Rscript build-thesis.R pdf

# Build multiple formats
Rscript build-thesis.R pdf bs4 gitbook
```

### Output Files

All generated thesis files will be saved in the `docs/` folder:
- PDF output: `docs/_main.pdf`
- HTML output (BS4/GitBook): `docs/index.html`
- Word output: `docs/_main.docx`

## Publishing to GitHub Pages

There are two approaches for publishing your thesis to GitHub Pages:

### Approach 1: Local Build + GitHub Pages (Recommended)

This approach is faster and more reliable, especially for large theses:

1. Build your thesis locally using one of the VS Code tasks
2. Commit and push the changes including the `docs/` folder to GitHub
3. Set up GitHub Pages to use the `docs` folder from your main branch:
   - Go to your repository's Settings > Pages
   - Under "Source", select "Deploy from a branch"
   - Select "main" branch and "/docs" folder
   - Click "Save"

#### Pros:
- Faster: No need to wait for GitHub Actions to compile
- More reliable: Avoids potential GitHub Actions timeout issues
- Better debugging: You can fix build issues locally before pushing

#### Cons:
- Need to remember to rebuild and commit the `docs/` folder when making changes
- Have to manage LaTeX locally

Here's a typical workflow:

```powershell
# 1. Make your changes to the thesis

# 2. Build the thesis locally
Rscript build-thesis.R pdf bs4  # Build both PDF and HTML versions

# 3. Commit and push to GitHub
git add .
git commit -m "Update thesis content and build files"
git push origin main
```

### Approach 2: GitHub Actions Automated Build

The repository is pre-configured with GitHub Actions to automatically build your thesis and deploy it to GitHub Pages:

1. Push your changes to GitHub without building locally
2. GitHub Actions will automatically build and deploy the thesis
3. Set up GitHub Pages to use the GitHub Actions source:
   - Go to your repository's Settings > Pages
   - Under "Source", select "GitHub Actions"

#### Pros:
- Fully automated: Just push your changes and let GitHub build it
- No need for local LaTeX installation

#### Cons:
- Slower: Each build takes 5-10 minutes
- May hit workflow time limits for very large theses
- More difficult to debug build issues

To customize the GitHub Actions workflow, edit the `.github/workflows/build-thesis.yml` file.

### Reducing GitHub Actions Build Time

If you're using GitHub Actions but experiencing slow builds:

1. Limit the output formats to just what you need (e.g., only PDF and BS4)
2. Use the cache effectively (the workflow already includes caching)
3. Use a specific LaTeX package list instead of installing all packages
4. Consider switching to the local build approach for large theses

## Customizing Build Options

### Changing Output Formats

Edit the `thesis_formats` variable in your `index.Rmd` file:

```yaml
knit: (function(input, ...) {
    thesis_formats <- "pdf";  # Change to "bs4", "gitbook", "word", or c("pdf", "bs4", "word")
    
    source("scripts_and_filters/knit-functions.R");
    knit_thesis(input, thesis_formats, ...)
  })
```

### Creating a Custom Build Script

You can also create a custom build script for more advanced configuration. Create a file called `build-thesis.R` with:

```r
source(file.path(getwd(), "scripts_and_filters", "knit-functions.R"))
args <- commandArgs(trailingOnly = TRUE)
if (length(args) > 0) { formats <- args } else { formats <- "pdf" }
knit_thesis("index.Rmd", formats)
```

This allows you to specify output formats when calling the script.

## Tips and Troubleshooting

1. **YAML Formatting**: Ensure proper indentation in YAML headers. Common issues include improper indentation in the `output:` section.

2. **LaTeX Errors**:
   - If you encounter LaTeX errors, check the `.log` file in the root directory
   - For missing LaTeX packages, install them with `tinytex::tlmgr_install("package-name")`

3. **File Naming**: Avoid using underscores (_) in your filenames and YAML front matter to prevent LaTeX errors.
   - Avoid: `bibliography: bib_final.bib`
   - Better: `bibliography: bib-final.bib`

4. **Building Single Chapters**: To build an individual chapter, add a YAML header to the chapter's `.Rmd` file and click the knit button or use the VS Code R Markdown extension.
