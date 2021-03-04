package com.javaweb.clothingstore.util;

public class PathUtil {
    private static String separator = System.getProperty("file.separator");
    public static String getImageBasePath() {
        String os = System.getProperty("os.name");
        String basePath = "";
        if (os.toLowerCase().startsWith("win")) {
            basePath = "D:/images";
        } else {
            basePath = "/home/derrek/image";
        }
        basePath = basePath.replace("/", separator);
        return basePath;
    }

    public static String getShopImagePath(long shopId) {
        String imagePath = "/upload/item/shop/" + shopId + "/";
        return imagePath.replace("/", separator);
    }

    public static String getHeadLineImagePath() {
        String imagePath = "/upload/home/";
        return imagePath.replace("/", separator);
    }
}
