"""
Return the profit for the firm in the market.

# Arguments:
- `price::Integer`: Price of the firm
- `all_prices::Array{Integer,1}`: All prices in the market in the given round
- `p::SimParams`: Market parameter
"""
function calc_reward(price::Integer, all_prices::Array{Int64,1}, p::SimParams)

    # Get the market price
    market_price = minimum(all_prices)

    # Check how many firms joint play the market price
    n_winner = count(x->x==market_price,all_prices)

    # Caluclate profits for the firm accordingly
    if price > p.reservation_price
        reward = 0.0
    elseif price == market_price
        reward =  (1 / n_winner) * price * p.m_consumer
    else
        reward =  0.0
    end
    return reward::Float64
end