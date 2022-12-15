#!/bin/bash
#SBATCH --account p31750
#SBATCH --partition normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --time=6:00:00
#SBATCH --mem-per-cpu=10gb
#SBATCH --job-name="sgz6911 metawrap binning4"
#SBATCH --mail-user=stevengu2024@u.northwestern.edu
#SBATCH --mail-type=ALL

#load modules
module purge all
module load anaconda3
module load metawrap
module load bwa
module load samtools

#change working directory to Practice folder 
cd ~/Practice/

#this conda env includes metabat2.
source activate metawrap

#execute command. 14fastp_out*fq.gz grabs the first and second read.
metawrap binning -o INITIAL_BINNING -t 12 -a Spades_Output/scaffolds.fasta --metabat2 testing_fastp_temp/NTM*fastq

source deactivate
