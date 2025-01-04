-- 1. Find customers who are from Delhi
SELECT * FROM Customers WHERE city = 'Delhi';


-- 2. Find customers whose first name starts with 'A' and sort by their last name
SELECT customer_id, UPPER(first_name) AS first_name, LOWER(last_name) AS last_name
FROM Customers
WHERE first_name LIKE 'A%'
ORDER BY last_name;

-- 3. Calculate the total revenue from each package, including the cost of activities and transportation
SELECT Packages.package_name, 
       SUM(Bookings.total_price + IFNULL(SUM(Activities.activity_cost), 0) + IFNULL(SUM(TransportationDetails.transportation_cost), 0)) AS total_revenue
FROM Packages
JOIN Bookings ON Packages.package_id = Bookings.package_id
LEFT JOIN Activities ON Packages.package_id = Activities.package_id
LEFT JOIN TransportationDetails ON Packages.package_id = TransportationDetails.package_id
GROUP BY Packages.package_name;

-- 4. Get a list of agents and the number of packages they manage, sorted by the number of packages
SELECT Agents.name AS agent_name, COUNT(AgentPackages.package_id) AS package_count
FROM Agents
JOIN AgentPackages ON Agents.agent_id = AgentPackages.agent_id
GROUP BY agent_name
ORDER BY package_count DESC;

-- 5. Find the total discount applied to a package with package_id = 2
SELECT SUM(discount_percentage) AS total_discount
FROM Discounts
WHERE package_id = 2 AND valid_from <= CURRENT_DATE AND valid_until >= CURRENT_DATE;

-- 6. Get the earliest and latest booking dates for each customer
SELECT customer_id, MIN(booking_date) AS earliest_booking, MAX(booking_date) AS latest_booking
FROM Bookings
GROUP BY customer_id;

-- 7. Rank the packages based on their price, with the highest price ranked first
SELECT package_name, price, RANK() OVER (ORDER BY price DESC) AS price_rank
FROM Packages;

-- 8. Find the total amount spent by each customer on confirmed bookings only
SELECT customer_id, SUM(total_price) AS total_spent
FROM Bookings
WHERE booking_status = 'Confirmed'
GROUP BY customer_id
ORDER BY total_spent DESC;

-- 9. Find customers who have booked a package with the destination 'Goa' and have provided feedback
SELECT Customers.first_name, Customers.last_name, Feedback.feedback_text
FROM Customers
JOIN Bookings ON Customers.customer_id = Bookings.customer_id
JOIN Packages ON Bookings.package_id = Packages.package_id
JOIN Feedback ON Customers.customer_id = Feedback.customer_id
WHERE Packages.destination = 'Goa';

-- 10. Calculate the average rating for each package
SELECT package_id, AVG(rating) AS average_rating
FROM Reviews
GROUP BY package_id;

-- 11. Find all packages with no bookings and no reviews
SELECT package_name
FROM Packages
WHERE package_id NOT IN (SELECT DISTINCT package_id FROM Bookings)
  AND package_id NOT IN (SELECT DISTINCT package_id FROM Reviews);

-- 12. Get a list of customers who have made payments with 'Credit Card' and the total amount paid
SELECT Customers.first_name, Customers.last_name, SUM(Payments.amount_paid) AS total_payment
FROM Customers
JOIN Bookings ON Customers.customer_id = Bookings.customer_id
JOIN Payments ON Bookings.booking_id = Payments.booking_id
WHERE Payments.payment_method = 'Credit Card'
GROUP BY Customers.customer_id;

-- 13. Find the most popular activity based on the highest cost in each package
SELECT Activities.activity_name, Packages.package_name, MAX(Activities.activity_cost) AS highest_cost
FROM Activities
JOIN Packages ON Activities.package_id = Packages.package_id
GROUP BY Packages.package_name;

-- 14. Find the number of bookings for each package, with packages having more than 5 bookings
SELECT package_id, COUNT(*) AS booking_count
FROM Bookings
GROUP BY package_id
HAVING booking_count > 5;

-- 15. Use a recursive query to find all agents who manage packages with a specific package_id (e.g., package_id = 3), along with their sub-agents
WITH RECURSIVE AgentHierarchy AS (
    SELECT agent_id, name, contact_number, email
    FROM Agents
    WHERE agent_id = 3
    UNION ALL
    SELECT Agents.agent_id, Agents.name, Agents.contact_number, Agents.email
    FROM Agents
    JOIN AgentPackages ON Agents.agent_id = AgentPackages.agent_id
    JOIN AgentHierarchy ON AgentPackages.agent_id = AgentHierarchy.agent_id
)
SELECT * FROM AgentHierarchy;

-- 16. Calculate the total cost of a booking including activity and transportation costs, for a customer with a specific booking_id
SELECT Bookings.booking_id, 
       SUM(Bookings.total_price + IFNULL(SUM(Activities.activity_cost), 0) + IFNULL(SUM(TransportationDetails.transportation_cost), 0)) AS total_booking_cost
FROM Bookings
LEFT JOIN Activities ON Bookings.package_id = Activities.package_id
LEFT JOIN TransportationDetails ON Bookings.package_id = TransportationDetails.package_id
WHERE Bookings.booking_id = 3
GROUP BY Bookings.booking_id;
