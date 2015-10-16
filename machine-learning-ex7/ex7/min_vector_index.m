function i = min_vector_index(v)
  t=min(v);
  i=0;
  for ii=1:size(v,2)
    if (v(ii)==t)
      i=ii;
      break;
    end
  end 
end 