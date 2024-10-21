import argparse

def copy_first_line(source_file, destination_file):
    try:
        # Read the first line from the source file
        with open(source_file, 'r') as src:
            first_line = src.readline().strip()  # Read and strip the first line
            
        # If the first line is not empty, append it to the destination file
        if first_line:
            with open(destination_file, 'a') as dest:
                dest.write(first_line + '\n')  # Append the first line with a newline
            print("Successfully copied the first line to the destination file.")
        else:
            print("The source file is empty or the first line is blank.")
    
    except FileNotFoundError as e:
        print(f"Error: {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

if __name__ == "__main__":
    # Set up argument parsing
    parser = argparse.ArgumentParser(description="Copy the first line of a source file and append it to a destination file.")
    parser.add_argument("source_file", help="The path to the source file.")
    parser.add_argument("destination_file", help="The path to the destination file.")
    
    # Parse the command-line arguments
    args = parser.parse_args()
    
    # Call the function with the provided file paths
    copy_first_line(args.source_file, args.destination_file)

