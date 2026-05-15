# VetClinic - Authentication (Lab 8)

This application has been updated to include user authentication using the **Devise** gem. 

## Application Security
The application is no longer fully open to the public. 
* The **Home (root) page** remains public for anonymous visitors.
* All other resource pages (Owners, Pets, Vets, Appointments, Treatments) are protected and require the user to sign in.

## Setup Instructions

To run this application locally:

1. Install the required gems:
        bundle install
2. Setup the database (this will drop, create, migrate, and seed the database):
        bin/rails db:setup
3. Start the server:
        bin/rails server

## Seeded Users Credentials

The database is seeded with three default users (one for each role). You can use these credentials to sign in and test the application:

**1. Admin User**
* **Email:** admin@vetclinic.com
* **Password:** password123

**2. Veterinarian User**
* **Email:** vet@vetclinic.com
* **Password:** password123

**3. Pet Owner User**
* **Email:** owner@vetclinic.com
* **Password:** password123

## Customizations
* **User Model:** Extended the default Devise User model to include `first_name` (string), `last_name` (string), and `role` (integer enum: owner, vet, admin).
* **Strong Parameters:** Overrode Devise's `configure_permitted_parameters` in the ApplicationController to permit `first_name` and `last_name` during sign-up and account updates. The `role` attribute is intentionally restricted and cannot be assigned via user-facing forms.
* **Views:** Cloned Devise views and styled them with Bootstrap (specifically the sign-in, sign-up, and edit-account forms).