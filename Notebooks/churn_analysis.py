import pandas as pd
import matplotlib.pyplot as plt

# Load Dataset
df = pd.read_csv(
    r"C:\Users\lenov\Desktop\Projects\Customer Churn Analysis\Data\Telco-Customer-Data.csv"
)

# Data Cleaning
df["TotalCharges"] = pd.to_numeric(
    df["TotalCharges"],
    errors="coerce"
)

df = df.dropna()

# Create Tenure Groups
df["TenureGroup"] = pd.cut(
    df["tenure"],
    bins=[0, 12, 24, 48, 72],
    labels=["0-12 Months", "13-24 Months", "25-48 Months", "49-72 Months"]
)

# Churn by Tenure Group
tenure_churn = pd.crosstab(
    df["TenureGroup"],
    df["Churn"]
)

print("\n========== CHURN BY TENURE GROUP ==========")
print(tenure_churn)

# Create Chart
tenure_churn["Yes"].plot(
    kind="bar",
    figsize=(8, 5),
    title="Churned Customers by Tenure Group"
)

plt.ylabel("Number of Churned Customers")
plt.xlabel("Tenure Group")
plt.tight_layout()

# Save Chart
plt.savefig(
    r"C:\Users\lenov\Desktop\Projects\Customer Churn Analysis\Images\churn_by_tenure_group.png"
)

plt.show()

print("\nChart 4 saved successfully!")