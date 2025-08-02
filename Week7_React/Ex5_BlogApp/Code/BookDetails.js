
import React from 'react';

function BookDetails({ books }) {
  return (
    <div className="st2">
      <h1>Book Details</h1>
      {books.length > 0 ? (
        books.map(book => (
          <div key={book.id}>
            <h3>{book.bname}</h3>
            <h4>{book.price}</h4>
          </div>
        ))
      ) : (
        <p>No Books Available</p>
      )}
    </div>
  );
}

export default BookDetails;
