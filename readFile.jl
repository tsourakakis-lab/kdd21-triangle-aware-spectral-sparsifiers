function readFile( graph_filename::AbstractString )
  if endswith(graph_filename,"txt") # snap dataset
    a,_ = read_undir_graph_txt(graph_filename, true)
  else
    a = readMat( graph_filename )
  end
  return a
end
