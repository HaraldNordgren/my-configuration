import java.io.PrintWriter;
import java.io.File;
import java.io.IOException;

public class Hangman {
    
    public static void main(String[] args) throws IOException {

        File score_data = new File("score_data.txt");

        PrintWriter writer = new PrintWriter(score_data, "UTF-8");
        writer.println("Hej");

        writer.close();

    }
}
