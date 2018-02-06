package com.test;

import org.junit.Test;

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

/**
 * Created by hedefu on 08/10/2017.
 */
public class UtilTest {
    @Test
    public void testBaseJFrame(){
        JFrame frame = new JFrame();
        JPanel panel = new JPanel();
        JTextArea textArea = new JTextArea();

        panel.setLayout(new GridLayout());
        textArea.setText("test");
        //当TextArea里的内容过长时生成滚动条
        panel.add(new JScrollPane(textArea));
        frame.add(panel);

        frame.setSize(200,200);
        frame.setVisible(true);
    }
    @Test
    public void testValidationImg(){
        JFrame jFrame = new JFrame("测试生成的图片");
        jFrame.add(new ImagePanel());
        jFrame.setSize(400, 300);
        jFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        jFrame.setVisible(true);
    }

    private class ImagePanel extends JPanel {
        private BufferedImage image;
        public ImagePanel() {
            try {
                image = ImageIO.read(new File("/Users/hedefu/WorkSpace/IntelliJIDEA/wardmatenet/web/imgs/avatar.png"));
            } catch (IOException e) {
                e.printStackTrace();
            }
//            image = ValidationCodeImg.createImg("12358");
        }

        @Override
        protected void paintComponent(Graphics g) {
            g.drawImage(image,0,0,null);
        }
    }
}
