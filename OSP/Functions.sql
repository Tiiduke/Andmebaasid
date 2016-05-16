//Function to calculate how much dust one card entry is worth
CREATE FUNCTION f_brutoDust(count INTEGER, rarity INTEGER, golden BIT)
RETURNS INTEGER
DETERMINISTIC
BEGIN 
    DECLARE dustSum INTEGER;
    DECLARE base INTEGER;
    IF (rarity = 1 AND golden = 0) THEN
        SET base = 40;
    ELSEIF (rarity = 3 AND golden = 0) THEN
        SET base = 100;
    ELSEIF (rarity = 4 AND golden = 0) THEN
        SET base = 400;
    ELSEIF (rarity = 5 AND golden = 0) THEN 
        SET base = 1600;
    ELSEIF (rarity = 1 AND golden = 1) THEN
        SET base = 400;
    ELSEIF (rarty = 3 AND golden = 1) THEN
        SET base = 800;
    ELSEIF (rarity = 4 AND golden = 1) THEN
        SET base = 1600;
    ELSEIF (rarity = 5 AND golden = 2) THEN
        SET base = 3200;
    ELSEIF (rarity = 2) THEN
        SET base = 0;
    ENDIF;
    SET dustSum = base * count;
    RETURN dustSum;
END;