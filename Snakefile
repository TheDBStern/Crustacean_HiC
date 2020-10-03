import pandas as pd
from snakemake.utils import validate, min_version
##### set minimum snakemake version #####
min_version("5.1.2")


##### load config and sample sheets #####

configfile: "config.yaml"

samples = pd.read_table(config["samples"]).set_index("sample", drop=False)


##### target rules #####

rule all:
    input:
        expand(["results/diffexp/{contrast}.diffexp.tsv",
                "results/diffexp/{contrast}.ma-plot.svg"],
               contrast=config["diffexp"]["contrasts"]),
        "results/pca.svg",
        "qc/multiqc_report.html"


##### load rules #####

include: "rules/trim.smk"
