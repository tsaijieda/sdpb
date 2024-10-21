import argparse

def write_numbers_to_file(file_path, num1, num2):
    with open(file_path, 'w') as file:
        file.write(f"{num1}\n")
        file.write(f"{num2}\n")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Write two numbers to a text file, each on a new line.")
    parser.add_argument("file_path", help="Path to the text file to be created.")
    parser.add_argument("num1", type=float, help="The first number to write in the file.")
    parser.add_argument("num2", type=float, help="The second number to write in the file.")
    
    args = parser.parse_args()
    
    write_numbers_to_file(args.file_path, args.num1, args.num2)

