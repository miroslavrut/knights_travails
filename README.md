### Knight's Travails

Usage of graph data structure to search for the shortest path between squares for a knight on chess table.



class ```Chess``` is tottaly unnecesary but whatever :D 

* With #find_possible_moves all next possible moves are calculated for given position
* #make_graph makes all possible knight moves for every cell of chess board
* breadth-first-search is used with que to find paths from starting position to final position
* with #find_shortest_path we start from final position, we go back by one position, and store it in array, and stop when we hit starting position. This way we store shortest path 

