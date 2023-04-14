using SparseArrays
using LinearAlgebra
using Laplacians
using BenchmarkTools
using MatrixNetworks

include("graph_io.jl")
include("readMat.jl")
include("ERSlim.jl")
include("readFile.jl")

function experiments()
#  for dataset in ["Facebook.txt", "ca-GrQc.txt","ca-CondMat.txt","ca-HepPh.txt","Email-Enron.txt","CA-AstroPh.txt","com-amazon.ungraph.txt","com-dblp.ungraph.txt", "com-youtube.ungraph.txt"]
  for dataset in ["Flickr.mat", "BlogCatalog.mat","PPI.mat"]  
    graph_filename = dataset
    A = readFile( graph_filename )
    A,_ = largest_component(A)
    n = size(A,1)
    A[diagind(A)] = zeros(n,1) 
    println( graph_filename )
    for ep_error in [0.25, 0.1]
      println(ep_error)
      @btime effectiveResistan($A, $ep_error)
    end
  end
end
