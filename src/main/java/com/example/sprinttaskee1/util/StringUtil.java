package com.example.sprinttaskee1.util;



import java.util.Arrays;
import java.util.Formatter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class StringUtil {

    private static final String REGEX = "(?<year>\\d{4})-(?<month>\\d{2})-(?<day>\\d{2})";
    private static final Pattern PATTERN = Pattern.compile(REGEX);
    private StringUtil() {
    }

    public static String changeFormat(String date) {
        String formattedDate = "";
        Matcher matcher = PATTERN.matcher(date);
        while (matcher.find()) {
            String year = matcher.group("year");
            String month = matcher.group("month");
            String day = matcher.group("day");
            formattedDate = "%s/%s/%s".formatted(month, day, year);
        }
        return formattedDate;
    }

}
