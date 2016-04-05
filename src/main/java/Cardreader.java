import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import sun.plugin.dom.core.Document;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.File;
import java.util.ArrayList;

/**
 * Created by Tiit on 2.04.2016.
 */
//Test
public class Cardreader {

    public static ArrayList<Card> getCardArrayListFromInputName(String filename) throws Exception{

        File input = new File(filename);

        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        org.w3c.dom.Document document = builder.parse(input);

        NodeList cardList = document.getElementsByTagName("Entity");

        ArrayList<Card> cards = new ArrayList<>();

        for (int i = 0; i < cardList.getLength(); i++) {

            Node cardAsXML = cardList.item(i);

            Card card = new Card();

            Element cardElement = (Element) cardAsXML;
            NodeList properties = cardElement.getElementsByTagName("Tag");

            assignProperties(card, properties);

            cards.add(card);
        }

        return cards;
    }

    public static void assignProperty(Card card, Element element) {

        String attribute = element.getAttribute("value");
        NodeList languages = element.getElementsByTagName("enUS");

        switch(element.getAttribute("name")) {
            case "CardName": card.setName(languages.item(0).getTextContent()); break;
            case "CardSet": card.setCardSet(Integer.parseInt(attribute)); break;
            case "Collectible": card.setCollectible("1".equals(attribute)); break;
            case "Rarity": card.setRarity(Integer.parseInt(attribute)); break;
            case "CardType": card.setCardType(Integer.parseInt(attribute)); break;
            case "Cost": card.setCost(Integer.parseInt(attribute)); break;
            case "Class": card.setClassType(Integer.parseInt(attribute)); break;
            case "CardTextInHand": card.setTextOnCard(languages.item(0).getTextContent()); break;
            case "FlavorText": card.setFlavorText(languages.item(0).getTextContent()); break;
            case "ArtistName": card.setArtistName(element.getTextContent());
            default: break;
        }
    }

    public static void assignProperties(Card card, NodeList properties) {
        for (int j = 0; j < properties.getLength(); j++) {
            Element property = (Element) properties.item(j);
            assignProperty(card, property);
        }
    }

    public static void main(String[] args) throws Exception{

        ArrayList<Card> cards = getCardArrayListFromInputName("CardDefs.xml");

        for (Card card : cards)
            System.out.println(card);
    }
}
