import java.util.*;
import java.text.*;

public class StringDemo {
    public static void main(String[] args) {

        String strDate = "Tue, 09 Feb 2016 14:07:00 GMT";
        DateFormat format = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss z");

        Date date;
        try {
            format.setTimeZone(TimeZone.getTimeZone("GMT"));
            date = format.parse(strDate);

            System.out.println("Result: " + format.format(date));

        } catch(ParseException e) {
            e.printStackTrace();
        }
    }
}
