# TOFIX

Findings from a code scan on 2026-10-04.

## High

- `src/exercises/prime_numbers/solution7.R:14` - for `i == 3`, `upto` is 1 and `2:upto` counts down to `c(2, 1)`, so `3 %% 1 == 0` returns FALSE and 3 is not printed as prime (verified by running it); use `seq_len(upto)[-1]` / `seq(2, length.out = upto - 1)` or guard `upto < 2`.
- `src/exercises/prime_numbers/solution2.R:12` - 1 is reported as prime (output starts `1 2 3 5`); the same wrong result comes from `solution3.R:10`, `solution4.R:10` (sieve keeps `v[1] = 1`), `solution5.R:23` (`primes = c(1)`), `solution6.R:12` and `solution7.R:10` (`i == 1` returns TRUE). Only `solution1.R` is correct; exclude 1 in each.
- `rsconstruct.toml:7` - nothing checks the 73 `.R` files (no R processor, no `script` instance), while `[processor.shellcheck]` lists `src` which holds no shell scripts at all. Add a `[processor.script.<name>]` instance with `src_dirs = ["src", "scripts"]`, `src_extensions = [".R"]` that at least parses each file (`Rscript -e 'invisible(parse(file = commandArgs(TRUE)[1]))'` or lintr), and narrow shellcheck to `["scripts"]`.

## Medium

- `src/exercises/mean/solution3.R:14` - `mymean` starts with `return(7)`, so it always prints 7 and lines 15-19 are dead code; remove the stray return.
- `src/examples/performance/system_time.R:6` - `x %/% 2 == 0` is integer division (true only for x = 1), not the intended even test; use `x %% 2 == 0`. Same bug at `src/examples/performance/snow.R:8`.
- `src/examples/basic_types/logical.R:46` - the line evaluating `TRUE & FALSE` is labelled "TRUE & TRUE is", so the output shows `TRUE & TRUE is FALSE`; same mislabel for `&&` at line 51.
- `scripts/install.R:8` - installs packages from `http://cran.rstudio.com/` over plain HTTP; use `https://cloud.r-project.org/`.

## Low

- `src/examples/performance/snow.R:20` - the SOCK cluster is never shut down; add `stopCluster(c)`, and drop the stray no-op `y` at line 9.
- `src/examples/functional_programming/lapply.R:3` - comment says it is an example of `replicate`, but the file demonstrates `lapply`.
- `src/examples/cluster_analysis/basic.R:37` - section titled "Ward Hierarchical Clustering" but the Ward call is commented out (line 40) and default `hclust(d)` (complete linkage) runs; also the reference at line 9 points to the bar-graph page. Same wrong `graphs/bar.html` reference / "pie charting" header is copy-pasted into `src/examples/plotting/05_line_chars.R:3` and `07_boxplots.R:3`.
- `src/examples/plotting/01_to_pdf.R:11` - comments say output goes to `/tmp/output.pdf` but the active device is `svg("/tmp/output.svg")` at line 13, and `dev.off()` is never called so the file may be left incomplete.
- `README.md:1` - hand-written two-line README rather than the fleet `tera.templates/README.md.tera`; does not mention the examples/exercises layout or the required packages (`snow`, `sm`, `plotrix`, `vioplot`, `aplpack`).
