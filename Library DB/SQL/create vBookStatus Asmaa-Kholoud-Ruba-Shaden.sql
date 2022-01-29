
CREATE VIEW vBookStatus AS
SELECT author.auth_id , author.fname ,author.lname,book.book_id  ,book.book_title ,book.state  
from Written_by, author,book
where written_by.auth_id = author.auth_id and written_by.book_id= book.book_id and book.state='Available';




