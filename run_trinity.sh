#!/bin/bash
#SBATCH --partition=cahnrs_bigmem
#SBATCH --nodes=1
#SBATCH --ntasks=20
#SBATCH --mem=198000
#SBATCH --job-name=trinity
#SBATCH --error=/home/zhen.fu/genomic_data/cpb/Yang_pear/trinity_e
#SBATCH --output=/home/zhen.fu/genomic_data/cpb/Yang_pear/trinity_o
#SBATCH --time=7-00:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=zhen.fu@wsu.edu

module load bowtie/1.1.2
module load bowtie2/2.3.4
module load samtools/1.6

export PATH=$PATH:/data/cahnrs/bioinfo/RSEM-1.2.29
export PERL5LIB=/home/zhen.fu/my_perl5_modules/share/perl5


### this is the script runs Trinity
cd /home/zhen.fu/genomic_data/cpb/Yang_pear
export PATH=$PATH:/data/cahnrs/entomology/trinity/Trinity-v2.8.3
export PATH=$PATH:/home/zhen.fu/jellyfish-2.2.7/bin
Trinity \
--seqType fq --max_memory 198G \
--samples_file /home/zhen.fu/genomic_data/pear/Trinity/library_info \
--CPU 20 \
--output ./Trinity_283_cov200 \
--normalize_max_read_cov 200 \
--min_kmer_cov 2 \
--full_cleanup


## this is the script quantify the gene expression for each sample using Trinity's utility script
/data/cahnrs/entomology/trinity/Trinity-v2.8.3/util/align_and_estimate_abundance.pl \
--transcripts /home/zhen.fu/genomic_data/pear/Trinity/def_cov200/Trinity_283_cov200.Trinity.fasta \
--seqType fq \
--samples_file /data/cahnrs/entomology/daisy_fu/pear/Trinity/library_info \
--est_method RSEM \
--aln_method bowtie2 \
--thread_count 20 \
--gene_trans_map /home/zhen.fu/genomic_data/cpb/Yang_pear/Trinity/def_cov200/Trinity_283_cov200.Trinity.fasta.gene_trans_map \
--prep_reference \
--output_dir rsem_quan_cov200

## this is the script that combine count number of each sample and combine them into a matrix
/data/cahnrs/entomology/trinity/Trinity-v2.8.3/util/abundance_estimates_to_matrix.pl \
--est_method RSEM \
--cross_sample_norm TMM \
--out_prefix rsem_cov200 \
--gene_trans_map /home/zhen.fu/genomic_data/pear/Trinity/def_cov200/Trinity_283_cov200.Trinity.fasta.gene_trans_map \
--name_sample_by_basedir \
/home/zhen.fu/genomic_data/pear/Trinity/CO1/RSEM.isoforms.results \
/home/zhen.fu/genomic_data/pear/Trinity/CO2/RSEM.isoforms.results \
/home/zhen.fu/genomic_data/pear/Trinity/CO3/RSEM.isoforms.results \
/home/zhen.fu/genomic_data/pear/Trinity/S1/RSEM.isoforms.results \
/home/zhen.fu/genomic_data/pear/Trinity/S2/RSEM.isoforms.results \
/home/zhen.fu/genomic_data/pear/Trinity/S3/RSEM.isoforms.results \



