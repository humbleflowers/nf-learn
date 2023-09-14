#!/usr/bin/env nextflow

nextflow.enable.dsl=2

params.inputFile= file('input.txt')

process convertToLowerCase {
    input:
    file inputFile

    output:
    file 'output.txt'

    script:
    """
    cat ${inputFile} | tr '[:lower:]' '[:upper:]' > output.txt
    """
}

workflow {
    inputFile = Channel.fromPath(params.inputFile)

    convertToLowerCase(inputFile)
}
