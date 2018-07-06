import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Testdays {

    public static int getDutyDays(String strStartDate,String strEndDate) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate=null;
        Date endDate = null;

        try {
            startDate=df.parse(strStartDate);
            endDate = df.parse(strEndDate);
        } catch (ParseException e) {
            System.out.println("非法的日期格式,无法进行转换");
            e.printStackTrace();
        }
        int result = 0;
        while (startDate.compareTo(endDate) <= 0) {
            if (startDate.getDay() != 6 && startDate.getDay() != 0)
                result++;
            startDate.setDate(startDate.getDate() + 1);
        }

        return result;
    }


    public static void main(String[] args) {
       // System.out.println(getDutyDays("2018-06-22","2018-06-25"));

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
        String dateStr = sdf.format(new Date());
        Integer HHmm = Integer.valueOf(dateStr.substring(8,dateStr.length()));
        System.out.println(1500>HHmm&&HHmm>1245);

    }
}
