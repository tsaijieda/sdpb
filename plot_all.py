import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.interpolate import make_interp_spline
import argparse

def plot_region(file_path, color, label):
    # Read the CSV file without headers
    data = pd.read_csv(file_path, header=None)
    
    # Convert data to numeric, forcing errors to NaN and dropping them
    data = data.apply(pd.to_numeric, errors='coerce').dropna()
    
    # Extract Points, Min, and Max values from the CSV file based on the assumed order
    if data.empty:
        print(f"Warning: {file_path} contains no valid data. Skipping this file.")
        return

    points = data.iloc[:, 0].values  # First column: Points
    min_values = data.iloc[:, 1].values  # Second column: Min
    max_values = data.iloc[:, 2].values  # Third column: Max

    # Ensure that the arrays are not empty
    if len(points) == 0 or len(min_values) == 0 or len(max_values) == 0:
        print(f"Warning: {file_path} contains empty arrays after processing. Skipping this file.")
        return

    # Sort the points and corresponding Min and Max values
    sorted_indices = np.argsort(points)
    points_sorted = points[sorted_indices]
    min_values_sorted = min_values[sorted_indices]
    max_values_sorted = max_values[sorted_indices]

    # Generate a smooth curve for the region
    points_smooth = np.linspace(points_sorted.min(), points_sorted.max(), 500)
    min_smooth = make_interp_spline(points_sorted, min_values_sorted, k=3)(points_smooth)
    max_smooth = make_interp_spline(points_sorted, max_values_sorted, k=3)(points_smooth)

    # Plot the region
    plt.fill_between(points_smooth, min_smooth, max_smooth, color=color, alpha=0.5, label=label)
    plt.plot(points_smooth, min_smooth, color=color, linestyle='--')
    plt.plot(points_smooth, max_smooth, color=color, linestyle='--')

def main(files, colors, labels):
    plt.figure(figsize=(10, 6))

    # Plot each region for each file
    for i, file_path in enumerate(files):
        color = colors[i % len(colors)]  # Cycle through colors
        label = labels[i % len(labels)]  # Cycle through labels
        plot_region(file_path, color, label)

    plt.xlabel('M^2*g31/g20')
    plt.ylabel('M^4*g40/g20')
    plt.legend()
    plt.grid(True)
    plt.show()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Plot smooth regions from multiple CSV files")
    parser.add_argument("files", nargs='+', help="Paths to the CSV files")
    parser.add_argument("--colors", nargs='+', default=['lightblue', 'lightgreen', 'lightcoral', 'lightgoldenrodyellow', 'lightpink', 'lightskyblue'], 
                        help="Colors for the regions (will cycle if fewer colors than files)")
    parser.add_argument("--labels", nargs='+', default=['original, all spin, mu=1', 'spin 0, mu = 2', 'spin 2, mu=2', 'spin 2, mu=50', 'spin 4, mu=2'], 
                        help="Labels for the regions (will cycle if fewer labels than files)")
    
    args = parser.parse_args()
    main(args.files, args.colors, args.labels)

