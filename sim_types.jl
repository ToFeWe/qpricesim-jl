
"""
The parameters required for the simulation.

# Fields:
- n_firms: Number of firms in the market
- min_price: Minimal price
- max_price: Maximal price
- reservation_price: reservation price of the consumers
- m_consumer: Number of consumers in the market
- k_memory: Memory of the agent
- beta: Exploration decay of the agent
- discount_rate: Discount rate as in any economic model
- alpha: Learning rate
- max_t: Maximal number of learning iterations
- rounds_convergence: Number of rounds to determine convergence
- optimality_threshold: Threshold to determine convergence for q*
"""
Base.@kwdef struct SimParams
    n_firms::Int64
    min_price::Int64
    max_price::Int64
    reservation_price::Int64
    m_consumer::Int64
    k_memory::Int64
    beta::Float64
    discount_rate::Float64
    alpha::Float64
    max_t::Int64
    rounds_convergence::Int64
    optimality_threshold::Float64
end