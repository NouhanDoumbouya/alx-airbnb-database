## Advanced Query Power

### 1. Task 1:
    0. Write Complex Queries with Joins
    mandatory
    Objective: Master SQL joins by writing complex queries using different types of joins.

    Instructions:

    Write a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.

    Write a query using aLEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.

    Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.

### 2. Users with More Than 3 Bookings
This correlated subquery identifies users who have made more than 3 bookings by comparing each user with a count of their bookings.

    Files
    - `subqueries.sql`: SQL queries for the task.
    - `README.md`: Documentation of the subqueries.

## Task 3: Aggregations and Window Functions

    Objective:
    Use SQL aggregation and window functions to analyze Airbnb booking data.

    Tasks:

        1. Total Bookings Per User
        Aggregated the total number of bookings made by each user using `COUNT` and `GROUP BY`.

        2. Rank Properties by Booking Count
        Used a window function (`RANK()`) to rank properties based on the total number of bookings they've received.

    Files
    - `aggregations_and_window_functions.sql`: Contains SQL queries for aggregation and window functions.
    - `README.md`: Documentation of the implemented SQL logic.