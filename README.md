# Triangle-aware Spectral Sparsifiers and Community Detection (KDD 2021) 
## Konstantinos Sotiropoulos and Charalampos E. Tsourakakis 


The code to replicate the key results for our paper is offered in the form of a Jupyter Notebook.

To run the code the following are required:
1) Matlab and a Matlab API for Python
   https://www.mathworks.com/products/matlab/matlab-and-python.html
   [Note that by the time experiments where conducted, Matlab engine
   was only available for Python2 versions, thus the kernel of the notebook
   needs to be set in a Python2 version.]
2) The CMG solver for symmetric diagonally dominant linear systems
   https://www.cs.cmu.edu/~jkoutis/cmg.html 
3) The MACE library for listing k-cliques
   http://research.nii.ac.jp/~uno/code/mace22.zip
   http://research.nii.ac.jp/~uno/code/mace.html

   [Note that MACE.c has a bug and does not read -u argument for upper clique size limit 
   (It can be fixed by setting this to 3 in the source code - otherwise the argument list 
   should be changed accordingly. E.g. by modyfiying line 73, as follows:
   case 'l': II->lb = atoi (argv[c+1]); II->ub = 3;) 

4) The METIS graph partitioning library
   http://glaros.dtc.umn.edu/gkhome/metis/metis/download


To replicate results from Table 1 using the fastest available implementations:

1) For triangle listing, we use a modified version of: https://www-complexnetworks.lip6.fr/~latapy/Triangles/
that also calculates the number of triangles per edge.
A. Compile the file triangle_listing.c as follows:
gcc -O3 triangle_listing.c -o triangle_listing
B. Run the code as follows:
time ./triangle_listing -cf -c < blogcatalog_latapy.txt
(If you also want to print the number of triangles per edge, change -c to -r)

2) For calculating Effective Resistance, using Julia:
A. Install the Laplacians package from here:
https://github.com/danspielman/Laplacians.jl
B. Add all *.jl files from the current folder to the src/
folder from above
C. While inside the src/ folder type in the command line:

julia

and subsequently

include("experiments.jl")
experiments()

D. Note that other julia packages may need to be installed as well.
(e.g. BenchmarkTools that reports the running time of a function)
