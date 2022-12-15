#!/bin/bash
#SBATCH --account p31750
#SBATCH --partition normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --time=6:00:00
#SBATCH --mem-per-cpu=10gb
#SBATCH --job-name="prodigalt" 
#SBATCH --mail-user=stevengu2024@u.northwestern.edu
#SBATCH --mail-type=ALL

#load modules
module purge all
module load anaconda3

#change working directory to bins folder 
cd ~/Practice/INITIAL_BINNING/metabat2_bins/

#mkdir renames

source activate prodigal #this env includes prodigal.
for i in {1..10} #you could control the output of metabin2/metawrap
do
	#cp bin.$i.fa bin.$i.fna
	#mv bin.$i.fna renames 	
	#cds (coding sequences)  and amino acids
	prodigal -a prodigal/bin.$i.mrna.faa -i renames/bin.$i.fna -o prodigal/bin.$i.genes.gff -f gff -p meta

done
source deactivate

