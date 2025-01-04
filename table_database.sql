-- Inserting sample data into Customers table
INSERT INTO Customers (first_name, last_name, email, phone, city) VALUES
('Ravi', 'Sharma', 'ravi.sharma@example.com', '9876543210', 'Delhi'),
('Anita', 'Verma', 'anita.verma@example.com', '9123456789', 'Mumbai'),
('Arun', 'Patel', 'arun.patel@example.com', '9988776655', 'Bangalore'),
('Priya', 'Iyer', 'priya.iyer@example.com', '9112233445', 'Chennai'),
('Neha', 'Gupta', 'neha.gupta@example.com', '9333445566', 'Kolkata'),
('Suresh', 'Kumar', 'suresh.kumar@example.com', '9456789012', 'Hyderabad'),
('Meera', 'Reddy', 'meera.reddy@example.com', '9673456789', 'Pune'),
('Vikas', 'Singh', 'vikas.singh@example.com', '9765432101', 'Lucknow'),
('Shivani', 'Joshi', 'shivani.joshi@example.com', '9012345678', 'Ahmedabad'),
('Rajesh', 'Mishra', 'rajesh.mishra@example.com', '9812345670', 'Jaipur')
('Sarthak', 'Gupta', 'sarthakspeaks@example.com', '7300085999', 'Bangloria');

-- Inserting sample data into the Packages table
INSERT INTO Packages (package_name, description, price, destination, start_date, end_date, package_type) VALUES
('Himalayan Trek', 'An adventure trekking package in Himachal Pradesh with scenic views of the Himalayas.', 25000.00, 'Himachal Pradesh', '2024-06-01', '2024-06-10', 'Adventure'),
('Goa Beach Escape', 'A relaxing beach vacation in Goa with luxury resorts and beaches.', 15000.00, 'Goa', '2024-07-05', '2024-07-12', 'Relaxation'),
('Rajasthan Heritage Tour', 'A cultural exploration of Rajasthan with visits to forts and palaces.', 18000.00, 'Rajasthan', '2024-08-01', '2024-08-15', 'Cultural'),
('Sundarbans Wildlife Safari', 'A wildlife safari in the Sundarbans, home to Bengal tigers and mangrove forests.', 22000.00, 'Sundarbans', '2024-09-10', '2024-09-20', 'Wildlife'),
('Andaman Islands Retreat', 'A luxury retreat in the Andaman Islands, perfect for a tropical escape.', 30000.00, 'Andaman Islands', '2024-11-01', '2024-11-07', 'Relaxation'),
('Kerala Backwaters', 'A peaceful retreat in Kerala’s backwaters with houseboats and natural beauty.', 20000.00, 'Kerala', '2024-10-05', '2024-10-12', 'Relaxation'),
('Kashmir Valley Adventure', 'A thrilling experience trekking and exploring the beauty of Kashmir valley.', 28000.00, 'Kashmir', '2024-06-15', '2024-06-25', 'Adventure'),
('Madhya Pradesh Temple Tour', 'A religious and cultural tour of Madhya Pradesh with visits to famous temples.', 17000.00, 'Madhya Pradesh', '2024-08-10', '2024-08-20', 'Cultural'),
('Ooty Hill Station Experience', 'A serene getaway to Ooty with tea gardens and hill station beauty.', 12000.00, 'Ooty', '2024-07-10', '2024-07-15', 'Relaxation'),
('Coorg Coffee Plantation Tour', 'A getaway to Coorg, famous for its coffee plantations and scenic landscapes.', 16000.00, 'Coorg', '2024-09-05', '2024-09-12', 'Relaxation');

-- Inserting sample data into Bookings table
INSERT INTO Bookings (customer_id, package_id, total_price, booking_status) VALUES
(1, 1, 25000.00, 'Confirmed'),
(2, 2, 15000.00, 'Pending'),
(3, 3, 18000.00, 'Confirmed'),
(4, 4, 22000.00, 'Cancelled'),
(5, 5, 30000.00, 'Confirmed'),
(6, 6, 20000.00, 'Confirmed'),
(7, 7, 28000.00, 'Pending'),
(8, 8, 17000.00, 'Confirmed'),
(9, 9, 12000.00, 'Confirmed'),
(10, 10, 16000.00, 'Pending');

-- Inserting sample data into Payments table
INSERT INTO Payments (booking_id, amount_paid, payment_method) VALUES
(1, 25000.00, 'Credit Card'),
(2, 0.00, 'UPI'),
(3, 18000.00, 'Debit Card'),
(4, 0.00, 'Cash'),
(5, 30000.00, 'Net Banking'),
(6, 20000.00, 'Credit Card'),
(7, 0.00, 'UPI'),
(8, 17000.00, 'Debit Card'),
(9, 12000.00, 'Net Banking'),
(10, 0.00, 'Cash');

-- Inserting sample data into Reviews table
INSERT INTO Reviews (customer_id, package_id, rating, review_text) VALUES
(1, 1, 5, 'A truly breathtaking experience trekking in the Himalayas. Highly recommended!'),
(2, 2, 4, 'Goa beaches were great, but the resort could be better in terms of food quality.'),
(3, 3, 5, 'The Rajasthan heritage tour was amazing, the forts and palaces were magnificent.'),
(4, 4, 2, 'The safari was disappointing, not many animals were visible, and the ride was uncomfortable.'),
(5, 5, 5, 'The Andaman Islands were paradise on earth. Amazing beaches and great resorts.'),
(6, 6, 4, 'Kerala’s backwaters were peaceful, but the houseboat was not as luxurious as expected.'),
(7, 7, 5, 'Kashmir valley was beautiful and adventurous. A must-visit for nature lovers.'),
(8, 8, 4, 'Madhya Pradesh’s temples were historic, but the tour was too rushed for my liking.'),
(9, 9, 5, 'Ooty was a peaceful hill station getaway, perfect for unwinding with beautiful views.'),
(10, 10, 5, 'Coorg’s coffee plantations and natural beauty made for a fantastic trip.');

-- Inserting sample data into Agents table
INSERT INTO Agents (name, contact_number, email) VALUES
('Amit Sharma', '9345678901', 'amit.sharma@travelagency.in'),
('Rita Desai', '9323456789', 'rita.desai@travelagency.in'),
('Manoj Gupta', '9182736450', 'manoj.gupta@travelagency.in');

-- Inserting sample data into AgentPackages table
INSERT INTO AgentPackages (agent_id, package_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 4),
(2, 5),
(3, 6),
(1, 7),
(2, 8),
(3, 9),
(1, 10);

-- Inserting sample data into Discounts table
INSERT INTO Discounts (package_id, discount_name, discount_percentage, valid_from, valid_until) VALUES
(1, 'Summer Adventure', 15.00, '2024-05-01', '2024-06-01'),
(2, 'Beach Getaway Discount', 10.00, '2024-06-01', '2024-07-31'),
(3, 'Cultural Heritage Special', 12.00, '2024-06-01', '2024-08-01'),
(4, 'Wildlife Safari Discount', 20.00, '2024-08-01', '2024-09-30'),
(5, 'Island Escape Offer', 5.00, '2024-09-01', '2024-11-01'),
(6, 'Backwaters Discount', 10.00, '2024-07-01', '2024-09-30'),
(7, 'Kashmir Trekking Sale', 15.00, '2024-06-01', '2024-06-15'),
(8, 'Temple Tour Offer', 10.00, '2024-07-01', '2024-08-10'),
(9, 'Ooty Relaxation Deal', 5.00, '2024-06-01', '2024-08-01'),
(10, 'Coorg Coffee Festival Discount', 10.00, '2024-08-01', '2024-09-30');

-- Inserting sample data into Activities table
INSERT INTO Activities (package_id, activity_name, activity_cost, activity_date) VALUES
(1, 'Trekking', 2000.00, '2024-06-02'),
(2, 'Scuba Diving', 3000.00, '2024-07-06'),
(3, 'Palace Visit', 1500.00, '2024-08-05'),
(4, 'Safari Ride', 5000.00, '2024-09-11'),
(5, 'Beach Snorkeling', 2500.00, '2024-11-02'),
(6, 'Houseboat Ride', 2000.00, '2024-10-07'),
(7, 'Camping', 3500.00, '2024-06-17'),
(8, 'Temple Visit', 1000.00, '2024-08-12'),
(9, 'Tea Garden Walk', 1200.00, '2024-07-11'),
(10, 'Coffee Tasting', 1500.00, '2024-09-06');

-- Inserting sample data into Feedback table
INSERT INTO Feedback (customer_id, feedback_text) VALUES
(1, 'Had an amazing time trekking in the Himalayas. Would love to go again!'),
(2, 'Goa was beautiful, but the resort could have been better in terms of amenities.'),
(3, 'Great cultural experience, the palaces were majestic.'),
(4, 'The safari didn’t live up to expectations, too short and uncomfortable.'),
(5, 'The Andaman trip was magical, everything was top-notch.'),
(6, 'The Kerala backwaters were serene, perfect for a peaceful vacation.'),
(7, 'Kashmir was fantastic, the trekking and views were out of this world.'),
(8, 'Madhya Pradesh temples were rich in history, though the trip could have been longer.'),
(9, 'Ooty was a perfect hill station getaway, with beautiful scenery and weather.'),
(10, 'Loved the coffee tour in Coorg. The plantations were so peaceful and scenic.');

-- Inserting sample data into TransportationDetails table
INSERT INTO TransportationDetails (package_id, mode_of_transport, departure_date, departure_time, arrival_date, arrival_time, transportation_cost) VALUES
(1, 'Flight', '2024-06-01', '10:00', '2024-06-01', '12:30', 5000.00),
(2, 'Train', '2024-07-05', '06:00', '2024-07-05', '14:00', 1500.00),
(3, 'Bus', '2024-08-01', '07:00', '2024-08-01', '18:00', 800.00),
(4, 'Safari Jeep', '2024-09-10', '09:00', '2024-09-10', '17:00', 3000.00),
(5, 'Flight', '2024-11-01', '08:00', '2024-11-01', '11:00', 6000.00),
(6, 'Boat', '2024-10-05', '10:30', '2024-10-05', '16:00', 2000.00),
(7, 'Bus', '2024-06-15', '05:30', '2024-06-15', '15:00', 1200.00),
(8, 'Train', '2024-07-10', '08:00', '2024-07-10', '14:30', 1000.00),
(9, 'Taxi', '2024-07-10', '11:00', '2024-07-10', '12:30', 500.00),
(10, 'Bus', '2024-09-05', '06:00', '2024-09-05', '13:00', 1000.00);
