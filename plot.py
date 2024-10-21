import matplotlib.pyplot as plt

# Sample data
x = [0.1, 1, 10, 30, 35, 37, 37.4]
y1 = [0.00936, 0.64103, 8.993, 27.553, 32.1924, 34.04838, 34.41958]  # Square of x
y2 = [0.0824, 0.9133425, 9.2226, 27.687, 32.303, 34.15, 34.51]  # Cube of x

# Plotting
plt.plot(x, y1, label='y = x^2', linewidth = 0.1)
plt.plot(x, y2, label='y = x^3', linewidth = 0.1)

# Filling the region between the lines
plt.fill_between(x, y1, y2, color='skyblue', alpha=0.3)

# Adding labels and legend
plt.xlabel('x')
plt.ylabel('y')
plt.title('Fill Between Two Lines')
plt.legend()

# Displaying the plot
plt.show()

