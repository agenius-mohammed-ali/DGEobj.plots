context("DGEobj.plots - tests for volcanoPlot.R functions")


test_that("volcanoPlot.R: volcanoPlot()", {
    skip_if(is.null(t_obj1$ReplicateGroupDesign_fit))

    contrastDF <- topTable(t_obj1$ReplicateGroupDesign_fit, number = 100)
    volcano_plot <- volcanoPlot(contrastDF, logRatioCol = "adj.P.Val")
    expect_s3_class(volcano_plot, c("canvasXpress", "htmlwidget"))

    volcano_plot <- volcanoPlot(contrastDF, logRatioCol = "adj.P.Val", plotType = "ggplot")
    expect_s3_class(volcano_plot, c("gg","ggplot"))

    contrastDF$GeneSym <- rep(c("sym1", "sym2","sym3","sym4"),nrow(contrastDF)/4)
    volcano_plot <- volcanoPlot(contrastDF         = contrastDF,
                                title              = "Plot Title",
                                logRatioCol        = "adj.P.Val",
                                geneSymCol         = "GeneSym",
                                geneSymLabels      = c("sym1", "sym2"),
                                xlab               = "XLabel",
                                ylab               = "YLabel",
                                pthresholdLine     = "blue",
                                footnote           = "This is footnote")

    expect_s3_class(volcano_plot, c("canvasXpress", "htmlwidget"))

    volcano_plot <- volcanoPlot(contrastDF         = contrastDF,
                                title              = "Plot Title",
                                logRatioCol        = "adj.P.Val",
                                geneSymCol         = "GeneSym",
                                geneSymLabels      = c("sym1", "sym2"),
                                xlab               = "XLabel",
                                ylab               = "YLabel",
                                pthresholdLine     = "blue",
                                footnote           = "This is footnote",
                                plotType           = "ggplot")

    expect_s3_class(volcano_plot, c("gg","ggplot"))

    expect_error(volcanoPlot(contrastDF, logRatioCol = "xyz"),
                 regexp =  "logRatioCol column not found in contrastDF.")
    expect_error(volcanoPlot(contrastDF, logRatioCol = "adj.P.Val", logIntCol = "xyz"),
                 regexp =  "logIntCol column not found in contrastDF.")
    expect_error(volcanoPlot(contrastDF, logRatioCol = "adj.P.Val", pvalCol = "xyz"),
                 regexp = "pvalCol column not found in contrastDF.")
    expect_error(volcanoPlot(contrastDF, logRatioCol = "adj.P.Val", symbolSize = 2),
                 regexp = "All specified symbol arguments must be of length 3, including symbolSize, symbolShape, symbolColor, and symbolFill.")
    expect_error(volcanoPlot(contrastDF, logRatioCol = "adj.P.Val", plotType = "cx"),
                 regexp =  "Plot type must be either canvasXpress or ggplot.")

})
