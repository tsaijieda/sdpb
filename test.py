import numpy as np
import matplotlib.pyplot as plt

# The sampling function defined previously
def sample_grades():
    r = np.random.random()
    if r < 0.05:
        return 40
    elif r < 0.21:
        return 50
    elif r < 0.30:
        return 60
    elif r < 0.40:
        return 70
    elif r < 0.64:
        return 80
    elif r < 0.85:
        return 90
    else:
        return 100

# Function to generate samples and plot the normalized histogram
def plot_average_histogram(size_set,num_set):
    score_list = []
    for i in range(num_set):
        average_list = []
        for j in range(size_set):
            average_list.append(sample_grades())
        score_list.append(np.average(average_list))
        average_list.clear() 
    plt.hist(score_list)
    plt.show()
    

# Example usage:
plot_average_histogram(1,1000)
plot_average_histogram(3,100)
plot_average_histogram(50,100)
