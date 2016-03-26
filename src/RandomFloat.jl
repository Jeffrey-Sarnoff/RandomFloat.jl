module RandomFloat

import Base:ldexp

export randfloat

@vectorize_2arg Any ldexp

function randfloat(r::FloatRange{Float64}=sqrt(eps(1.0)):(1.0/sqrt(eps(1.0))), dims...)
   firstIsNeg = signbit(first(r))
   lastIsNeg  = signbit(last(r))
   if !firstIsNeg
      lo = reinterpret(Int64,first(r))
      hi = reinterpret(Int64,last(r))
      [reinterpret(Float64,x) for x in rand(lo:hi, dims...)]
   elseif lastIsNeg
      -randfloat((-last(r)):(-first(r)), dims...)
   else 
      negs = randfloat(first(r)::0.0, dims...)
      poss = randfloat(0.0:last(r), dims...)
      [negs...,poss...]
   end
end

end # module
