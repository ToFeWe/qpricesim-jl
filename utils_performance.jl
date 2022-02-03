"""
A function to get the optimality in a given state.
"""
function get_specific_optimality(optimal_q, actual_q, state)
    return maximum(actual_q[state,:]) ./ maximum(optimal_q[state,:])
end

"""
Function that calculates the share of states in which the agents best response
is equivalent to the best response of the optimal agent. In other words, what is
the share of NE it plays for all states. If the value is equal to one, it found
a SPNE.

TODO: Should I account for the fact that in the optimal q matrix it can happen that there are multiple
best actions for a given state?
"""
function best_response_share(optimal_q, actual_q)
    _, br_optimal = findmax(optimal_q, dims=2)
    _, br_actual = findmax(actual_q, dims=2)
    return mean(br_actual .== br_optimal)
end

""" 
Calculate the profitability for the integer state *state* 
"""
function get_specific_profitability(actual_q, state)
    return maximum(actual_q[state,:])
end

""" 
Calculates the average profitability over the entire state space. 
"""
function get_average_profitability(actual_q)
    max_actual, _ = findmax(actual_q, dims=2)
    return mean(max_actual)
end

    
""" 
Get the profitability, given by the value of all states, weighted by its optimality.
"""
function get_weighted_profitability(optimal_q, actual_q)
    avg_profit_actual = get_average_profitability(actual_q)
    br_share = best_response_share(optimal_q, actual_q)
    return br_share * avg_profit_actual
end