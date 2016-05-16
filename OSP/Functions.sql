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
//Function to get single user total dust
CREATE FUNCTION f_userBrutoDust(gamertag varchar(30))
RETURNS INTEGER
BEGIN
    DECLARE totalBrutoDust INTEGER;
    SELECT SUM(f_brutoDust(Count,Card.Rarity,Golden)) INTO totalBrutoDust FROM User_has_card
    JOIN Card ON(User_Has_Card.CardId = Card.ID)
    WHERE Account_Gamertag = gamertag;
    RETURN totalBrutoDust
END;
//Function to get single card net dust
CREATE FUNCTION f_netDust(count INTEGER, rarity INTEGER, golden BIT)
RETURNS INTEGER
DETERMINISTIC
BEGIN 
    DECLARE dustSum INTEGER;
    DECLARE base INTEGER;
    IF (rarity = 1 AND golden = 0) THEN
        SET base = 5;
    ELSEIF (rarity = 3 AND golden = 0) THEN
        SET base = 20;
    ELSEIF (rarity = 4 AND golden = 0) THEN
        SET base = 100;
    ELSEIF (rarity = 5 AND golden = 0) THEN 
        SET base = 400;
    ELSEIF (rarity = 1 AND golden = 1) THEN
        SET base = 50;
    ELSEIF (rarty = 3 AND golden = 1) THEN
        SET base = 100;
    ELSEIF (rarity = 4 AND golden = 1) THEN
        SET base = 400;
    ELSEIF (rarity = 5 AND golden = 2) THEN
        SET base = 1600;
    ELSEIF (rarity = 2) THEN
        SET base = 0;
    ENDIF;
    SET dustSum = base * count;
    RETURN dustSum;
END;
//Function to get user netoDust
CREATE FUNCTION f_userNetoDust(gamertag varchar(30))
RETURNS INTEGER
BEGIN
    DECLARE totalNetoDust INTEGER;
    SELECT SUM(f_NetoDust(Count,Card.Rarity,Golden)) INTO totalNetoDust FROM User_has_card
    JOIN Card ON(User_Has_Card.CardId = Card.ID)
    WHERE Account_Gamertag = gamertag;
    RETURN totalNetoDust;
END;