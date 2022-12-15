#!/bin/bash
#SBATCH --account p31750
#SBATCH --partition normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --time=6:00:00
#SBATCH --mem-per-cpu=10gb
#SBATCH --job-name="sgz6911 test"
#SBATCH --mail-user=stevengu2024@u.northwestern.edu
#SBATCH --mail-type=ALL

###load modules
module purge all
module load anaconda3

## cd
cd ~/Practice
#############
### Fastp ###
#############

source activate fastp

fastp -i NTM00014_S55_R1_001.fastq.gz -I NTM00014_S55_R2_001.fastq.gz -o 14fastp_out_1.fastq -O 14fastp_out_2.fastq --detect_adapter_for_pe --thread 16 --length_required 50

source deactivate


