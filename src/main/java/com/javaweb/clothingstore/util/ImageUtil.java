package com.javaweb.clothingstore.util;


import com.javaweb.clothingstore.dto.ImageHolder;
import net.coobird.thumbnailator.Thumbnails;

import java.io.File;
import java.io.IOException;


public class ImageUtil {
    public static String generateThumbnail(ImageHolder thumbnail, String targetAddr) {
        String realFileName = FileUtil.getRandomFileName();
        String extension = getFileExtension(thumbnail.getImageName());
        makeDirPath(targetAddr);
        String relativeAddr = targetAddr + realFileName + extension;
        File dest = new File(PathUtil.getImageBasePath() + relativeAddr);
        try {
            Thumbnails.of(thumbnail.getImage()).size(388, 500).outputQuality(0.25f).toFile(dest);
        } catch (IOException e) {
            throw new RuntimeException("创建缩略图失败：" + e.toString());
        }
        return relativeAddr;
    }

    public static String generatehlThumbnail(ImageHolder thumbnail, String targetAddr) {
        String realFileName = FileUtil.getRandomFileName();
        String extension = getFileExtension(thumbnail.getImageName());
        makeDirPath(targetAddr);
        String relativeAddr = targetAddr + realFileName + extension;
        File dest = new File(PathUtil.getImageBasePath() + relativeAddr);
        try {
            Thumbnails.of(thumbnail.getImage()).scale(1.0).toFile(dest);
        } catch (IOException e) {
            throw new RuntimeException("创建缩略图失败：" + e.toString());
        }
        return relativeAddr;
    }

    public static String generateNormalImg(ImageHolder thumbnail, String targetAddr) {
        String realFileName = FileUtil.getRandomFileName();
        String extension = getFileExtension(thumbnail.getImageName());
        makeDirPath(targetAddr);
        String relativeAddr = targetAddr + realFileName + extension;
        File dest = new File(PathUtil.getImageBasePath() + relativeAddr);
        try {
            Thumbnails.of(thumbnail.getImage()).size(388, 500).outputQuality(0.5f).toFile(dest);
        } catch (IOException e) {
            throw new RuntimeException("创建缩略图失败：" + e.toString());
        }
        return relativeAddr;
    }

    /*public static List<String> generateNormalImgs(List<CommonsMultipartFile> imgs, String targetAddr) {
        int count = 0;
        List<String> relativeAddrList = new ArrayList<String>();
        if (imgs != null && imgs.size() > 0) {
            makeDirPath(targetAddr);
            for (CommonsMultipartFile img : imgs) {
                String realFileName = FileUtil.getRandomFileName();
                String extension = getFileExtension(img);
                String relativeAddr = targetAddr + realFileName + count + extension;
                File dest = new File(FileUtil.getImgBasePath() + relativeAddr);
                count++;
                try {
                    Thumbnails.of(img.getInputStream()).size(600, 300).outputQuality(0.5f).toFile(dest);
                } catch (IOException e) {
                    throw new RuntimeException("创建图片失败：" + e.toString());
                }
                relativeAddrList.add(relativeAddr);
            }
        }
        return relativeAddrList;
    }*/

    private static void makeDirPath(String targetAddr) {
        String realFileParentPath = PathUtil.getImageBasePath() + targetAddr;
        File dirPath = new File(realFileParentPath);
        if (!dirPath.exists()) {
            dirPath.mkdirs();
        }
    }

    private static String getFileExtension(String  fileName) {
        return fileName.substring(fileName.lastIndexOf("."));
    }

    public static void deleteFileorPath(String storePath) {
        File fileOrPath = new File(PathUtil.getImageBasePath()+storePath);
        if (fileOrPath.exists()) {
            if (fileOrPath.isDirectory()) {
                File files[] = fileOrPath.listFiles();
                for (int i = 0; i < files.length; i++) {
                    files[i].delete();
                }
            }
            fileOrPath.delete();
        }
    }
}
