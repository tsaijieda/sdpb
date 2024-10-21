import numpy as np
import matplotlib.pyplot as plt
from scipy.interpolate import make_interp_spline

# Data from the table
points = np.array([3, 2.9, 2.75, 2.5, 2, 1.625, 1.25, 1, 0.75, 0.5, 0, -1.25, -2.5, -3.75, -4.5, -5, -5.1, -5.15, -5.175, -5.18, -5.1825, -5.183])
min_values = np.array([0.5, 0.475, 0.4375, 0.375, 0.25, 0.15625, 0.086805556, 0.0555, 0.03125, 0.013888888, 0, 0.00617125, 0.024853224, 0.05591975, 0.08052425, 0.1005, 0.1065, 0.11075, 0.11417, 0.115325, 0.11625, 0.116787475])
max_values = np.array([0.499999998, 0.49537, 0.488425475, 0.47685, 0.4537019, 0.436340114, 0.418978325, 0.4074038, 0.395829275, 0.38425475, 0.3611, 0.304825, 0.24536, 0.187487832, 0.1527625, 0.1295, 0.125, 0.12225, 0.11984, 0.11875, 0.117875, 0.117421])

# Sort the points along with min and max values
sorted_indices = np.argsort(points)
points_sorted = points[sorted_indices]
min_values_sorted = min_values[sorted_indices]
max_values_sorted = max_values[sorted_indices]

# Create a smooth range of x-values
points_smooth = np.linspace(points_sorted.min(), points_sorted.max(), 500)

# Interpolate min and max values
min_smooth = make_interp_spline(points_sorted, min_values_sorted, k=3)(points_smooth)
max_smooth = make_interp_spline(points_sorted, max_values_sorted, k=3)(points_smooth)

# Plotting the smooth regions
plt.figure(figsize=(10, 6))
plt.fill_between(points_smooth, min_smooth, max_smooth, color='lightblue', alpha=0.5)
plt.plot(points_smooth, min_smooth, color='blue', linestyle='--', label='Min Values')
plt.plot(points_smooth, max_smooth, color='red', linestyle='--', label='Max Values')

plt.xlabel('M^2 g31/g20')
plt.ylabel('M^4 g40/g20')
plt.title('Isolating scalar state')
#plt.legend()
#plt.grid(True)
plt.show()

