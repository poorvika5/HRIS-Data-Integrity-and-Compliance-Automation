import pandas as pd

def audit_hris_data(file_path):
    # Load the HRIS data
    df = pd.read_csv(file_path)

    # Identify discrepancies
    df["Discrepancy"] = df.apply(lambda row: "Check Record" if not row["I-9_Verified"] or not row["Workday_Entry"] or not row["Document_Stored"] else "OK", axis=1)

    # Save the updated audit report
    output_path = "HRIS_Audit_Report_Updated.csv"
    df.to_csv(output_path, index=False)
    print(f"Audit report generated: {output_path}")

# Example usage
if __name__ == "__main__":
    audit_hris_data("HRIS_Audit_Report.csv")
