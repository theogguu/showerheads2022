#!/bin/bash
#SBATCH --account p31750
#SBATCH --partition normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --time=6:00:00
#SBATCH --mem-per-cpu=10gb
#SBATCH --job-name="eggnog" 
#SBATCH --mail-user=stevengu2024@u.northwestern.edu
#SBATCH --mail-type=ALL

#load modules
module purge all
module load anaconda3
#module load diamond
module load eggnog-mapper

#change working directory to ordigal folder 
cd ~/Practice/INITIAL_BINNING/metabat2_bins/prodigal/eggnog

source activate diamondr
#for i in ../*faa 
#do	
#	emapper.py -i $i -o e_annotate_$i -m diamond --cpu 20 --dmnd_iterate no 
#done
emapper.py -i ../bin.1.mrna.faa -o e_annotate_1 -m diamond --cpu 20 
conda deactivate

