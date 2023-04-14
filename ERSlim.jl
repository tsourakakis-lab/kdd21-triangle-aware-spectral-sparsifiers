using SparseArrays
using LinearAlgebra
using Laplacians
using BenchmarkTools

include("graph_io.jl")
include("readMat.jl")

function effectiveResistan(a::SparseMatrixCSC{Float64,Int64}, ep::Float64; solver_tol=1e-5)
  if solver_tol > 1
    @warn "Calling sparsify with ep > 1 can produce a disconnected graph."
  end
  
  f = approxchol_lap(a,tol=solver_tol);

  n = size(a,1)
  U = wtedEdgeVertexMat(a)
  m = size(U,1)

  (ai,aj,av) = findnz(triu(a))
  
  k = round(Int, 1.0*log(n)/(ep^2)) # number of dims for JL
  er = zeros(size(av))

  for i in 1:k
    R = randn(Float64, m,1)
    UR = U'*R;
    V = f(UR[:,1])

    for h in 1:length(av)
      i = ai[h]
      j = aj[h]
      er[h] = er[h] + av[h]* (norm(V[i]-V[j])^2/k)
    end
  end
  return  
end
