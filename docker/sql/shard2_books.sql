CREATE TABLE IF NOT EXISTS books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(50) NOT NULL,
    published_date DATE,
    price NUMERIC(10, 2)
);

DO $$
BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO books (title, author, published_date, price)
        VALUES (
            'Book Title ' || i,
            'Author ' || i,
            CURRENT_DATE - (i * 10),
            round((random() * 100)::numeric, 2)
        );
    END LOOP;
END $$;

