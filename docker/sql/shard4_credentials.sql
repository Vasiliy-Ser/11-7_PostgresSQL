CREATE TABLE IF NOT EXISTS user_credentials (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    hashed_password VARCHAR(255) NOT NULL,
    salt VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DO $$
BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO user_credentials (user_id, hashed_password, salt)
        VALUES (
            i,
            md5('password_' || i),
            md5('salt_' || i)
        );
    END LOOP;
END $$;
