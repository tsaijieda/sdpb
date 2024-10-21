import pandas as pd
import matplotlib.pyplot as plt

# Read the CSV file
df = pd.read_csv('data.csv')

# Extract the x and y coordinates
x = df['x']
y = df['y']
# Create a figure and axis
fig, ax = plt.subplots()

ax.plot(x, y, 'r-', label='Boundary')  # 'r-' means red color and solid line
# Plot the points as i
ax.plot(x, y, 'bo', label='Points', markersize = 3)  # 'bo' means blue color and circle markers

# Fill the area enclosed by the points
ax.fill(x, y, 'skyblue', alpha=0.5, label='Filled Area')

# Plot the boundary with a distinct line

# Add titles and labels
ax.set_xlabel("g41/g31")
ax.set_ylabel("g42/g31")

# Add a legend
ax.legend()

# Show the plot
plt.show()

