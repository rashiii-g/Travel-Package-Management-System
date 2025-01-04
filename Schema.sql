DROP DATABASE IF EXISTS travel_package;
CREATE DATABASE travel_package;
USE travel_package;

-- Customers table to store traveler information
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) NOT NULL,
    city VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Packages table to store details of travel packages
CREATE TABLE Packages (
    package_id INT AUTO_INCREMENT PRIMARY KEY,
    package_name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    destination VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    package_type ENUM('Adventure', 'Relaxation', 'Cultural', 'Wildlife') NOT NULL
);

-- Bookings table to store customer bookings
CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    package_id INT NOT NULL,
    booking_date DATE DEFAULT CURRENT_DATE,
    total_price DECIMAL(10, 2) NOT NULL,
    booking_status ENUM('Pending', 'Confirmed', 'Cancelled') NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (package_id) REFERENCES Packages(package_id) ON DELETE CASCADE
);

-- Payments table to record payment information
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    payment_date DATE DEFAULT CURRENT_DATE,
    amount_paid DECIMAL(10, 2) NOT NULL,
    payment_method ENUM('Credit Card', 'Debit Card', 'UPI', 'Net Banking', 'Cash') NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id) ON DELETE CASCADE
);

-- Reviews table to store customer reviews for packages
CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    package_id INT NOT NULL,
    rating INT CHECK(rating BETWEEN 1 AND 5),
    review_text TEXT,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (package_id) REFERENCES Packages(package_id) ON DELETE CASCADE
);

-- Agents table to store agent information
CREATE TABLE Agents (
    agent_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- AgentPackages table to link agents with packages they manage
CREATE TABLE AgentPackages (
    agent_package_id INT AUTO_INCREMENT PRIMARY KEY,
    agent_id INT NOT NULL,
    package_id INT NOT NULL,
    FOREIGN KEY (agent_id) REFERENCES Agents(agent_id) ON DELETE CASCADE,
    FOREIGN KEY (package_id) REFERENCES Packages(package_id) ON DELETE CASCADE
);

-- Discounts table to store discount details for packages
CREATE TABLE Discounts (
    discount_id INT AUTO_INCREMENT PRIMARY KEY,
    package_id INT NOT NULL,
    discount_name VARCHAR(50) NOT NULL,
    discount_percentage DECIMAL(5, 2) NOT NULL,
    valid_from DATE NOT NULL,
    valid_until DATE NOT NULL,
    FOREIGN KEY (package_id) REFERENCES Packages(package_id) ON DELETE CASCADE
);

-- Activities table to record activities within a package
CREATE TABLE Activities (
    activity_id INT AUTO_INCREMENT PRIMARY KEY,
    package_id INT NOT NULL,
    activity_name VARCHAR(100) NOT NULL,
    activity_cost DECIMAL(10, 2) CHECK (activity_cost >= 0),
    activity_date DATE NOT NULL,
    FOREIGN KEY (package_id) REFERENCES Packages(package_id) ON DELETE CASCADE
);

-- Feedback table to store general customer feedback
CREATE TABLE Feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    feedback_text TEXT NOT NULL,
    feedback_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

-- TransportationDetails table to store transportation-related details for packages
CREATE TABLE TransportationDetails (
    transportation_id INT AUTO_INCREMENT PRIMARY KEY,
    package_id INT NOT NULL,
    mode_of_transport ENUM('Bus', 'Train', 'Flight', 'Boat') NOT NULL,
    departure_date DATE,
    departure_time TIME,
    arrival_date DATE,
    arrival_time TIME,
    transportation_cost DECIMAL(10, 2) CHECK (transportation_cost >= 0),
    FOREIGN KEY (package_id) REFERENCES Packages(package_id) ON DELETE CASCADE
);