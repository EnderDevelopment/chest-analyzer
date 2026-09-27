CREATE TABLE IF NOT EXISTS chests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    model VARCHAR(50) NOT NULL,
    x FLOAT NOT NULL,
    y FLOAT NOT NULL,
    z FLOAT NOT NULL,
    rarity VARCHAR(20) NOT NULL,
    opened BOOLEAN DEFAULT FALSE
);

INSERT INTO chests (model, x, y, z, rarity) VALUES
('prop_crate_01a', 100.0, 200.0, 300.0, 'Common'),
('prop_crate_02a', 150.0, 250.0, 350.0, 'Gold'),
('prop_crate_03a', 200.0, 300.0, 400.0, 'Diamond'),
('prop_crate_04a', 250.0, 350.0, 450.0, 'Void');