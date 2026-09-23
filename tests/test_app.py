import pytest
from unittest.mock import patch, MagicMock
from app import app


@pytest.fixture
def client():
    app.config["TESTING"] = True

    with app.test_client() as client:
        yield client


def test_home(client):
    response = client.get("/")

    assert response.status_code == 200
    assert b"Automated Cloud Deployment Pipeline" in response.data


@patch("app.get_db_connection")
def test_health_success(mock_connection, client):
    mock_connection.return_value = MagicMock()

    response = client.get("/health")

    assert response.status_code == 200
    assert response.json["status"] == "healthy"
    assert response.json["database"] == "connected"


@patch("app.get_db_connection")
def test_health_failure(mock_connection, client):
    mock_connection.side_effect = Exception("Database unavailable")

    response = client.get("/health")

    assert response.status_code == 500
    assert response.json["status"] == "unhealthy"
    assert response.json["database"] == "disconnected"