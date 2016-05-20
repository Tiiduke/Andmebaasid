import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.ArrayList;

public class UserCreator {


    private static void createPersons(int personCount) throws IOException{
        String[] firstnames = new String[] {"Mari-Liis", "Markus", "Tiit", "Aleksis", "Kerri", "Edgar", "Kristjan", "Carl-Robert", "Silver", "Oliver"};
        String[] lastnames = new String[] {"Targaryen", "Baratheon", "Lannister", "Greyjoy", "Stark", "Tyrell", "Martell", "Bolton"};

        try(BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("persons.txt"), "UTF-8"))){
            for(int i = 1; i < personCount + 1; i ++) {
                writer.write(i + " ");
                writer.write(firstnames[(int) (Math.random()*firstnames.length)] + " ");
                writer.write(lastnames[(int) (Math.random()*lastnames.length)]);
                writer.newLine();
            }
        }
    }

    private static void createAccounts(int personCount) throws IOException{
            try(BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("accounts.txt"), "UTF-8"))) {
                for(int i = 1; i < personCount + 1; i++) {
                    String gamerTag = "GamerTag#" + i;
                    writer.write(gamerTag + " ");
                    writer.write((int) (Math.random() * 3) + " ");
                    writer.write(i + " ");
                    writer.write((int) (Math.random() * 400) * 5 + " ");
                    writer.write((int) (Math.random() * 500) * 5 + " ");
                    writer.write(i + "");
                    writer.newLine();
            }
        }
    }

    private static void createCardsForPersons(int personCount) throws Exception{
        try(BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("usercards.txt"), "UTF-8"))){
            Cardreader cardreader = new Cardreader();
            ArrayList<Card> cards = cardreader.getCardArrayListFromInputName("CardDefs.xml");

            for(int i = 1; i < personCount + 1; i++) {
                for(int j = 0; j < 100; j++) {
                    Card card = cards.get((int) (Math.random() * 500));
                    if (!card.isCollectible())
                        continue;
                    writer.write("GamerTag#" + i + " ");
                    writer.write((int) (Math.random() * 500) + " ");
                    writer.write((int) (Math.random() * 5) + " ");
                    writer.write((int) (Math.random() * 2) + "");
                    writer.newLine();
                }
            }
        }

    }

    public static void main(String[] args) throws Exception{
        createCardsForPersons(50);
    }
}
