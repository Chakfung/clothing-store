package com.javaweb.clothingstore;

import com.javaweb.clothingstore.dto.ImageHolder;
import com.javaweb.clothingstore.util.ImageUtil;
import com.javaweb.clothingstore.util.PathUtil;
import org.junit.Test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

public class ImageUtilTest extends BaseTest {
    @Test
    public void addImgTest() {
        File shopImg = new File("C:\\Users\\Derrick\\Pictures\\t01f780585200f4a03d.jpg");
        try {
            InputStream is = new FileInputStream(shopImg);
            String fileName = shopImg.getName();
            String dest = PathUtil.getShopImagePath(1L);
            ImageHolder imageHolder = new ImageHolder(is, fileName);
            ImageUtil.generateThumbnail(imageHolder, dest);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }
}
