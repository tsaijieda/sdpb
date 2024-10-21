import argparse
import re

def extract_numeric_part(text):
    # This regular expression will extract numbers, including negative, decimal, and scientific notation
    numeric_part = re.findall(r'-?\d+\.?\d*(?:[eE][+-]?\d+)?', text)
    return ' '.join(numeric_part) if numeric_part else ''

def append_second_line(source_file, target_file):
    with open(source_file, 'r') as src:
        lines = src.readlines()
    
    if len(lines) >= 2:
        second_line = lines[1]
        numeric_part = extract_numeric_part(second_line)
        
        if numeric_part:  # Only append if there's a numeric part
            with open(target_file, 'a') as tgt:
                tgt.write(numeric_part + '\n')
    else:
        print("The source file has less than 2 lines.")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Extract the numeric part (including negatives, decimals, and scientific notation) of the second line from one file and append it to another file.")
    parser.add_argument("source_file", help="Path to the source file.")
    parser.add_argument("target_file", help="Path to the target file where the numeric part of the second line will be appended.")
    
    args = parser.parse_args()
    
    append_second_line(args.source_file, args.target_file)

