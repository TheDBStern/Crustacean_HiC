SAMPLES = {}

rule bbduk_clean:

rule bwa:

  bash:
    "bwa mem -5SP [assembly.fasta] [fwd_hic.fastq] [rev_hic.fastq] | samtools view -S -h -b -F 2316 > [aligned.bam]"
