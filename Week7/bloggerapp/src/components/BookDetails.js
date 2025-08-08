
function BookDetails() {
  const books = [
    { id: 1, name: "Clean Code" },
    { id: 2, name: "Atomic Habits" },
    { id: 3, name: "You Don’t Know JS" },
  ];

  return (
    <div>
      <h2>Book Details</h2>
      <ul>
        {books.map((book) => (
          <li key={book.id}>{book.name}</li>
        ))}
      </ul>
    </div>
  );
}

export default BookDetails; 
