# Football Ticket Booking System - Database Design & SQL Queries

## Project Overview

The Football Ticket Booking System is a database management project designed to manage football match ticket sales, user information, and booking transactions. The system allows football fans to purchase tickets for different matches while administrators can manage match information and ticket availability.

This project demonstrates database design concepts including Entity Relationship Diagrams (ERD), Primary Keys, Foreign Keys, referential integrity, and SQL query implementation.

---

### 1. Users Table

This table tracks all administrative staff and customers who use the platform.

| **Field Name** | **What the Field Does** |
| --- | --- |
| `user_id` | Unique identification number for each registered user. |
| `full_name` | Stores the first and last name of the user. |
| `email` | Stores the user's mail address used for login. |
| `role` | Defines access permissions (`Ticket Manager` or `Football Fan`). |
| `phone_number` | Stores the contact mobile number of the fan. |

### 2. Matches Table

This table catalogs the tournament events, stadium logistics, and baseline ticket inventory pricing.

| **Field Name** | **What the Field Does** |
| --- | --- |
| `match_id` | Unique identification number for each football match. |
| `fixture` | Tracks the two competing teams (e.g., *Real Madrid vs Barcelona*). |
| `tournament_category` | The league or cup title (e.g., *Champions League*, *Premier League*). |
| `base_ticket_price` | The foundational price for a single standard entry seat. |
| `match_status` | Current ticket availability state (`Available`, `Selling Fast`, `Sold Out`, `Postponed`). |

### 3. Bookings Table

This transactional table records individual ticket purchases by linking users to their chosen matches.

| **Field Name** | **What the Field Does** |
| --- | --- |
| `booking_id` | Unique tracking transaction number for the ticket purchase. |
| `user_id` | Links the booking directly to the user who made the purchase. |
| `match_id` | Links the booking directly to the specific match being attended. |
| `seat_number` | The specific allocated seat identifier in the stadium (e.g., `A-12`). |
| `payment_status` | Tracks financial resolution (`Pending`, `Confirmed`, `Cancelled`, `Refunded`). |
| `total_cost` | The calculated final invoice price based on the base price and seat quantity. |

---

## Relationships

### One-to-Many

- One User can have multiple Bookings.
- One Match can have multiple Bookings.

### Foreign Keys

```sql
Bookings.user_id  → Users.user_id
Bookings.match_id → Matches.match_id
```

These foreign keys ensure referential integrity by preventing invalid booking records.

---

## SQL Features Used

This project demonstrates the use of:

- SELECT Statements
- WHERE Clause
- LIKE / ILIKE
- COALESCE
- IS NULL
- INNER JOIN
- LEFT JOIN
- Aggregate Functions
- Subqueries
- ORDER BY
- LIMIT
- OFFSET

---

## Business Rules

1. A football fan can purchase tickets for multiple matches.
2. A match can have multiple booking records.
3. Every booking must belong to a valid user.
4. Every booking must reference a valid match.
5. Ticket prices cannot be NULL.
6. Payment status may be Pending, Confirmed, Cancelled, or Refunded.

---

## ERD Diagram

![ER DIAGRAM](https://i.ibb.co.com/XZTFMLv3/Screenshot-2026-06-15-155302.png)


---

## Author

Md Saiful Haque