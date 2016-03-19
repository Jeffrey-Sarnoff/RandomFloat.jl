module RandomFloat

import Base:ldexp

export randfloat

@vectorize_2arg Any ldexp

function randfloat{T<:AbstractFloat}(sigRange::FloatRange{T},expRange::UnitRange{Int},n::Int)
   s = rand(sigRange,n)
   e = rand(expRange,n)
   ldexp(s,e)   
end

end # module
