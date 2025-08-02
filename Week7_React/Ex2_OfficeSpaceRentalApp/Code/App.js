import React from 'react';
import './App.css';

function App() {
  const heading = "Office Space Rentals";

  const officeList = [
    {
      Name: "DBS Business Center",
      Rent: 50000,
      Address: "Chennai",
      Image: "/dbs.jpg"
    },
    {
      Name: "Regus Workspace",
      Rent: 75000,
      Address: "Bangalore",
      Image: "/regus.jpeg"
    },
    {
      Name: "SmartWorks",
      Rent: 60000,
      Address: "Hyderabad",
      Image: "/smartworks.jpeg"
    },
    {
      Name: "CoWrks",
      Rent: 85000,
      Address: "Mumbai",
      Image: "/CoWrks.jpeg"
    }
  ];

  return (
    <div className="App">
      <h1>{heading}</h1>

      <div className="office-container">
        {officeList.map((office, index) => {
          const rentClass = office.Rent <= 60000 ? "textRed" : "textGreen";

          return (
            <div key={index} className="office-card">
              <img src={office.Image} alt={office.Name} width="300" height="200" />
              <h2>Name: {office.Name}</h2>
              <h3 className={rentClass}>Rent: ₹{office.Rent}</h3>
              <h3>Address: {office.Address}</h3>
            </div>
          );
        })}
      </div>
    </div>
  );
}

export default App;
