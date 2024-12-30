CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


DO $$
BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO users (username, email)
        VALUES (
            'user_' || i,
            'user_' || i || '@example.com'
        );
    END LOOP;
END $$;
