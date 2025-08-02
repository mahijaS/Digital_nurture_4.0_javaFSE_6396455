import React, { useState } from 'react';

function App() {
  const [count, setCount] = useState(1);
  const [amount, setAmount] = useState('');
  const [currency, setCurrency] = useState('Euro');

  const increment = () => {
    setCount(prev => prev + 1);
    sayHello();
    showStaticMessage();
  };

  const decrement = () => {
    setCount(prev => prev - 1);
  };

  const sayHello = () => {
    console.log("Hello!");
  };

  const showStaticMessage = () => {
    console.log("Static message: Value incremented!");
  };

  const sayWelcome = (msg) => {
    alert(msg);
  };

  const handleClick = (e) => {
    alert("I was clicked");
  };


  const handleSubmit = (e) => {
    e.preventDefault();
    let convertedAmount = 0;

    if (currency === 'Euro') {
      convertedAmount = amount * 80;
    } else if (currency === 'Dollar') {
      convertedAmount = amount * 70;
    } else if (currency === 'Yen') {
      convertedAmount = amount * 60;
    }

    alert(`Converting to ${currency} Amount is ${convertedAmount}`);
  };

  return (
    <div style={{ margin: '20px' }}>
      <h3>{count}</h3>
      <button onClick={increment}>Increment</button>{' '}
      <button onClick={decrement}>Decrement</button>{' '}
      <button onClick={() => sayWelcome("welcome")}>Say welcome</button>{' '}
      <button onClick={handleClick}>Click on me</button>

      <h1 style={{ color: 'green' }}>Currency Convertor!!!</h1>

      <form onSubmit={handleSubmit}>
        <label>
          Amount:
          <input
            type="number"
            value={amount}
            onChange={(e) => setAmount(e.target.value)}
          />
        </label>
        <br /><br />
        <label>
          Currency:
          <select
            value={currency}
            onChange={(e) => setCurrency(e.target.value)}
          >
            <option value="Euro">Euro</option>
            <option value="Dollar">Dollar</option>
            <option value="Yen">Yen</option>
          </select>
        </label>
        <br /><br />
        <button type="submit">Submit</button>
      </form>
    </div>
  );
}

export default App;
