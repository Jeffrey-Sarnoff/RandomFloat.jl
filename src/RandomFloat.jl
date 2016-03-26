module RandomFloat

export randfloat

@
for (F,I) in ((:Float16, :Int16), (:Float32, :Int32), (:Float64, Int64))
  @eval begin
    function randfloat(r::FloatRange{$F}=sqrt(eps(one($F))):(one($F)/sqrt(eps(one($F)))), dims...)
      firstIsNeg = signbit(first(r))
      lastIsNeg  = signbit(last(r))
      if !firstIsNeg
        lo = reinterpret($I,first(r))
        hi = reinterpret($I,last(r))
        reinterpret($F, rand(lo:hi, dims...)
        #step = reinterpret($I, eps(eps(last(r)))/2)
        #reinterpret($F, rand(lo:step:hi, dims...))
      elseif lastIsNeg
        -randfloat((-last(r)):(-first(r)), dims...)
      else 
        throw(ArgumentError("expecting range to be negative or positive, not mixed"))
      end
    end
  end
end

end # module
