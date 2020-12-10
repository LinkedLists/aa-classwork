require_relative "piece"

module Slideable
    def cardinal_moves(pos)
        return horizontal_moves(pos) + vertical_moves(pos)
    end

    def diagonal_moves(pos)
        return right_to_left(pos) + left_to_right(pos)
    end

    private

    def horizontal_moves(pos)
        horizontal = []

        (pos[0] - 1).downto(0) do |row| 
            if board[row, pos[1]] == @null_piece
                break
            else
                horizontal << [row, pos[1]] 
            end
        end

        (pos[0] + 1).upto(7) do |row| 
            if board[row, pos[1]] == @null_piece
                break
            else
                horizontal << [row, pos[1]] 
            end
        end
        #[x, x, B, x, R, x, B, x]
        
        horizontal
    end

    def vertical_moves(pos)
        vertical = []

        (pos[0] - 1).downto(0) do |col| 
            if board[pos[0], col] == @null_piece
                break
            else
                vertical << [pos[0], col] 
            end
        end

        (pos[0] + 1).upto(7) do |col| 
            if board[pos[0], col] == @null_piece
                break
            else
                vertical << [pos[0], col] 
            end
        end
        vertical
    end
    
    def right_diagonal(pos)
        left_to_right = []
    
        (pos[0] + 1).upto(7) do |i|
            if board[i, i] == @null_piece
                break
            else
                left_to_right << [i, i] 
            end
        end

        (pos[0] - 1).downto(0) do |i|
            if board[i, i] == @null_piece
                break
            else
                left_to_right << [i, i] 
            end
        end

        left_to_right
    end
    
    def left_diagonal(pos)
        right_to_left = []
        length = board.length - 1
        # [i][length - i]
        (pos[1] + 1).downto(0) do |i|
            if board[i, length - i] == @null_piece
                break
            else
                right_to_left << board[length- i, i]
        end

        right_to_left - pos
    end
end



module Stepable
    
    def knight_moves(pos)
        possible_moves = [
            [1, 2],
            [1, -2],
            [2, 1],
            [2, -1],
            [-1, 2],
            [-1, -2],
            [-2, 1],
            [-2, -1]]

        moves = []
        possible_moves.each do |knight| 
            ret = [knight[0] + pos[0], knight[1] + pos[1]]
            moves << ret if 0 <= ret[0] && ret[0] <= 7 && 0 <= ret[1] && ret[1] <= 7
        end
        moves
    end

    def king_moves(pos)
        possible_moves = [
            [0, 1],
            [1, 0],
            [1, 1],
            [1, -1],
            [-1, 1],
            [0, -1],
            [-1, 0],
            [-1, -1]]

        moves = []
        possible_moves.each do |move| 
            ret = [move[0] + pos[0], move[1] + pos[1]]
            moves << ret if 0 <= ret[0] && ret[0] <= 7 && 0 <= ret[1] && ret[1] <= 7
        end
        moves
    end


end
