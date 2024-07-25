# Event Management API

## Introduction

The Event Management API allows users to create and manage events and participants. Event organizers can create new events, view a list of all participants for a specific event, and limit the number of participants. Participants can register for events and view all events they are registered for.

## Setup

### Prerequisites

Before setting up the project, ensure you have the following installed:

- Ruby (version 3.0.2 or higher)
- Rails (version 7.1.3 or higher)
- MySQL
- Postman (for testing)

### Installation Steps

1. **Clone the repository**:
   
   Clone the repository to your local machine using the following command:
   ```bash
   git clone https://github.com/bug-king-solver/event_management_api.git
   cd event_management_api
2. **Install dependencie**

    Install the required gems by running:
    ```bash
    bundle install
3. **Set up the database**

    Create, migrate, and seed the database using the following commands:
    ```bash
    rails db:create
    rails db:migrate
    rails db:seed
4. **Start the Rails server**

    Start the Rails server to run the application locally:
    ```bash
    rails server
5. **Running Tests**

    Run the tests using the following command:
    ```bash
    bundle exec rspec
## Project Structure

### Models

1. Event: Manages the event details and validations.
2. Participant: Manages participant details and their association with events.

### Controllers

1. EventsController: Handles CRUD operations for events.
2. ParticipantsController: Handles CRUD operations for participants and manages their registrations.

### Validations and Associations

1. **Event**

    - Validations: Title presence, capacity presence, numericality, and greater than zero.
    - Associations: has_many :participants, dependent: :destroy.

2. **Participant**

    - Validations: Name presence, email presence, and email format.
    - Associations: belongs_to :event.
