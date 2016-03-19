module RandomFloat

import Base:ldexp

export randfloat

@vectorize_2arg Any ldexp

function randfloat{T<:AbstractFloat}(sigRange::FloatRange{T}=sqrt(eps(1.0)):1.0,
                                     expRange::UnitRange{Int}=14:37,
                                     n::Int=10)
   s = rand(sigRange,n)
   e = rand(expRange,n)
   ldexp(s,e)   
end

end # module
