import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import sun.plugin.dom.core.Document;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.File;

/**
 * Created by Tiit on 2.04.2016.
 */
//Test
public class Cardreader {



    public static void assignProperty(Card card, Element element) {
        switch(element.getAttribute("name")) {
            case "CardName": NodeList languages = element.getElementsByTagName("enUS");
                System.out.println(languages.item(0).getTextContent()); break;
            default: break;

        }
    }

    public static void main(String[] args) throws Exception{
        File input = new File("CardDefs.xml");
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        org.w3c.dom.Document document = builder.parse(input);

        NodeList cardList = document.getElementsByTagName("Entity");

        for (int i = 0; i < cardList.getLength(); i++) {
            Node node = cardList.item(i);

            if (node.getNodeType() == Node.ELEMENT_NODE) {
                Card card = new Card();

                Element element = (Element) node;

                NodeList properties = element.getElementsByTagName("Tag");

                for (int j = 0; j < properties.getLength(); j++) {
                    Element property = (Element) properties.item(j);
                    assignProperty(card, property);
                }

            }

        }
    }
}
