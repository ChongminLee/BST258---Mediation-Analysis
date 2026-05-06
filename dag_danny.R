library(DiagrammeR)
library(DiagrammeRsvg)
library(rsvg)
library(magrittr)

#Robins
# Helper function to save a grViz object as PNG
save_grviz_png <- function(gr, filename) {
  gr %>%
    export_svg() %>%
    charToRaw() %>%
    rsvg_png(filename)
}

# --------------------------------------------------
# DAG 1: Basic mediation DAG
# X -> Z -> D and X -> D
# --------------------------------------------------
dag1 <- grViz("
digraph dag1 {
  graph [layout = dot, rankdir = LR]

  node [shape = circle, style = filled, fillcolor = white, fontsize = 18]

  X [label = 'X\\nSmoking']
  Z [label = 'Z\\nHyperlipidemia']
  D [label = 'D\\nCVD']

  X -> Z
  Z -> D
  X -> D
}
")

save_grviz_png(dag1, "BST258_slides/robins_dag1_basic.png")


# --------------------------------------------------
# DAG 2: Mediator-outcome confounding
# U -> Z, U -> D, with X randomized
# --------------------------------------------------
dag2 <- grViz("
digraph dag2 {
  graph [layout = dot, rankdir = LR]

  node [shape = circle, style = filled, fillcolor = white, fontsize = 18]

  X [label = 'X\\nSmoking']
  Z [label = 'Z\\nHyperlipidemia']
  D [label = 'D\\nCVD']
  U [label = 'U\\nUnmeasured\\nRisk']

  X -> Z
  Z -> D
  X -> D
  U -> Z
  U -> D
}
")

save_grviz_png(dag2, "BST258_slides/robins_dag2_confounding.png")


# --------------------------------------------------
# DAG 3: Exposure-induced mediator-outcome confounder
# X -> L -> Z -> D, X -> D, and L -> D
# --------------------------------------------------
dag3 <- grViz("
digraph dag3 {
  graph [layout = dot, rankdir = LR]

  node [shape = circle, style = filled, fillcolor = white, fontsize = 18]

  X [label = 'X\\nSmoking']
  L [label = 'L\\nPost-exposure\\nconfounder']
  Z [label = 'Z\\nHyperlipidemia']
  D [label = 'D\\nCVD']

  X -> L
  L -> Z
  Z -> D
  X -> D
  L -> D
}
")

save_grviz_png(dag3, "BST258_slides/robins_dag3_postexp.png")

















# Pearl

save_grviz_png <- function(gr, filename) {
  gr %>%
    export_svg() %>%
    charToRaw() %>%
    rsvg_png(filename)
}

# --------------------------------------------------
# DAG 1: Basic mediation structure
# X -> Z -> Y and X -> Y
# --------------------------------------------------
pearl_dag1_basic <- grViz("
digraph pearl_dag1 {
  graph [layout = dot, rankdir = LR]

  node [shape = circle, style = filled, fillcolor = white, fontsize = 18]

  X [label = 'X\\nExposure']
  Z [label = 'Z\\nMediator']
  Y [label = 'Y\\nOutcome']

  X -> Z
  Z -> Y
  X -> Y
}
")

save_grviz_png(pearl_dag1_basic, "BST258_slides/pearl_dag1_basic.png")


# --------------------------------------------------
# DAG 2: Mediation formula with covariates S
# S blocks confounding between X and Z
# --------------------------------------------------
pearl_dag2_mediation_formula <- grViz("
digraph pearl_dag2 {
  graph [layout = dot, rankdir = LR]

  node [shape = circle, style = filled, fillcolor = white, fontsize = 18]

  X [label = 'X']
  Z [label = 'Z']
  Y [label = 'Y']
  S [label = 'S\\nCovariates']

  S -> X
  S -> Z
  X -> Z
  Z -> Y
  X -> Y
}
")

save_grviz_png(pearl_dag2_mediation_formula, "BST258_slides/pearl_dag2_mediation_formula.png")


# --------------------------------------------------
# DAG 3: Path-specific effect example inspired by Pearl Figure 3
# Heavy path: X -> Z -> W -> Y
# Additional paths: X -> W, Z -> Y
# --------------------------------------------------
pearl_dag3_path_specific <- grViz("
digraph pearl_dag3 {
  graph [layout = dot, rankdir = LR]

  node [shape = circle, style = filled, fillcolor = white, fontsize = 18]

  X [label = 'X']
  Z [label = 'Z']
  W [label = 'W']
  Y [label = 'Y']

  X -> Z [penwidth = 3]
  Z -> W [penwidth = 3]
  W -> Y [penwidth = 3]

  X -> W
  Z -> Y
}
")

save_grviz_png(pearl_dag3_path_specific, "BST258_slides/pearl_dag3_path_specific.png")
