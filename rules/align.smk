rule bwa_map:
    input:
        ref=samples["genome"], #placeholder
        fq1="hic_data/{sample}_R1.clean.fastq"
        fq2="hic_data/{sample}_R2.clean.fastq"
    output:
        "bams/{sample}.bam"
    shell:
        "bwa mem -5SP {ref} {input.fq1} {input.fq2} | samblaster | samtools view -h -b -F 2316 > {output}"
