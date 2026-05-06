library(DiagrammeR)
library(DiagrammeRsvg)
library(rsvg)
library(magrittr)

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