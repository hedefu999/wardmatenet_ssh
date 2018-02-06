package com.utils;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Random;

/**
 * Created by hedefu on 08/10/2017.
 */
public class ValidationImg {
    public static BufferedImage createImg(String validationCode){
        int codeLength = validationCode.length();
        int fontSize = 20;
        int imgWidth = codeLength * (fontSize + 5) ;
        int imgHeight = fontSize * 2;
        BufferedImage image = new BufferedImage(imgWidth,imgHeight,BufferedImage.TYPE_3BYTE_BGR);
        Graphics g = image.createGraphics();
        //绘制边框和背景
        g.setColor(Color.WHITE);
        g.fillRect(0,0,imgWidth,imgHeight);
        g.setColor(Color.GRAY);//设置即将绘制的图片边框颜色
        g.setFont(new Font("Arial",Font.BOLD,imgHeight-2));
        g.drawRect(0,0,imgWidth-1,imgHeight-1);
        //绘制彩色噪点
        Random rand = new Random();
        Color[] dotColor = {Color.BLACK,Color.RED,Color.BLUE,Color.YELLOW,Color.ORANGE,Color.GREEN,Color.PINK};
        for(int i = 0; i < codeLength * 6; i++){
            int x = rand.nextInt(imgWidth);
            int y = rand.nextInt(imgHeight);
            g.setColor(dotColor[rand.nextInt(7)]);
            g.drawRect(x,y,1,1);
        }
        //绘制文字
        g.setColor(Color.GRAY);
        g.setFont(new Font("Arial",Font.PLAIN,fontSize+5));
        for (int i = 0; i < codeLength; i++){
            g.drawString(String.valueOf(validationCode.charAt(i)),i*fontSize+10,imgHeight - 10);
        }
        //关闭资源
        g.dispose();
        return image;
    }
    public static ByteArrayInputStream getImageAsInputStream(String validationCode){
        BufferedImage image = createImg(validationCode);
        return convertImageToStream(image);
    }
    private static ByteArrayInputStream convertImageToStream(BufferedImage image){
        ByteArrayInputStream inputStream = null;
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        JPEGImageEncoder jpeg = JPEGCodec.createJPEGEncoder(bos);
        try {
            jpeg.encode(image);
            byte[] bts = bos.toByteArray();
            inputStream = new ByteArrayInputStream(bts);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return inputStream;
    }

}
