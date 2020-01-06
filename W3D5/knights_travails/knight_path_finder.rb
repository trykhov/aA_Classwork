require_relative "polytree"

class KnightPathFinder
    attr_accessor :consider_pos

    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @consider_pos = [@root_node] # array of PolyTreeNode objects
    end

    def self.valid_moves(pos)
        # returns hash of legal moves from pos
        # hash => key: pair (Array), value = PolyTreeNode
        x, y = pos
        possible_moves = {}

        moves = [[1, 2], [1, -2], [-1, 2], [-1, -2],
                 [2, 1], [2, -1], [-2, 1], [-2, -1]]

        moves.each do |pair|
            x2, y2 = pair
            if (0 <= x + x2) && (x + x2 < 8) && (0 <= y + y2)  && (y + y2 < 8)
                pair = [x + x2, y + y2]
                possible_moves[pair] = PolyTreeNode.new(pair)
            end
        end
        possible_moves
    end

    def new_move_positions(pos)
        # get all possible positions from pos
        possible_moves = KnightPathFinder.valid_moves(pos)
        # look if a move is already being considered
        @consider_pos.each do |move|
            if possible_moves.has_key?(move.value)
                possible_moves[move.value] = nil # if it's already considered, ignore it
            end
        end
        consider = possible_moves.select { |k, v| v != nil }.values 
        @consider_pos += consider # add the considered nodes to consider_pos
        consider # return the possible new moves that aren't in consider_pos before
    end

    def build_move_tree
        queue = @consider_pos

        until queue.empty?
            node = queue.shift
            new_children = new_move_positions(node.value)
            new_children.each do |child| # we make each child's parent = branch
                child.parent = node
                node.add_child(child) # we add the children to the children property of branch
            end
            queue += new_children
        end
    end

    def find_path(final)
        @root_node.bfs(final)
    end

    def trace_path_back(node)
        raise "Not a position" if node.nil?
        return [node] if node.parent.nil?
        result = [node]
        result += trace_path_back(node.parent)
    end

end


knight = KnightPathFinder.new([1,1])
knight.build_move_tree
# p knight.find_path([])
found = knight.find_path([5,4])
not_found = knight.find_path([8,8])

p knight.trace_path_back(not_found)

