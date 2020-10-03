rule bbduk:
    input:
        fq1="hic_data/{sample}_R1.fastq",
        fq2="hic_data/{sample}_R2.fastq",
    output:
        out1="trimmed_reads/{sample}_R1.clean.fastq",
        out2="trimmed_reads/{sample}_R2.clean.fastq",
    params:
        "ref={} {}".format(config["trimming"]["adapters"], config["params"]["bbduk"])
    shell:
        "bbduk.sh in={input.fq1} in2={input.fq2} out={output.out1} out2={output.out2}"
