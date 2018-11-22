# trinity_treat_control
The most simple case of running Trinity RNA-seq assembly and quantify gene expression of two conditions
I used Kamiak from Wahsington State University to run these analyses (https://hpc.wsu.edu/)

The library_info contains the absolute path to the forward and reverse reads of each samples. For instance, this is what my treatment vs. control experiment with 3 biolgical replicates look like:

control	CO1	/home/genomic_data/pear/trimmed/CO1_trim_1.fq	/home/genomic_data/pear/trimmed/CO1_trim_2.fqc
control	CO2	/home/genomic_data/pear/trimmed/CO2_trim_1.fq	/home/genomic_data/pear/trimmed/CO2_trim_2.fq 	 
control	CO3	/home/genomic_data/pear/trimmed/CO3_trim_1.fq	/home/genomic_data/pear/trimmed/CO3_trim_2.fq
treatment	S1	/home/genomic_data/pear/trimmed/S1_trim_1.fq	/home/genomic_data/pear/trimmed/S1_trim_2.fq
treatment	S2	/home/genomic_data/pear/trimmed/S2_trim_1.fq	/home/genomic_data/pear/trimmed/S2_trim_2.fq
treatment	S3	/home/genomic_data/pear/trimmed/S3_trim_1.fq	/home/genomic_data/pear/trimmed/S3_trim_2.fq

