import sys
if __name__ == "__main__":

  # Check if command-line arguments are provided
  # if len(sys.argv) > 1:
  #     # sys.argv[0] is the script name
  #     # The actual command-line arguments start from sys.argv[1]
  #     print("Script name:", sys.argv[0])
  #     print("Command-line arguments:", sys.argv[1:])
  # else:
  #     print("No command-line arguments provided.")

  used_moves = sys.argv[1:]
  turn = ""
  if (int(used_moves[len(used_moves) - 1]) < 66):
    print("Testing blue's turn")
    turn = "blue"
    for i in range(0, len(used_moves)):
      if (used_moves[i] < 66):
        used_moves[i] = used_moves[i] + 100
      else:
        used_moves[i] = used_moves[i] - 100
  else:
    turn = "red"
    print("Testing red's turn")