# FastAPI Book Management API

## Overview

This project is a RESTful API by codename built with FastAPI for managing a book collection. It provides comprehensive CRUD (Create, Read, Update, Delete) operations.

## Setup Procedure

### Prerequisites
- Python 3.7 or higher
- pip (Python package installer)

### Installation Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/codenamemomi/fastAPI_HNG_task2
   cd fastapi-book-project
   ```

2. Create a virtual environment (recommended in order to avoid conflicts):
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows use `venv\Scripts\activate`
   ```

3. Install the required packages:
   ```bash
   pip install -r requirements.txt
   ```

4. Run the application:
   ```bash
   uvicorn main:app 
   ```

5. Access the API at `http://127.0.0.1:8000/api/v1/books/`

## API Endpoints


### Create a Book
- **Endpoint**: `POST /books/`
- **Request Body**: 
  ```json
  {
    "title": "string",
    "author": "string",
    "publication_year": "integer",
    "genre": "string"
  }
  ```
- **Response**: 
  - Status: 201 Created
  - Body: The created book object.

### Get All Books
- **Endpoint**: `GET /books/`
- **Response**: 
  - Status: 200 OK
  - Body: A list of all books.

### Get a Single Book
- **Endpoint**: `GET /books/{book_id}`
- **Response**: 
  - Status: 200 OK
  - Body: The requested book object.
  - Status: 404 Not Found (if the book does not exist)

### Update a Book
- **Endpoint**: `PUT /books/{book_id}`
- **Request Body**: Same as Create a Book
- **Response**: 
  - Status: 200 OK
  - Body: The updated book object.

### Delete a Book
- **Endpoint**: `DELETE /books/{book_id}`
- **Response**: 
  - Status: 204 No Content
