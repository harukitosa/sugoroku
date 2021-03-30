module sugoroku
include("qubit.jl")
using .qubit
greet() = print("Hello World!")

e = Qubit(3, "101")
println(e)
println(e._amp)
println(e._n_bits)
println(e._states)

f = Measure(e)
println(f)
end # module
