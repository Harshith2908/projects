Week-1 

import statistics 
# Input data 
data = list(map(float, input("Enter numbers separated by space: ").split())) 
# Central Tendency Measures 
mean = statistics.mean(data) 
median = statistics.median(data) 
# Mode (handle multiple modes safely) 
try: 
mode = statistics.mode(data) 
except statistics.StatisticsError: 
mode = "No unique mode (multiple modes found)" 
# Dispersion Measures 
variance = statistics.variance(data)  # Sample variance 
std_dev = statistics.stdev(data)      
# Output results 
print("\n--- Results ---") 
print(f"Mean: {mean}") 
print(f"Median: {median}") 
print(f"Mode: {mode}") 
print(f"Variance: {variance}") 

week-2

import statistics 
import math 
import numpy as np 
from scipy import stats 
# Sample standard deviation 
data = [1, 2, 3, 4, 5] 
print("----- STATISTICS -----") 
print("Mean:", statistics.mean(data)) 
print("Median:", statistics.median(data)) 
print("Mode:", statistics.mode(data)) 
print("Variance:", statistics.variance(data)) 
print("Standard Deviation:", statistics.stdev(data)) 
print("\n----- MATH -----") 
print("Square Root of 16:", math.sqrt(16)) 
print("factorial:", math.factorial(5)) 
print("gcd:", math.gcd(48,18)) 
print("\n----- NUMPY -----") 
arr = np.array(data) 
print("Array:", arr) 
print("Mean:", np.mean(arr)) 
print("Sum:", np.sum(arr)) 
print("\n----- SCIPY -----") 
z_score = stats.zscore(data) 
print("z-score",z_score) 

week-3 

import pandas as pd 
import matplotlib.pyplot as plt 
# Create simple data 
data = { 
"Students": ["A", "B", "C", "D"], 
"Marks": [80, 90, 70, 85] 
} 
# Convert to DataFrame 
df = pd.DataFrame(data) 
# Display data 
print("Data:\n", df) 
# Plot bar graph 
plt.bar(df["Students"], df["Marks"], color="skyblue") 
# Labels and title 
plt.title("Student Marks") 
plt.xlabel("Students") 
plt.ylabel("Marks") 
# Grid (optional) 
plt.grid(axis='y') 
# Show graph 
plt.show() 

week-4 

# Program to implement Simple Linear Regression 
import numpy as np 
import matplotlib.pyplot as plt 
from sklearn.linear_model import LinearRegression 
# Input data (Advertising Budget vs Sales) 
X = np.array([1, 2, 3, 4, 5]).reshape(-1, 1) 
Y = np.array([10, 20, 30, 40, 50]) 
# Create and train the model 
model = LinearRegression() 
model.fit(X, Y) 
# Predict for new value 
X_new = np.array([6]).reshape(-1, 1) 
predicted_sales = model.predict(X_new) 
# Predict values for plotting regression line 
Y_pred = model.predict(X) 
# Display results 
print("Slope (m):", model.coef_[0]) 
print("Intercept (c):", model.intercept_) 
print("Predicted sales for budget 6 =", predicted_sales[0]) 
# Plot graph 
plt.scatter(X, Y)        
plt.plot(X, Y_pred)      
# Labels and title 
# original data points 
# regression line 
plt.title("Sales Prediction using Linear Regression") 
plt.xlabel("Advertising Budget") 
plt.ylabel("Sales") 
# Show graph 
plt.show() 

week-5 

# Program for Multiple Linear Regression (House Price Prediction) 
import numpy as np 
import matplotlib.pyplot as plt 
from sklearn.linear_model import LinearRegression 
# Input data: [Area, Bedrooms, Age] 
X = np.array([ 
[1000, 2, 10], 
[1500, 3, 5], 
[2000, 4, 2], 
[1200, 2, 8], 
[1800, 3, 3] 
]) 
# Output: House Prices 
Y = np.array([200000, 300000, 400000, 250000, 350000]) 
# Create model 
model = LinearRegression() 
# Train model 
model.fit(X, Y) 
# Predict price for new house 
new_house = np.array([[1600, 3, 4]]) 
predicted_price = model.predict(new_house) 
# Display results 
print("Coefficients:", model.coef_) 
print("Intercept:", model.intercept_) 
print("Predicted House Price:", predicted_price[0]) 
# 📊 Graph (Area vs Price) 
# Extract only Area column for visualization 
area = X[:, 0] 
# Predicted values 
Y_pred = model.predict(X) 
# Plot graph 
plt.scatter(area, Y)       
# actual values 
plt.plot(area, Y_pred)     # predicted line 
plt.title("House Price Prediction") 
plt.xlabel("Area (sq ft)") 
plt.ylabel("Price") 
plt.show() 

week-6

# Program to implement Decision Tree with parameter tuning 
from sklearn.tree import DecisionTreeClassifier 
from sklearn import tree 
import matplotlib.pyplot as plt 
# Input data: [Study Hours, Attendance %] 
X = [ 
[2, 50], 
[3, 60], 
[5, 70], 
[7, 80], 
[8, 90] 
] 
# Output: 0 = Fail, 1 = Pass 
Y = [0, 0, 1, 1, 1] 
# Create Decision Tree model with parameters 
model = DecisionTreeClassifier( 
criterion="entropy",      
max_depth=3,              
# splitting method (entropy/gini) 
# maximum depth of tree 
min_samples_split=2,      # minimum samples to split 
min_samples_leaf=1        
) 
# Train the model 
model.fit(X, Y) 
# minimum samples in leaf node 
# Predict result for new data 
test_data = [[6, 75]] 
prediction = model.predict(test_data) 
# Display output 
print("Prediction (0=Fail, 1=Pass):", prediction[0]) 
# Visualize Decision Tree 
plt.figure(figsize=(5,5)) 
tree.plot_tree( 
model, 
feature_names=["Study Hours", "Attendance"], 
class_names=["Fail", "Pass"], 
f
illed=True 
) 
plt.title("Decision Tree Visualization") 
plt.show() 

week-7 

# Program to implement K-Nearest Neighbors (KNN) 
import numpy as np 
import matplotlib.pyplot as plt 
from sklearn import datasets 
from sklearn.neighbors import KNeighborsClassifier 
from sklearn.model_selection import train_test_split 
# Load Iris dataset 
iris = datasets.load_iris() 
# Take only first 2 features for visualization 
X = iris.data[:, :2] 
y = iris.target 
# Split dataset into training and testing 
X_train, X_test, y_train, y_test = train_test_split( 
X, y, test_size=0.2, random_state=42 
) 
# Create KNN model 
k = 5 
model = KNeighborsClassifier(n_neighbors=k) 
# Train the model 
model.fit(X_train, y_train) 
# Test prediction (example) 
test_sample = [[5.0, 3.5]] 
prediction = model.predict(test_sample) 
print("Predicted Class:", prediction[0]) 
# Create mesh grid for decision boundary 
h = 0.02 
x_min, x_max = X[:, 0].min() - 1, X[:, 0].max() + 1 
y_min, y_max = X[:, 1].min() - 1, X[:, 1].max() + 1 
xx, yy = np.meshgrid( 
np.arange(x_min, x_max, h), 
np.arange(y_min, y_max, h) 
) 
# Predict for each point in grid 
Z = model.predict(np.c_[xx.ravel(), yy.ravel()]) 
Z = Z.reshape(xx.shape) 
# Plot decision boundary 
plt.figure() 
plt.contourf(xx, yy, Z, alpha=0.3) 
# Plot actual data points 
plt.scatter(X[:, 0], X[:, 1], c=y) 
# Labels and title 
plt.xlabel("Feature 1") 
plt.ylabel("Feature 2") 
plt.title(f"KNN Decision Boundary (K={k})") 
# Show graph 
plt.show() 

week-8 

# Program to implement Logistic Regression 
# Import libraries 
import numpy as np 
import pandas as pd 
import matplotlib.pyplot as plt 
from sklearn.model_selection import train_test_split 
from sklearn.linear_model import LogisticRegression 
from sklearn.preprocessing import StandardScaler 
from sklearn.metrics import accuracy_score 
# Step 1: Create dataset 
data = { 
'Age': [22, 25, 47, 52, 46, 56, 48, 55, 60, 62], 
'Salary': [15000, 20000, 80000, 90000, 75000, 100000, 85000, 95000, 110000, 120000], 
'Purchased': [0, 0, 1, 1, 1, 1, 1, 1, 1, 1] 
} 
df = pd.DataFrame(data) 
print(df) 
# Step 2: Features and target 
X = df[['Age', 'Salary']] 
y = df['Purchased'] 
# Step 3: Split data into training and testing 
X_train, X_test, y_train, y_test = train_test_split( 
X, y, test_size=0.2, random_state=0 
) 
# Step 4: Feature scaling 
scaler = StandardScaler() 
X_train = scaler.fit_transform(X_train) 
X_test = scaler.transform(X_test) 
# Step 5: Train Logistic Regression model 
model = LogisticRegression() 
model.fit(X_train, y_train) 
# Step 6: Predict test results 
y_pred = model.predict(X_test) 
# Step 7: Accuracy 
print("Accuracy:", accuracy_score(y_test, y_pred)) 
# Step 8: Predict for new data 
new_data = [[30, 40000]] 
new_data = scaler.transform(new_data) 
result = model.predict(new_data) 
if result[0] == 1: 
print("Will Buy") 
else: 
print("Will Not Buy") 
# Step 9: Plot Decision Boundary 
h = 0.02 
x_min, x_max = X_train[:, 0].min() - 1, X_train[:, 0].max() + 1 
y_min, y_max = X_train[:, 1].min() - 1, X_train[:, 1].max() + 1 
xx, yy = np.meshgrid( 
np.arange(x_min, x_max, h), 
np.arange(y_min, y_max, h) 
) 
Z = model.predict(np.c_[xx.ravel(), yy.ravel()]) 
Z = Z.reshape(xx.shape) 
plt.figure() 
plt.contourf(xx, yy, Z, alpha=0.3) 
plt.scatter(X_train[:, 0], X_train[:, 1], c=y_train) 
plt.xlabel("Age (scaled)") 
plt.ylabel("Salary (scaled)") 
plt.title("Logistic Regression") 
plt.show() 

week-9 

# Program: K-Means Clustering (Customer Segmentation) 
# Import libraries 
import numpy as np 
import pandas as pd 
import matplotlib.pyplot as plt 
from sklearn.cluster import KMeans 
# Step 1: Create dataset 
data = { 
'Income': [15, 16, 17, 18, 19, 60, 62, 65, 68, 70], 
'Spending': [39, 40, 42, 43, 45, 70, 72, 75, 78, 80] 
} 
# Convert into DataFrame 
df = pd.DataFrame(data) 
print("Dataset:\n") 
print(df) 
# Step 2: Select features 
X = df[['Income', 'Spending']] 
# Step 3: Apply K-Means 
k = 2 
model = KMeans(n_clusters=k, random_state=0) 
model.fit(X) 
# Step 4: Get results 
labels = model.labels_ 
centroids = model.cluster_centers_ 
print("\nCluster Labels:\n", labels) 
print("\nCentroids:\n", centroids) 
# Step 5: Plot graph 
plt.figure() 
# Plot data points (colored by cluster) 
plt.scatter(X['Income'], X['Spending'], c=labels) 
# Plot centroids 
plt.scatter(centroids[:, 0], centroids[:, 1], 
marker='X', s=200) 
# Labels and title 
plt.xlabel("Income") 
plt.ylabel("Spending Score") 
plt.title("Customer Segmentation using K-Means") 
# Show graph 
plt.show() 

week-10

#8. Performance analysis of Classification Algorithms on a specific dataset (heart Disease prediction)								
#	Age	Sex	ChestPain	BP	Cholesterol	MaxHR	Target	
#	45	1	3	130	230	150	1	
#	54	0	2	140	250	140	1	
#	60	1	1	120	240	130	0	
#	48	0	2	135	220	160	1	
#	52	1	3	150	260	120	0	
#	46	0	1	128	210	170	1	

# Performance Analysis of Classification Algorithms

import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score

# Models
from sklearn.linear_model import LogisticRegression
from sklearn.tree import DecisionTreeClassifier
from sklearn.neighbors import KNeighborsClassifier

# Step 1: Create dataset
data = {
    'Age': [45, 54, 60, 48, 52, 46],
    'Sex': [1, 0, 1, 0, 1, 0],
    'ChestPain': [3, 2, 1, 2, 3, 1],
    'BP': [130, 140, 120, 135, 150, 128],
    'Cholesterol': [230, 250, 240, 220, 260, 210],
    'MaxHR': [150, 140, 130, 160, 120, 170],
    'Target': [1, 1, 0, 1, 0, 1]
}

df = pd.DataFrame(data)
print(df)

# Step 2: Features & Target
X = df.drop('Target', axis=1)
y = df['Target']

# Step 3: Split data
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.3, random_state=0
)

# Step 4: Models
models = {
    "Logistic Regression": LogisticRegression(),
    "Decision Tree": DecisionTreeClassifier(),
    "KNN": KNeighborsClassifier(n_neighbors=3)
}

# Step 5: Train & Evaluate
print("Model Performance:\n")

for name, model in models.items():
    model.fit(X_train, y_train)
    y_pred = model.predict(X_test)
    acc = accuracy_score(y_test, y_pred)
    print(name, "Accuracy:", acc)
