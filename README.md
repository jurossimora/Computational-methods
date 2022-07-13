# 2022 Scientific Computing Intro

Welcome! This is a demo repository with the example of a data analysis' project using R.

## Project structure

```
project/
*    ├── data/
*    │   ├── raw
*    │   └── processed
     ├── docs/
*    ├── figs/
     ├── R/
*    ├── output/
*    └── README.md
```
In the `R` directory you will find the scripts. Let's start using R!

ok

organizing a script:

- a header containing who, how, when, where, and why METADATA

  this is code to...

- a part loading all needed packages from the begining with library()*

  "library(ggplot2)"

- reads needed data (empty workspace)

- Coding a variable that will not change

- Commenting every step

- Writing in the HD the result from each step

- the script must be able to be run in sequence from start to finish.

  No repetitions,
  No lines out of order
  No parentheses or non-closing calls (png ---> dev.off())
  
- You should be able to erase the workspace mid-session and rebuild

- Do not define functions inside the script. Put the functions in a separate script and folder /fct/edit.R and call via source().

- use concise and informative names

  a <- NO
  
- do not use names already taken: cor <- (color) cor() c <-

- If you copy and paste more than three times it's time to write a loop or a function

