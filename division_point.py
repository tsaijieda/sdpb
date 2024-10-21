import argparse
import numpy as np

def calculate_division_points(source_file, target_file):
    with open(source_file, 'r') as src:
        lines = src.readlines()
    
    if len(lines) >= 2:
        # Read the first and second numbers
        num1 = float(lines[0].strip())
        num2 = float(lines[1].strip())
        
        # Take the negative of the first number
        num1 = -num1
        
        # Calculate 15 main division points between num1 and num2
        main_division_points = np.linspace(num1, num2, 15)
        
        # Add 10 more points near the beginning and the end for higher density
        start_additional_points = np.linspace(num1, main_division_points[1], 12)[1:-1]  # 10 points between num1 and second main point
        end_additional_points = np.linspace(main_division_points[-2], num2, 12)[1:-1]  # 10 points between second last and num2
        
        # Combine the points
        all_points = np.concatenate((start_additional_points, main_division_points, end_additional_points))
        
        # Modify the first and last numbers to be 0.01% smaller
        all_points[0] *= 0.9999
        all_points[-1] *= 0.9999
        
        # Write the modified division points to the target file
        with open(target_file, 'w') as tgt:
            for point in all_points:
                tgt.write(f"{point}\n")
    else:
        print("The source file does not contain enough lines.")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Calculate division points with denser start and end, adjust the first and last by 0.01%, and write them to a file.")
    parser.add_argument("source_file", help="Path to the source file containing the two numbers.")
    parser.add_argument("target_file", help="Path to the target file where the division points will be written.")
    
    args = parser.parse_args()
    
    calculate_division_points(args.source_file, args.target_file)

