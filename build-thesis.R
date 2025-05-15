# This script allows building the thesis from VS Code
# by calling the same functions as in the knit function
# defined in index.Rmd

# Source knit functions
source(file.path(getwd(), "scripts_and_filters", "knit-functions.R"))

# Get the command line arguments
args <- commandArgs(trailingOnly = TRUE)

# Check if the user provided an output format
if (length(args) > 0) {
  formats <- args
} else {
  formats <- "pdf"  # Default to PDF
}

# Print start message
cat("\nBuilding thesis in format(s):", paste(formats, collapse=", "), "\n")

# Build the thesis with the specified format(s)
knit_thesis("index.Rmd", formats)

# Print success message
cat("\nThesis built successfully in format(s):", paste(formats, collapse=", "), "\n")
cat("Output files are available in the 'docs/' folder.\n")
