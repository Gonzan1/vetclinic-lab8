# VetClinic - Veterinary Management System (Lab 7)

This is the Lab 7 version of the VetClinic application, enriched with Active Storage for pet profile photos and Action Text for rich clinical notes.

## Setup Instructions

To run this application on your local machine, follow these steps:

1. Install the required Ruby gems:
        bundle install

2. Setup the database (this will drop, create, migrate, and seed the database with sample photos and rich text):
        bin/rails db:setup

3. Start the Rails server:
        bin/rails server

## System Dependencies

To properly handle image variants (resizing and cropping for thumbnails), this application requires **libvips** to be installed on your system. 

Installation instructions depending on your OS:
* **Ubuntu/Debian (WSL):** `sudo apt install libvips`
* **macOS:** `brew install vips`
* **Arch Linux:** `sudo pacman -S libvips`

## Security Verification (Sanitization Check)

As part of the Action Text implementation, a Cross-Site Scripting (XSS) sanitization check was performed manually. 

**Result:** When injecting the script `<script>alert(1)</script>` into the Trix editor of a treatment's clinical notes, the script was properly sanitized by Action Text. Upon saving and viewing the show page, no alert was fired, and the script tags were neutralized and rendered as harmless text within the HTML output. The application is secure against basic XSS injections.