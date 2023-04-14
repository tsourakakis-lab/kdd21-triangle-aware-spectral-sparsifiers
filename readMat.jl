using MAT
using SparseArrays

function readMat( filename::AbstractString )
    file = matopen( filename )
    adjacency = read( file, "network")
    close(file)
    println(typeof(adjacency))
    return adjacency
end
