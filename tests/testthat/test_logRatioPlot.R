context("DGEobj.plots - tests for logRatioPlot.R functions")


test_that("logRatioPlot.R: logRatioPlot()", {
    suppressWarnings(skip_if(is.null(getType(t_obj1, "topTable"))))

    tidyDat <- tidyContrasts(t_obj1,
                             rownameColumn = "EnsgID",
                             includeColumns = c("logFC", "CI.R", "CI.L"))

    # Add gene symbols from geneData and select small set of genes for plotting
    ens2genesym <- data.frame("EnsgID" = row.names(t_obj1$geneData), t_obj1$geneData, row.names = NULL)
    ens2genesym <- ens2genesym[, c("EnsgID", "rgd_symbol")]
    colnames(ens2genesym) <- c("EnsgID", "GeneSymbol")

    tidyDat <- left_join(tidyDat, ens2genesym) %>% head(10)

    # Simple barplot
    log_ratio_plot <- logRatioPlot(contrastsDF  = tidyDat,
                                   facetColname = "GeneSymbol",
                                   xColname     = "Contrast",
                                   facetCol     = 2)
    expect_s3_class(log_ratio_plot, c("gg", "ggplot"))

    # Lineplot with some options
    log_ratio_plot <- logRatioPlot(contrastsDF  = tidyDat,
                                   plotType     = "point",
                                   facetColname = "GeneSymbol",
                                   xColname     = "Contrast",
                                   facetCol     = 4,
                                   scales       = "fixed",
                                   facet        = FALSE,
                                   title        = "Test",
                                   pointSize    = 4,
                                   lineLayer    = TRUE,
                                   lineSize     = 0.1,
                                   xAngle       = 60)
    expect_type(log_ratio_plot, "list")
    expect_s3_class(log_ratio_plot[[1]], c("gg", "ggplot"))

    expect_error(logRatioPlot(contrastsDF  = tidyDat,
                              facetColname = "GeneSymbol",
                              xColname     = "Contrast",
                              facetCol     = 2,
                              plotType     = "heatmap"),
                 regexp = "plotType must be either 'bar' or 'point'.")
    expect_warning(logRatioPlot(contrastsDF  = tidyDat,
                                facetColname = "GeneSymbol",
                                xColname     = "Contrast",
                                facetCol     = 2 ,
                                CI.R_colname = "xyz",
                                CI.L_colname = "xyz"),
                   regexp = "Confidence limits columns not found.")
})
