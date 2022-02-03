"""
A function to map price indices to the actual prices.
Note that we only consider the prices discussed in the paper.
"""
function index_to_price(index)
    return map(x -> x - 1, index)
end

"""
A function to map actual prices to price indices.
Note that we only consider the prices discussed in the paper.
"""
function price_to_index(price)
    return map(x -> x + 1, price)
end


"""
Creates a set of variables that we use for the simulation.

# Returns:
- `all_prices::UnitRange{Int64}`: Array of all price
- `all_price_states::Array`: Array of tuples with all price states
- `n_states::Int64`: Number of possible states 
- `n_actions::Int64`: Number of possible actions
"""
function create_vars(p::SimParams)
    all_prices = p.min_price:p.max_price
    n_actions = size(all_prices)[1]
    all_price_states = collect(Base.product([all_prices for _ in 1:p.n_firms]...))
    n_states = prod(size(all_price_states))
    return all_prices, all_price_states, n_states, n_actions
end

"""
Creates dictionaries to translate index states into price states and vice versa.

# Arguments:
- `all_price_states::Array`: Array of tuples with all price states
- `n_states::Int64`: Number of possible states
"""
function create_transition_dict(all_price_states::Array, n_states::Int64)
    int_to_price_state = Dict()
    price_state_to_int = Dict()
    for i in 1:n_states
        price_state_to_int[all_price_states[i]] = i
        int_to_price_state[i] = all_price_states[i]
    end
    return int_to_price_state, price_state_to_int
end