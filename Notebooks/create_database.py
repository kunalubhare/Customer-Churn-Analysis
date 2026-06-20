import pandas as pd
import sqlite3

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

# Create SQLite Database
conn = sqlite3.connect(
    r"C:\Users\lenov\Desktop\Projects\Customer Churn Analysis\SQL\customer_churn.db"
)

# Store Data in Database
df.to_sql(
    "customers",
    conn,
    if_exists="replace",
    index=False
)

print("Database created successfully!")
print("Rows inserted:", len(df))

conn.close()