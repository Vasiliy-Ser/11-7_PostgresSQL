CREATE TABLE IF NOT EXISTS stores (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    opening_date DATE,
    revenue NUMERIC(15, 2)
);

DO $$
BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO stores (name, location, opening_date, revenue)
        VALUES (
            'Store_' || i,
            'Location_' || i,
            CURRENT_DATE - (i * 5),
            round((random() * 1000000)::numeric, 2)
        );
    END LOOP;
END $$;
