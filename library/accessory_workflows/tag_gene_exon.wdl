import "TagGeneExon.wdl" as tag

workflow tag_gene_exon {
  File bam_input
  File annotations_gtf

  call tag.TagGeneExon {
    input:
      bam_input = bam_input,
      annotations_gtf = annotations_gtf
  }

  output {
    File bam_output = TagGeneExon.bam_output
  }
}
