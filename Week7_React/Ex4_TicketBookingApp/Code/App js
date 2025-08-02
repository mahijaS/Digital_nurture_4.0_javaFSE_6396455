import React, { useState } from 'react';

function App() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  const flights = [
    { id: 1, from: 'Chennai', to: 'Delhi', time: '10:00 AM', price: 4500 },
    { id: 2, from: 'Mumbai', to: 'Bangalore', time: '1:30 PM', price: 3500 },
    { id: 3, from: 'Hyderabad', to: 'Kolkata', time: '6:45 PM', price: 5000 },
  ];

  const handleLogin = () => {
    setIsLoggedIn(true);
  };

  const handleLogout = () => {
    setIsLoggedIn(false);
  };

  return (
    <div style={{ padding: '20px', fontFamily: 'Arial' }}>
      <h1 style={{ color: 'navy' }}>✈️ Ticket Booking App</h1>

      {isLoggedIn ? (
        <>
          <button onClick={handleLogout}>Logout</button>
          <UserPage flights={flights} />
        </>
      ) : (
        <>
          <button onClick={handleLogin}>Login</button>
          <GuestPage flights={flights} />
        </>
      )}
    </div>
  );
}

function GuestPage({ flights }) {
  return (
    <div>
      <h2>Welcome Guest 👋</h2>
      <p>Please login to book your tickets.</p>
      <h3>Available Flights:</h3>
      <FlightTable flights={flights} showBookButton={false} />
    </div>
  );
}

function UserPage({ flights }) {
  const handleBook = (flight) => {
    alert(`Ticket booked from ${flight.from} to ${flight.to} at ₹${flight.price}`);
  };

  return (
    <div>
      <h2>Welcome User ✅</h2>
      <p>You can book your tickets now.</p>
      <FlightTable flights={flights} showBookButton={true} onBook={handleBook} />
    </div>
  );
}

function FlightTable({ flights, showBookButton, onBook }) {
  return (
    <table border="1" cellPadding="10" style={{ marginTop: '10px', borderCollapse: 'collapse' }}>
      <thead>
        <tr>
          <th>From</th>
          <th>To</th>
          <th>Time</th>
          <th>Price</th>
          {showBookButton && <th>Action</th>}
        </tr>
      </thead>
      <tbody>
        {flights.map(flight => (
          <tr key={flight.id}>
            <td>{flight.from}</td>
            <td>{flight.to}</td>
            <td>{flight.time}</td>
            <td>₹{flight.price}</td>
            {showBookButton && (
              <td>
                <button onClick={() => onBook(flight)}>Book</button>
              </td>
            )}
          </tr>
        ))}
      </tbody>
    </table>
  );
}

export default App;
