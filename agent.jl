using Random
using Statistics

"""
A collection of function that describe a q-learning agent.
"""

"""
A function to get the index of the best action for a given q-matrix.

# Arguments:
- `q_matrix::Matrix{Float64}`: Q-matrix of the agent
- `state::Integer`: Current state in its integer representation
"""
function get_best_action(q_matrix::Matrix{Float64}, state::Integer)
    return argmax(q_matrix[state,:])::Integer
end


"""
Picks and returns an action for the agent using the epsilon-greedy algorithm.

# Arguments:
- `q_matrix::Matrix{Float64}`: Q-matrix of the agent
- `state::Integer`: Current state in its integer representation
- `epsilon::Float64`: Probability to pick a random action (epsilon greedy)
- `n_actions::Int`: Number of possible n_actions
- `local_RNG::MersenneTwister`: Random state
"""
function get_action(q_matrix::Matrix{Float64}, state::Integer, epsilon::Float64, n_actions::Int, local_RNG::MersenneTwister)
    random_draw = rand(local_RNG)
    if random_draw < epsilon
        chosen_action = rand(local_RNG, 1:n_actions)
    else
        chosen_action = get_best_action(q_matrix, state)
    end
    return chosen_action
end



""" 
A function to update the q-matrix of an agent for a tuple of <state, action, reward, next_state> inplace.

# Arguments:
- `q_matrix::Matrix{Float64}`: Q-matrix of the agent
- `state::Integer`: Current state
- `action::Integer`: Current action
- `reward::Float64`: Current reward
- `next_state::Integer`: Continuation state
- `p::SimParams`: Market/simulation parameter
"""
function update(q_matrix::Matrix{Float64}, state::Integer, action::Integer,
                reward::Float64, next_state::Integer, p::SimParams)

    # Update inplace the Q-matrix
    q_matrix[state, action] = ((1 - p.alpha) * q_matrix[state, action] + 
                                p.alpha * (reward + p.discount_rate * maximum(q_matrix[next_state,:]))
                                )
    return q_matrix
end

"""
A function to caluclate the exploration rate for the epsilon greedy algorithm.

# Arguments:
- `t::Int64`: Current period
- `beta::Float64`: Exploration decay parameter 
"""
function calc_epsilon(t::Int64, beta::Float64)
    return MathConstants.e ^ (-beta * t)::Float64
end