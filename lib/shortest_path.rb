def knight_moves(statr_pos, target_pos)

    # Possible night moves
    moves = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [2, 1], [2, -1], [1, 2], [1, -2]]

    # Nested queue consisting of pos and path
    queue = [[statr_pos, [statr_pos]]]
    
    # Hash to keep track of visited squares
    visited = {statr_pos => true}

    # 
    while !queue.empty?
        # Dequeue
        pos, path = queue.shift

        # Base case
        return path if pos == target_pos

        #
        moves.each do |move|
            next_pos = [pos[0] + move[0], pos[1] + move[1]]

            # Check if next move is valid and not visited
            if valid_move?(next_pos) && !visited[next_pos]
                visited[next_pos] = true
                queue.push([next_pos, path + [next_pos]])
            end
        end
    end
    return -1
end

# Helper function
def valid_move?(pos)
    pos.all?{|coordinate| coordinate.between?(0, 7)}
end

p knight_moves([3,3],[4,3])