/**
 * Created by Tiit on 2.04.2016.
 */
public class Card {

    private String name;
    private int cardSet, rarity,cardType,cost,classType;
    private boolean collectible;
    private String textOnCard,flavorText;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCardSet() {
        return cardSet;
    }

    public void setCardSet(int cardSet) {
        this.cardSet = cardSet;
    }

    public boolean isCollectible() {
        return collectible;
    }

    public void setCollectible(boolean collectible) {
        this.collectible = collectible;
    }

    public int getRarity() {
        return rarity;
    }

    public void setRarity(int rarity) {
        this.rarity = rarity;
    }

    public int getCardType() {
        return cardType;
    }

    public void setCardType(int cardType) {
        this.cardType = cardType;
    }

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public int getClassType() {
        return classType;
    }

    public void setClassType(int classType) {
        this.classType = classType;
    }

    public String getTextOnCard() {
        return textOnCard;
    }

    public void setTextOnCard(String textOnCard) {
        this.textOnCard = textOnCard;
    }

    public String getFlavorText() {
        return flavorText;
    }

    public void setFlavorText(String flavorText) {
        this.flavorText = flavorText;
    }
}
