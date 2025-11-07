# Clean CV Template

A modular LaTeX CV template with automatic PDF generation and GitHub Pages deployment (in multiple versions).

Inspired by [autoCV](https://github.com/jitinnair1/autoCV), simplified and adapted for modular CV building.

## Quick Start

### 1. Use This Template

Click the green **"Use this template"** button at the top of this repo, or fork it.


### 2. Create your CV files in the `src/` folder.

#### Approach 1: Modular (Recommended for multiple versions)
Create `.tex` files that import sections from `sections/`. This lets you mix and match components.

**Example** - `cv.tex`:
```latex
\input{sections/header/header_generic.tex}
\input{sections/education/education_v1.tex}
\input{sections/research/research_alltogether.tex}
```

**To create multiple versions:**
1. Create variant sections in `sections/` (e.g., `education_v1.tex`, `education_v2.tex`)
2. Create multiple main files (e.g., `cv_research.tex`, `cv_industry.tex`)
3. Each imports different section variants

#### Approach 2: All-in-one
Put everything directly in one `.tex` file. Simpler but less flexible.

**See the example files:** `cv.tex` (modular) and `cv_alltogether.tex` (all-in-one)

### 3. Set up which CVs to publish.

Edit `.github/workflows/build.yml` to list the versions that should be deployed:
```yaml
strategy:
  matrix:
    cv: [cv, cv_alltogether]  # Add or remove CV filenames here
```

### 4. Enable Actions and GitHub Pages.

1. Go to **Settings** → **Actions** and enable Actions for your repo.
   1. Allow actions in the main `Actions permissions` section.
   2. Select "Read and write permissions" for the "Workflow permissions" section.
2. Go to **Settings** → **Pages**.
3. Under `Build and deployment` → `Source`: **Deploy from a branch**
4. Under `Branch`: Select **gh-pages** and **/ (root)**
5. Click **Save**

### 5. Enjoy your CV!

It should be published automatically as
```
https://<your-username>.github.io/<your-repo>/<latex-file-name>.pdf
```

## License

This template is released into the public domain under the [Unlicense](https://unlicense.org/). Do whatever you want with it.