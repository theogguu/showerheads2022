#!/bin/bash
#SBATCH --account p31750
#SBATCH --partition normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --time=6:00:00
#SBATCH --mem-per-cpu=10gb
#SBATCH --job-name="sgz6911 quast"
#SBATCH --mail-user=stevengu2024@u.northwestern.edu
#SBATCH --mail-type=ALL

#load modules
module purge all
module load anaconda3
module load quast

cd ~/Practice/Spades_Output
quast.py --threads 12 -o QUAST_OUTPUT scaffolds.fasta

