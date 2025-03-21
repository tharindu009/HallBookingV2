# Venue Booking System (ASP.NET)

This repository contains the source code for a Venue Booking System developed using ASP.NET.

## Table of Contents

- [Project Description](#project-description)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Configuration](#configuration)
  - [Running the Application](#running-the-application)
- [Database Setup](#database-setup)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Project Description

This project aims to provide a web-based platform for users to browse and book venues for various events. It includes features for venue owners to manage their venues and bookings, and for users to search, view, and book available venues.

## Features

-   **User Authentication and Authorization:** Secure user login and registration with role-based access control.
-   **Venue Management:**
    -      Add, edit, and delete venue details (name, description, capacity, location, images).
    -      Manage venue availability and pricing.
-   **Booking Management:**
    -      Users can search for venues based on criteria (date, location, capacity).
    -      Users can view venue details and availability.
    -      Users can make booking requests.
    -      Venue owners can reply to booking requests.
    -   View booking history.
-   **Search and Filtering:** Robust search functionality to find venues based on various criteria.
-   **Image Uploads:** Allow venue owners to upload images of their venues.
-   **Admin Panel:** Administrative interface for managing users, venues, and bookings.
-   **Date and Time Selection:** User-friendly date and time pickers for booking.
-   **Responsive Design:** Ensures the application is accessible on various devices.

## Technologies Used

-   **ASP.NET Core:** Web framework for building the application.
-   **C#:** Programming language.
-   **Entity Framework Core:** ORM for database interactions.
-   **SQL Server (or other database):** Database management system.
-   **HTML, CSS, JavaScript:** Front-end technologies.
-   **Bootstrap (or other CSS framework):** For responsive design.
-   **jQuery (optional):** JavaScript library for DOM manipulation.
-   **ASP.NET Identity:** For user authentication and authorization.

## Getting Started

### Prerequisites

-   [.NET SDK](https://dotnet.microsoft.com/download) (latest stable version)
-   [SQL Server](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) (or another supported database)
-   [Visual Studio](https://visualstudio.microsoft.com/downloads/) (or Visual Studio Code with C# extension)

### Installation

1.  Clone the repository:

    ```bash
    git clone [https://github.com/your-username/venue-booking-system.git](https://www.google.com/search?q=https://github.com/your-username/venue-booking-system.git)
    cd venue-booking-system
    ```

2.  Open the solution file (`.sln`) in Visual Studio.

3.  Restore NuGet packages:

    -   In Visual Studio, right-click on the solution and select "Restore NuGet Packages."
    -   Or, use the .NET CLI: `dotnet restore`

### Configuration

1.  **Database Connection:**
    -   Open the `appsettings.json` file.
    -   Update the connection string in the `ConnectionStrings` section to match your database configuration.
    ```json
    "ConnectionStrings": {
      "DefaultConnection": "Server=(localdb)\\mssqllocaldb;Database=VenueBookingDB;Trusted_Connection=True;MultipleActiveResultSets=true"
    }
    ```
    Replace the server and database name with your own.

2.  **User Secrets (Optional):**
    - For sensitive information, use user secrets.
    - Right-click on the project in Visual Studio and select "Manage User Secrets."
    - Add your sensitive configuration values.

### Running the Application

1.  **Database Migration:**
    -   Open the Package Manager Console in Visual Studio.
    -   Run the following commands:
        ```powershell
        Add-Migration InitialCreate
        Update-Database
        ```
        This will create the database and tables based on your Entity Framework Core models.

2.  **Run the Application:**
    -   Press F5 in Visual Studio or use the .NET CLI: `dotnet run`
    -   Open your web browser and navigate to the URL displayed in the console.

## Database Setup

-   Ensure you have a SQL Server instance running.
-   The Entity Framework Core migrations will create the necessary database tables.
-   You may need to create an initial admin user manually or via a seed method.

## Contributing

Contributions are welcome! Please follow these steps:

1.  Fork the repository.
2.  Create a new branch for your feature or bug fix.
3.  Commit your changes.
4.  Push your branch to your forked repository.
5.  Submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

## Contact

For any questions or issues, please contact:

-   EVESYS Technologies
-   tharindu009@hotmail.com
-   [GitHub Issues](https://github.com/your-username/venue-booking-system/issues)
