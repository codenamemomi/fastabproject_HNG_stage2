import secrets
from pydantic_settings import BaseSettings

class ProductionSettings(BaseSettings):
    PROJECT_NAME: str = "hng12-stage2"
    PROJECT_VERSION: str = "0.0.1"
    PROJECT_DESCRIPTION: str = "A FastAPI project for managing a book collection."
    DATABASE_URL: str = "your_database_url_here"  # Update with actual database URL
    API_KEY: str = secrets.token_hex(16)  # Example of generating a secret API key

settings = ProductionSettings()
