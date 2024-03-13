--Initialize tables of board
local function initBoard(board)
	for i = 1, 10 do
		board[i] = {}
		for j = 1, 10 do
			board[i][j] = 0
		end
	end
end

--Print the board as a 10x10 grid
local function printBoard(board)
	for i = 1, 10 do
		for j = 1, 10 do
			io.write(board[i][j] .. " ")
		end
		io.write("\n")
	end
end

--Place the ships on the board
local function placeShips(board, ships)
	for i = 1, 5 do
		local ship = ships[i]
		local size = ship.size
		local x = math.random(1, 10)
		local y = math.random(1, 10)
		local direction = math.random(1, 2)
		local valid = false
		while not valid do
			if direction == 1 then
				if x + size - 1 <= 10 then
					valid = true
					for j = 0, size - 1 do
						if board[x + j][y] ~= 0 then
							valid = false
						end
					end
					if valid then
						for j = 0, size - 1 do
							board[x + j][y] = i
						end
					end
				end
			else
				if y + size - 1 <= 10 then
					valid = true
					for j = 0, size - 1 do
						if board[x][y + j] ~= 0 then
							valid = false
						end
					end
					if valid then
						for j = 0, size - 1 do
							board[x][y + j] = i
						end
					end
				end
			end
			if not valid then
				x = math.random(1, 10)
				y = math.random(1, 10)
				direction = math.random(1, 2)
			end
		end
	end
end

--List of Ships
Ships = {
	{ size = 5, name = "Carrier" },
	{ size = 4, name = "Battleship" },
	{ size = 3, name = "Cruiser" },
	{ size = 3, name = "Submarine" },
	{ size = 2, name = "Destroyer" },
}

--Main
P1Board = {}
P2Board = {}
initBoard(P1Board)
initBoard(P2Board)
placeShips(P1Board, Ships)
placeShips(P2Board, Ships)
print("Player 1's Board:")
printBoard(P1Board)
print("Player 2's Board:")
printBoard(P2Board)
