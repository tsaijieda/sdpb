import argparse

def remove_first_line(file_path):
    try:
        # Read the entire file content
        with open(file_path, 'r') as file:
            lines = file.readlines()
        
        # Ensure there's more than one line to remove the first line
        if len(lines) > 0:
            # Write back all lines except the first one
            with open(file_path, 'w') as file:
                file.writelines(lines[1:])
            print("Successfully removed the first line.")
        else:
            print("The file is empty or does not contain enough lines to remove the first line.")
    
    except FileNotFoundError:
        print(f"Error: The file '{file_path}' was not found.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

if __name__ == "__main__":
    # Set up argument parsing
    parser = argparse.ArgumentParser(description="Remove the first line of a given file.")
    parser.add_argument("file_path", help="The path to the file from which to remove the first line.")
    
    # Parse the command-line arguments
    args = parser.parse_args()
    
    # Call the function with the provided file path
    remove_first_line(args.file_path)

