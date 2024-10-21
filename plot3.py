import numpy as np
import matplotlib.pyplot as plt
from scipy.interpolate import make_interp_spline

# First dataset
points1 = np.array([3, 2.9, 2.75, 2.5, 2, 1.625, 1.25, 1, 0.75, 0.5, 0, -1.25, -2.5, -3.75, -4.5, -5, -5.1, -5.15, -5.175, -5.18, -5.1825, -5.183])
min_values1 = np.array([0.5, 0.475, 0.4375, 0.375, 0.25, 0.15625, 0.086805556, 0.0555, 0.03125, 0.013888888, 0, 0.00617125, 0.024853224, 0.05591975, 0.08052425, 0.1005, 0.1065, 0.11075, 0.11417, 0.115325, 0.11625, 0.116787475])
max_values1 = np.array([0.499999998, 0.49537, 0.488425475, 0.47685, 0.4537019, 0.436340114, 0.418978325, 0.4074038, 0.395829275, 0.38425475, 0.3611, 0.304825, 0.24536, 0.187487832, 0.1527625, 0.1295, 0.125, 0.12225, 0.11984, 0.11875, 0.117875, 0.117421])

# Second dataset
points2 = np.array([1.5, 1.25, 1, 0.75, 0.5, 0.25, 0, -0.5, -1.25, -2.5, -3.75, -4.5, -5, -5.15, -5.2, -5.225, -5.235, -5.2365, -5.237])
min_values2 = np.array([0.125, 0.086805556, 0.055555555, 0.03125, 0.013888889, 0.003472222, 0, 0.0008938, 0.005717, 0.023629353, 0.054677475, 0.0797979, 0.100525, 0.11075, 0.116324525, 0.12125, 0.126185, 0.12775, 0.1284375])
max_values2 = np.array([0.125, 0.12598675, 0.1269738, 0.127960725, 0.128947635, 0.13, 0.13092145, 0.132895, 0.135855995, 0.14079, 0.145725, 0.14868575, 0.15075, 0.150388825, 0.14725, 0.139791, 0.13363825, 0.13175, 0.129655])

# Sort and interpolate the first dataset
sorted_indices1 = np.argsort(points1)
points_sorted1 = points1[sorted_indices1]
min_values_sorted1 = min_values1[sorted_indices1]
max_values_sorted1 = max_values1[sorted_indices1]
points_smooth1 = np.linspace(points_sorted1.min(), points_sorted1.max(), 500)
min_smooth1 = make_interp_spline(points_sorted1, min_values_sorted1, k=3)(points_smooth1)
max_smooth1 = make_interp_spline(points_sorted1, max_values_sorted1, k=3)(points_smooth1)

# Sort and interpolate the second dataset
sorted_indices2 = np.argsort(points2)
points_sorted2 = points2[sorted_indices2]
min_values_sorted2 = min_values2[sorted_indices2]
max_values_sorted2 = max_values2[sorted_indices2]
points_smooth2 = np.linspace(points_sorted2.min(), points_sorted2.max(), 500)
min_smooth2 = make_interp_spline(points_sorted2, min_values_sorted2, k=3)(points_smooth2)
max_smooth2 = make_interp_spline(points_sorted2, max_values_sorted2, k=3)(points_smooth2)

# Plotting both smooth regions
plt.figure(figsize=(10, 6))

# Plot the first region
plt.fill_between(points_smooth1, min_smooth1, max_smooth1, color='lightblue', alpha=0.5, label='First Region')
plt.plot(points_smooth1, min_smooth1, color='blue', linestyle='--')
plt.plot(points_smooth1, max_smooth1, color='red', linestyle='--')

# Plot the second region
plt.fill_between(points_smooth2, min_smooth2, max_smooth2, color='lightgreen', alpha=0.5, label='Second Region')
plt.plot(points_smooth2, min_smooth2, color='green', linestyle='--')
plt.plot(points_smooth2, max_smooth2, color='orange', linestyle='--')

plt.xlabel('Points')
plt.ylabel('Values')
plt.title('Smooth Filled Regions for Two Datasets')
plt.legend()
plt.grid(True)
plt.show()

