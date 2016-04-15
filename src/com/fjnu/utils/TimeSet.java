package com.fjnu.utils;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.SimpleFormatter;

/**
 * Created by yehao on 16/4/9.
 */
public class TimeSet {
    Calendar cal = Calendar.getInstance();

    public List<Date> GetTime(int weekday, int clazz) {
        List<Date> list = new ArrayList<>();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        int week=(Calendar.DAY_OF_WEEK+6) % 7;
        System.out.println(week);
        if (week >= weekday) {
            cal.add(Calendar.DAY_OF_MONTH, ((7-week+weekday)));
        } else {
            cal.add(Calendar.DAY_OF_MONTH, weekday - week);
        }
        cal.set(Calendar.HOUR_OF_DAY, (clazz-1) / 2 + 8);
        cal.set(Calendar.MINUTE, ((clazz-1) % 2) * 30);
        cal.set(Calendar.SECOND, 0);
        list.add(cal.getTime());
        cal.add(Calendar.DAY_OF_MONTH, 7);
        for (int i = 1; i < 20; i++) {
            list.add(cal.getTime());
            cal.add(Calendar.DAY_OF_MONTH, 7);
        }
        return list;
    }
}
