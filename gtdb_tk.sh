#!/bin/bash
#SBATCH --account p31750
#SBATCH --partition normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --time=6:00:00
#SBATCH --mem-per-cpu=10gb
#SBATCH --job-name="taxonomy/gtdb-tk" 
#SBATCH --mail-user=stevengu2024@u.northwestern.edu
#SBATCH --mail-type=ALL

#load modules
module purge all
module load anaconda3
module load gtdbtk/2.1.1

#change working directory to taxonomy folder
cd ~/Practice/INITIAL_BINNING/metabat2_bins/prodigal/eggnog/taxonomy

source activate emapper
for i in ls ../*faa 
do
	emapper.py -i $i -o e_annotate_$i -m diamond --cpu 20 --dmnd_iterate no 
done
source deactivate

