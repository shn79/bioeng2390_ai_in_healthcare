# Demonstration of scripts and their usage 

import pandas as pd
import random
import numpy as np
import sys

def generate_csv(filename='myFile.csv', total_records=20):
    np.random.seed(0)
    random.seed(0)

    # Generate random ages between 18 and 25
    ages = np.random.randint(18, 26, total_records)

    # Generate random heights between 150 and 200
    heights = np.random.randint(150, 201, total_records)

    # Generate random weights between 50 and 100
    weights = np.random.randint(50, 101, total_records)

    # Generate total_records count of either M or F for male or female in a np array
    gender = np.random.choice(['M', 'F'], total_records)

    # Create a DataFrame
    df = pd.DataFrame({'Age': ages, 'Height': heights, 'Weight': weights, 'Gender': gender})

    # Save the DataFrame to a csv file
    df.to_csv(filename, index=False)

    return df.head()

def main():
    if len(sys.argv) != 2:
        print("Usage: python generate_csv.py <filename>")
        sys.exit(1)

    filename = sys.argv[1]
    print(f"Generating CSV file with student data: {filename}")
    df_head = generate_csv(filename)
    print(df_head)

if __name__ == "__main__":
    main()
