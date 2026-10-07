#  Food Delivery Time Prediction – Datasets

Cleaned and preprocessed datasets for predicting food delivery time (in minutes)
across Indian cities. The data contains delivery partner details, restaurant and
delivery coordinates, order timing, weather, traffic, and order/vehicle attributes.

##  Files

| File | Rows | Description |
|------|------|-------------|
| `cleaned_test.csv` | ~11,400 | Cleaned test set with human-readable categorical values (e.g. `Windy`, `Jam`, `motorcycle`). Missing values are kept as `NaN`. |
| `encoded_cleaned_test.csv` | ~11,400 | Same data with categorical columns label-encoded as integers, ready for model input. |
| `updated.csv` | ~2,440 | Encoded training-style set that includes the target `Time_taken(min)`. |

## Column Overview

| Column | Description |
|--------|-------------|
| `ID` | Unique order ID |
| `Delivery_person_ID` | Delivery partner ID (encodes city + restaurant) |
| `Delivery_person_Age` | Age of the delivery partner |
| `Delivery_person_Ratings` | Partner's average rating |
| `Restaurant_latitude / longitude` | Restaurant coordinates |
| `Delivery_location_latitude / longitude` | Drop-off coordinates |
| `Order_Date` | Date of the order (test files) |
| `Time_Orderd` / `Time_Order_picked` | Order placed time / pickup time |
| `Weather` / `Weatherconditions` | Weather at time of order |
| `Road_traffic_density` | Low / Medium / High / Jam |
| `Vehicle_condition` | Condition rating of the vehicle |
| `Type_of_order` | Snack, Meal, Drinks, Buffet |
| `Type_of_vehicle` | Motorcycle, scooter, electric scooter, bicycle |
| `multiple_deliveries` | Number of simultaneous deliveries |
| `Festival` | Whether the order was during a festival |
| `City` | Metropolitan / Urban / Semi-urban |
| `Time_taken(min)` | **Target**: delivery time in minutes (`updated.csv` only) |

##  Preprocessing Steps

- Handling missing values (`NaN`) in age, ratings, weather, traffic, and time fields
- Standardizing numeric types and date/time formats
- Label encoding of categorical features (weather, traffic, order type, vehicle, festival, city)
- Removing/renaming inconsistent columns

## Quick Start

```python
import pandas as pd

test_raw = pd.read_csv("cleaned_test.csv")
test_enc = pd.read_csv("encoded_cleaned_test.csv")
train    = pd.read_csv("updated.csv", index_col=0)

X = train.drop(columns=["Time_taken(min)", "ID", "Delivery_person_ID"])
y = train["Time_taken(min)"]
```

##  Known Data Issues

- Some time values are invalid (e.g. `10:60`) and should be fixed before parsing.
- `Order_Date` formats are inconsistent in the encoded test file (`30-03-2022` vs `10/3/2022`).
- Missing values remain in the test files (age, ratings, order time, weather, traffic).
- The last column in the test files is named `Name:` and contains only the value `object`, so it can be dropped.
- Encoding differs between files, so use the same encoder mapping when training and predicting.

##  Possible Use Cases

- Delivery time regression (Linear Regression, Random Forest, XGBoost, etc.)
- Exploratory data analysis of traffic, weather, and city effects
- Feature engineering (distance from coordinates, prep time, hour of day)

## License

MIT 
