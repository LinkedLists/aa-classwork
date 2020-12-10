require_relative "chess"

class StartError < StandardError
    def message
        "No Piece at start position"
    end
end


class EndError < StandardError
    def message
        "No Piece at end position"
    end
end

class Board
    attr_reader :board, :null_piece
    attr_writer :board

    def initialize
        @board = Array.new(8) {Array.new(8)}
        @null_piece = NullPiece.instance
    end

    def [](pos) # =>3
        row, col = pos 
        @board[row][col]
    end
    
    def []=(pos, value)
        row, col = pos
        @board[row][col] = value
    end

    def move_piece(start_pos, end_pos) #start_pos => array
        piece = self[start_pos]
        if piece != @null_piece
            raise StartError
        elsif !valid_pos?(end_pos)
            raise EndError
        end
        self[end_pos] = piece
        self[start_pos] = nil
    end

    def valid_pos?(pos)
        self[pos] == nil
    end

    def add_piece#(piece, pos)
        # @board[pos] = piece
        @board.map!.with_index do |row, idx|
            if idx == 0 || idx == 1 || idx == @board.length - 1 || idx == @board.length - 2
                row.map! do |ele|
                    ele = NullPiece.instance
                end
            else
                row
            end
        end
    end

    def checkmate?(color) 
    end

    def in_check?(color)
    end

    def find_king(color)
        # assume pieces is an array of piece objects
        array = pieces
        array.each do |piece|
            if piece.is_a?(King) && piece.color == color
                return piece.pos
            end
        end
    end

    def pieces
    end

end