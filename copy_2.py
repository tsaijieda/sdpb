import argparse
import re

def clean_numeric_string(s):
    """Remove all non-numerical characters except for decimal points and negative signs."""
    # Keep digits, decimal points, and negative signs
    return re.sub(r'[^\d.-]', '', s)

def append_second_line_to_last_line(source_file, destination_file):
    try:
        # Read the second line from the source file
        with open(source_file, 'r') as src:
            lines = src.readlines()
            if len(lines) >= 2:
                second_line = lines[1].strip()  # Get the second line and strip whitespace
                cleaned_line = clean_numeric_string(second_line)  # Clean the second line
            else:
                print("The source file doesn't have a second line.")
                return

        # Read all lines from the destination file
        with open(destination_file, 'r') as dest:
            dest_lines = dest.readlines()
            if len(dest_lines) > 0:
                # Modify the last line by appending the cleaned second line with a space
                dest_lines[-1] = dest_lines[-1].strip() + ' ' + cleaned_line + '\n'
            else:
                print("The destination file is empty.")
                return

        # Write the modified content back to the destination file
        with open(destination_file, 'w') as dest:
            dest.writelines(dest_lines)

        print("Successfully appended the cleaned second line to the last line of the destination file.")

    except FileNotFoundError as e:
        print(f"Error: {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

if __name__ == "__main__":
    # Set up argument parsing
    parser = argparse.ArgumentParser(description="Append the cleaned second line of a source file to the last line of a destination file.")
    parser.add_argument("source_file", help="The path to the source file.")
    parser.add_argument("destination_file", help="The path to the destination file.")
    
    # Parse the command-line arguments
    args = parser.parse_args()
    
    # Call the function with the provided file paths
    append_second_line_to_last_line(args.source_file, args.destination_file)

