import org.w3c.dom.NodeList;
import sun.plugin.dom.core.Document;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.File;

/**
 * Created by Tiit on 2.04.2016.
 */
public class Cardreader {

    public static void main(String[] args) throws Exception{
        File input = new File("CardDefs.xml");
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        org.w3c.dom.Document document = builder.parse(input);

        NodeList cardList = document.getElementsByTagName("Entity");

    }
}
