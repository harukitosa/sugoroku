# import Pkg; Pkg.add(["StatsBase"])

module qubit
    export Qubit, Measure
    using StatsBase, BitBasis
    struct Qubit
        _n_bits
        _states
        _amp
    end

    # function Qubit(n_bit)
    #     _n_bits = n_bit
    #     _states = 2^n_bit
    #     _amp = zeros(ComplexF64, _states)
    #     _amp[1] = 1
    #     return Qubit(_n_bits, _states, _amp)
    # end

    function Qubit(number, bits)
        _n_bits = number
        _states = 2^number
        _amp = zeros(ComplexF64, _states)
        idx = parse(Int, bits; base=2)
        _amp[idx+1] = 1
        return Qubit(_n_bits, _states, _amp)
    end


    function q_abs(num)
        return abs(num)^2
    end

    function Measure(qubit)
        p = q_abs.(qubit._amp)
        len = length(qubit._amp)
        wv = Weights(vec(p))
        r = sample(1:len, wv, 1)
        idx = r[1]
        _states = 2^qubit._n_bits
        amp = zeros(Int32, _states)
        amp[idx] = 1
        return amp
    end
end
