//View all cards
CREATE VIEW view_all_cards AS
SELECT CardName,
CardTextInHand,
Cost,
ClassName,
RaceName as Race,
RarityName as Rarity,
TypeName as CardType,
SetName as CardSet FROM Card
JOIN Cardset ON (Card.Cardset = Cardset.Id)
JOIN Rarity ON (Card.Rarity = Rarity.Id)
JOIN Cardtype ON (Card.CardType = CardType.ID)
JOIN CardClass ON (Card.CardClass = CardClass.ID)
JOIN Race ON(Card.Race = Race.ID);
//View all cards with tag beast
CREATE VIEW view_all_beast_cards AS
SELECT * FROM view_all_cards
WHERE Race = 'Beast'
GROUP BY CardName,CardTextInHand,Cost,ClassName,Race,Rarity,CardType,CardSet;
//View all cards with tag demon
CREATE VIEW view_all_demon_cards AS
SELECT * FROM view_all_cards
WHERE Race = 'Demon'
GROUP BY CardName,CardTextInHand,Cost,ClassName,Race,Rarity,CardType,CardSet;
//View all cards with tag murloc
CREATE VIEW view_all_murloc_cards AS
SELECT * FROM view_all_cards
WHERE Race = 'Murloc'
GROUP BY CardName,CardTextInHand,Cost,ClassName,Race,Rarity,CardType,CardSet;
//View all cards with tag pirate
CREATE VIEW view_all_pirate_cards AS
SELECT * FROM view_all_cards
WHERE Race = 'Pirate'
GROUP BY CardName,CardTextInHand,Cost,ClassName,Race,Rarity,CardType,CardSet;
//View all cards with tag Dragon
CREATE VIEW view_all_dragon_cards AS
SELECT * FROM view_all_cards
WHERE Race = 'Dragon'
GROUP BY CardName,CardTextInHand,Cost,ClassName,Race,Rarity,CardType,CardSet;
//View all cards wtih tag Mech
CREATE VIEW view_all_mech_cards AS
SELECT * FROM view_all_cards
WHERE Race = 'Mech'
GROUP BY CardName,CardTextInHand,Cost,ClassName,Race,Rarity,CardType,CardSet;
//View all cards with tag Totem
CREATE VIEW view_all_totem_cards AS
SELECT * FROM view_all_cards
WHERE Race = 'Totem'
GROUP BY CardName,CardTextInHand,Cost,ClassName,Race,Rarity,CardType,CardSet;
//View all druid cards
CREATE VIEW view_all_druid_cards AS
SELECT * FROM view_all_cards
WHERE ClassName = 'Druid'
GROUP BY CardName,CardTextInHand,Cost,ClassName,Race,Rarity,CardType,CardSet;
//View all hunter cards
CREATE VIEW view_all_hunter_cards AS
SELECT * FROM view_all_cards
WHERE ClassName = 'Hunter'
GROUP BY CardName,CardTextInHand,Cost,ClassName,Race,Rarity,CardType,CardSet;
//View all mage cards
CREATE VIEW view_all_mage_cards AS
SELECT * FROM view_all_cards
WHERE ClassName = 'Mage'
GROUP BY CardName,CardTextInHand,Cost,ClassName,Race,Rarity,CardType,CardSet;
//View all priest cards
CREATE VIEW view_all_priest_cards AS
SELECT * FROM view_all_cards
WHERE ClassName = 'Priest'
GROUP BY CardName,CardTextInHand,Cost,ClassName,Race,Rarity,CardType,CardSet;
//View all shaman cards
CREATE VIEW view_all_shaman_cards AS
SELECT * FROM view_all_cards
WHERE ClassName = 'Shaman'
GROUP BY CardName,CardTextInHand,Cost,ClassName,Race,Rarity,CardType,CardSet;
//View all rogue cards
CREATE VIEW view_all_rogue_cards AS
SELECT * FROM view_all_cards
WHERE ClassName = 'Rogue'
GROUP BY CardName,CardTextInHand,Cost,ClassName,Race,Rarity,CardType,CardSet;
//View all warrior cards
CREATE VIEW view_all_warrior_cards AS
SELECT * FROM view_all_cards
WHERE ClassName = 'Warrior'
GROUP BY CardName,CardTextInHand,Cost,ClassName,Race,Rarity,CardType,CardSet;
//View all warlock cards
CREATE VIEW view_all_warlock_cards AS
SELECT * FROM view_all_cards
WHERE ClassName = 'Warlock'
GROUP BY CardName,CardTextInHand,Cost,ClassName,Race,Rarity,CardType,CardSet;
//View all paladin cards
CREATE VIEW view_all_paladin_cards AS
SELECT * FROM view_all_cards
WHERE ClassName = 'Paladin'
GROUP BY CardName,CardTextInHand,Cost,ClassName,Race,Rarity,CardType,CardSet;