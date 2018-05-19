task TestBam {
  File bam
  Int expected_records
  Int required_disk = ceil(size(bam, "G") * 1.2)

  command {

    # catch errors
    -eo pipefail

    N_RECORDS=$(samtools view "${bam}" | wc -l)
    if [ $N_RECORDS != "${expected_records}" ]; then
        >&2 echo "Number of records in the pipeline output ($N_RECORDS) did not match the expected number (${expected_records})"
        exit 1
    fi

    # test flag abundances
    # test aligned read number
    # test unaligned read number
    # test multi-aligned read number
    # make some kind of report

  }

  runtime {
    docker: "quay.io/humancellatlas/secondary-analysis-samtools:v0.2.2-1.6"
    cpu: 1
    memory: "3.75 GB"
    disks: "local-disk ${required_disk} HDD"
  }
}


task TestCountMatrix {
  File count_matrix

  command {
    # test total number of aligned reads
    # test total number of columns
    # test total number of rows
  }
}